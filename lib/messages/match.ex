defmodule OfProto.Messages.Match do
  import OfProto.Constants

  defstruct type: ofp_match_type[:OFPMT_OXM], length: 4

  def encode(%{type: type, length: length}) do
    <<type::size(16), length::size(16)>>
  end
end
