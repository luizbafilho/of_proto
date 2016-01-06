defmodule OfProto.Messages.EchoRequest do
  defstruct version: 1, type: 2, length: 0,  xid: 0, data: nil

  def decode(<<version::size(8), type::size(8), length::size(16), xid::size(32), data::bitstring>>) do
    %OfProto.Messages.EchoRequest{version: version, type: type, length: length,  xid: xid, data: data}
  end
end
