defmodule OfProto.Messages.PacketIn do
  import OfProto.Constants
  
  defstruct version: 4,
            type: to_index(ofp_type, :OFPT_PACKET_IN),
            length: 0,
            xid: 0,
            buffer_id: 0,
            total_len: 0,
            in_port: 0,
            reason: nil,
            data: <<>>

  def decode(binary) do
    <<version::size(8),
      type::size(8),
      length::size(16),
      xid::size(32),
      buffer_id::size(32),
      total_len::size(16),
      in_port::size(16),
      reason::size(8),
      _pad::size(8),
      data::binary>> = binary

    %OfProto.Messages.PacketIn{
      length: length,
      xid: xid,
      buffer_id: buffer_id,
      total_len: total_len,
      in_port: in_port,
      reason: reason,
      data: data
    }
  end
end
