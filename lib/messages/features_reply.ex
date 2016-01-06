defmodule OfProto.Messages.FeaturesReply do
  defstruct version: 1, type: 6, length: 0,  xid: 0, datapath_id: 0, data: nil

  def decode(<<version::size(8), type::size(8), length::size(16), xid::size(32), datapath_id::size(64), data::bitstring>>) do
    %OfProto.Messages.FeaturesReply{version: version, type: type, length: length,  xid: xid, datapath_id: datapath_id, data: data}
  end
end
