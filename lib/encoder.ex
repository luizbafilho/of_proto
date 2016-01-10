defmodule OfProto.Encoder do
  import OfProto.Constants
  alias OfProto.Messages

  def encode(bin) do
    <<_, type, _::bitstring>> = bin

    to_atom(ofp_type, type) |> do_encode(bin)
  end

  def do_encode(:OFPT_HELLO, bin), do: Messages.Hello.encode(bin)
  def do_encode(:OFPT_ECHO_REPLY, bin), do: Messages.EchoReply.encode(bin)
  def do_encode(:OFPT_FEATURES_REQUEST, bin), do: Messages.FeaturesRequest.encode(bin)
  def do_encode(:OFPT_PACKET_IN, bin), do: Messages.PacketIn.encode(bin)
end
