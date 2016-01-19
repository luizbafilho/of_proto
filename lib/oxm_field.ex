defmodule OfProto.Messages.OxmField do
  import OfProto.Constants

  @match_size 8

  defstruct class: :OFPXMC_OPENFLOW_BASIC,
            has_mask: false,
            field: nil,
            mask: <<>>,
            value: <<>>

  def decode(bin), do: decode_fields(bin)

  def decode_fields(bin), do: decode_fields(bin, [])
  def decode_fields(<<>>, fields), do: Enum.reverse fields
  def decode_fields(bin, fields) do
    {field, rest} = decode_field(bin)
    decode_fields(rest, [field | fields])
  end

  def decode_field(<<header::binary-size(4), bin::binary>>) do
    <<class_int::16, field_int::7, has_mask_int::1, length::8>> = header
    class = value_to_atom(ofp_oxm_class, class_int)

    has_mask = has_mask_int == 1

    {field, bit_length} =
      case class do
        :OFPXMC_OPENFLOW_BASIC ->
          oxm_ofb_match_fields |> Enum.at(field_int)
        _ ->
          {field_int, length * 8}
      end

    case has_mask do
      false ->
        <<value::size(bit_length), rest::binary>> = bin
        {%OfProto.Messages.OxmField{value: value, has_mask: has_mask, class: field}, rest}
      true ->
        len = div(bit_length, 2)
        <<value::size(len), mask::size(len), rest::binary>> = bin
        {%OfProto.Messages.OxmField{value: value, has_mask: has_mask, mask: mask, class: field}, rest}
    end
  end


  def encode(msg) do
    %{class: class, has_mask: has_mask, field: field, value: value, mask: mask} = msg
    class_int = ofp_oxm_class[class]
    field_int = to_index(oxm_ofb_match_fields, field)
    length = oxm_ofb_match_fields[field]
    {has_mask_int, rest, length } =
      case has_mask do
        true  -> { 1, <<value, mask>>, length * 2 }
        false -> { 0, value, length }
      end

    size = length * 8
    rest = to_binary(rest, size)
    
    <<class_int::16, field_int::7, has_mask_int::1, length::8, rest::binary>>
  end

  def to_binary(value, size) when is_integer(value), do: <<value::size(size)>>
  def to_binary(value, _size) when is_binary(value), do: value
end
