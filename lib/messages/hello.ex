defmodule OfProto.Messages.Hello do
  import OfProto.Constants

  defstruct version: 4, type: to_index(ofp_type, :OFPT_HELLO), length: 8,  xid: 0

  def decode(<<version::size(8), type::size(8), length::size(16), xid::size(32)>>) do
    %OfProto.Messages.Hello{version: version, type: type, length: length,  xid: xid}
  end

  def encode(%OfProto.Messages.Hello{version: version, type: type, length: length, xid: xid}) do
    <<version::size(8), type::size(8), length::size(16), xid::size(32)>>
  end
end
