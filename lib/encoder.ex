defmodule OfProto.Encoder do
  import OfProto.Constants
  alias OfProto.Messages

  def encode(message) do
    do_encode(message)
  end

  def do_encode(%Messages.Hello{} = msg), do: Messages.Hello.encode(msg)
  def do_encode(%Messages.EchoReply{} = msg), do: Messages.EchoReply.encode(msg)
  def do_encode(%Messages.FeaturesRequest{} = msg), do: Messages.FeaturesRequest.encode(msg)
  def do_encode(%Messages.PacketIn{} = msg), do: Messages.PacketIn.encode(msg)
end
