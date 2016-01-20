require Logger

defmodule OfProto.Decoder do
  import OfProto.Constants
  alias OfProto.Messages

  def decode(bin) do
    <<_, type, _::bitstring>> = bin

    to_atom(ofp_type, type) |> do_decode(bin)
  end

  def do_decode(:hello, bin), do: Messages.Hello.decode(bin)
  def do_decode(:echo_request, bin), do: Messages.EchoRequest.decode(bin)
  def do_decode(:features_reply, bin), do: Messages.FeaturesReply.decode(bin)
  def do_decode(:packet_in, bin), do: Messages.PacketIn.decode(bin)
  def do_decode(type, bin), do: Logger.warn("[Error] Undefined decoder!")
end
