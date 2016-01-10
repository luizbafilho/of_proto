defmodule OfProto.Messages.FeaturesRequest do
  import OfProto.Constants
  
  defstruct version: 1, type: to_index(ofp_type, :OFPT_FEATURES_REQUEST), length: 8, xid: 0

  def encode(%OfProto.Messages.FeaturesRequest{version: version, type: type, length: length, xid: xid}) do
    <<version::size(8), type::size(8), length::size(16), xid::size(32)>>
  end
end
