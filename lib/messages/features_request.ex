defmodule OfProto.Messages.FeaturesRequest do
  defstruct version: 1, type: 5, length: 8, xid: 0

  def encode(%OfProto.Messages.FeaturesRequest{version: version, type: type, length: length, xid: xid}) do
    <<version::size(8), type::size(8), length::size(16), xid::size(32)>>
  end
end
