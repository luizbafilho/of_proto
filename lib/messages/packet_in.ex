defmodule OfProto.Messages.PacketIn do
  import OfProto.Constants

  @packet_in_size 24
  @pad_size       2
  @match_size     8

  defstruct version: 4,
            type: to_index(ofp_type, :packet_in),
            length: 0,
            xid: 0,
            buffer_id: 0,
            total_len: 0,
            in_port: 0,
            reason: nil,
            match: nil,
            data: <<>>

  def decode(bin) do
    <<version::size(8),
      type::size(8),
      length::size(16),
      xid::size(32),
      buffer_id::size(32),
      total_len::size(16),
      reason::size(8),
      table_id::size(8),
      cookie::size(64),
      tail::binary>> = bin

      match_length = byte_size(bin) - (@packet_in_size + @pad_size + total_len)

      <<match_bin::binary-size(match_length), _pad::size(16), data::bitstring>> = tail

      match = OfProto.Messages.Match.decode(match_bin)

    %OfProto.Messages.PacketIn{
      length: length,
      xid: xid,
      buffer_id: buffer_id,
      total_len: total_len,
      reason: reason,
      match: match
    }
  end
end
