defmodule MessagesTest do
  alias OfProto.Messages
  import OfProto.Constants
  use ExUnit.Case

  test "hello encode" do
    message = %Messages.Hello{xid: 2670136333}
    assert OfProto.encode(message) == <<4, 0, 0, 8, 0x9f, 0x27, 0x0c, 0x0d>>
  end

  test "hello decode" do
    message = %Messages.Hello{xid: 2670136333}
    assert OfProto.decode(<<4, 0, 0, 8, 0x9f, 0x27, 0x0c, 0x0d>>) == message
  end

  test "EchoRequest decode" do
    message = %Messages.EchoRequest{xid: 0, data: <<30>>}
    assert OfProto.decode(<<4, 2, 0, 8, 0, 0, 0, 0, 30>>) == message
  end

  test "EchoReply encode" do
    message = %Messages.EchoReply{xid: 0, data: <<30>>}
    assert OfProto.encode(message) == <<4, 3, 0, 9, 0, 0, 0, 0, 30>>
  end
  
  # test "PacketIn decode" do
  #   packet_in = File.read!("#{Path.expand("..", __DIR__)}/fixtures/packet_in.bin") |> PacketIn.decode
  #   assert packet_in == %PacketIn{version: 1, type: 10, length: 108, xid: 0, buffer_id: 256, total_len: 90, in_port: 65534, reason: 0}
  # end
end
