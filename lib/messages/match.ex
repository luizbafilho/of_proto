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

  def encode(%{type: type, length: length, pad: pad}) do
    <<type::size(16), length::size(16), pad::32>>
  end
end
