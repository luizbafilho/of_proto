defmodule OfProto.Messages.EchoRequest do
  import OfProto.Constants

  defstruct version: 4, type: to_index(ofp_type, :OFPT_ECHO_REQUEST), length: 8,  xid: 0, data: nil

  def decode(<<version::size(8), type::size(8), length::size(16), xid::size(32), data::bitstring>>) do
    %OfProto.Messages.EchoRequest{version: version, type: type, length: length,  xid: xid, data: data}
  end
end
