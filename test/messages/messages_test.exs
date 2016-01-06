defmodule MessagesTest do
  alias OfProto.Messages.Hello
  alias OfProto.Messages.EchoRequest
  alias OfProto.Messages.EchoReply
  use ExUnit.Case

  test "hello encode" do
    message = %Hello{length: 8, type: 0, version: 1, xid: 2670136333}
    assert Hello.encode(message) == <<1, 0, 0, 8, 0x9f, 0x27, 0x0c, 0x0d>>
  end

  test "hello decode" do
    message = %Hello{length: 8, type: 0, version: 1, xid: 2670136333}
    assert Hello.decode(<<1, 0, 0, 8, 0x9f, 0x27, 0x0c, 0x0d>>) == message
  end

  test "EchoRequest decode" do
    message = %EchoRequest{length: 8, type: 0, version: 1, xid: 0, data: <<30>>}
    assert EchoRequest.decode(<<1, 0, 0, 8, 0, 0, 0, 0, 30>>) == message
  end

  test "EchoReply encode" do
    message = %EchoReply{version: 1, type: 0, xid: 0, data: <<30>>}
    assert EchoReply.encode(message) == <<1, 0, 0, 9, 0, 0, 0, 0, 30>>
  end
end
