defmodule OfProto.Messages.OmxField do
  import OfProto.Constants

  @match_size 8

  defstruct class: 0,
            has_mask: false,
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

    {field, bit_length} = case class do
      :OFPXMC_OPENFLOW_BASIC ->
        oxm_ofb_match_fields |> Enum.at(field_int)
      _ ->
        {field_int, length * 8}
    end

    case has_mask do
      false ->
        <<value::size(bit_length), rest::binary>> = bin
        {%OfProto.Messages.OmxField{value: value, has_mask: has_mask, class: field}, rest}
      true ->
        len = div(bit_length, 2)
        <<value::size(len), mask::size(len), rest::binary>> = bin
        {%OfProto.Messages.OmxField{value: value, has_mask: has_mask, mask: mask, class: field}, rest}
    end
  end
end
