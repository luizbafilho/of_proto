defmodule OfProto.Messages.Match do
  import OfProto.Constants

  @match_header_size 4

  defstruct type: ofp_match_type[:OFPMT_OXM],
            length: 4,
            pad: 0,
            oxm_fields: []

  def decode(bin) do
    << type::size(16), length::size(16), rest::binary >> = bin
    fields_length = length - @match_header_size
    << fields_bin::binary-size(fields_length), _pad::binary >> = rest

    fields = OfProto.Messages.OmxField.decode(fields_bin)
  end

  def encode(%{type: type, length: length, oxm_fields: oxm_fields, pad: pad}) do
    fields_bin = oxm_fields |> Enum.reduce(<<>>, fn(field, acc) -> acc <> OfProto.encode(field) end)

    length = @match_header_size + byte_size(fields_bin)
    pad_length = (8 - rem(length, 8)) * 8
    <<type::size(16), length::size(16), fields_bin::binary, pad::size(pad_length)>>
  end
end
