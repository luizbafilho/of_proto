defmodule OfProto.Messages.Match do
  import OfProto.Constants

  defstruct type: ofp_match_type[:OFPMT_OXM], length: 4, pad: 0

  def encode(%{type: type, length: length, pad: pad}) do
    <<type::size(16), length::size(16), pad::32>>
  end
end
