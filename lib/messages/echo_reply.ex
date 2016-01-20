defmodule OfProto.Messages.EchoReply do
  import OfProto.Constants

  defstruct version: 4, type: to_index(ofp_type, :echo_reply), xid: 0, data: nil

  def encode(%OfProto.Messages.EchoReply{version: version, type: type, xid: xid, data: data}) do
    <<version::size(8), type::size(8), message_length(data)::size(16), xid::size(32), data::bitstring>>
  end

  def message_length(data) do
    8 + byte_size(data)
  end
end
