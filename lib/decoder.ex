defmodule OfProto.Decoder do
  import OfProto.Constants
  alias OfProto.Messages

  def decode(bin) do
    <<_, type, _::bitstring>> = bin

    to_atom(ofp_type, type) |> do_decode(bin)
  end

  def do_decode(:OFPT_HELLO, bin), do: Messages.Hello.decode(bin)
  def do_decode(:OFPT_ECHO_REQUEST, bin), do: Messages.EchoRequest.decode(bin)
  def do_decode(:OFPT_FEATURES_REPLY, bin), do: Messages.FeaturesReply.decode(bin)
  def do_decode(:OFPT_PACKET_IN, bin), do: Messages.PacketIn.decode(bin)
end
