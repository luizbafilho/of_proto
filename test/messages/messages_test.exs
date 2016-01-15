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

  test "Instructions" do
    action = %Messages.Actions.Output{}
    instruction = %Messages.Instructions.ApplyActions{actions: [action]}
    assert Messages.Instructions.ApplyActions.encode(instruction) == <<0, 4, 0, 24, 0, 0, 0, 0, 0, 0, 0, 16, 255, 255, 255, 253, 255, 255, 0, 0, 0, 0, 0, 0>>
  end

  test "Flow Mod" do
    match       = %Messages.Match{}
    action      = %Messages.Actions.Output{}
    instruction = %Messages.Instructions.ApplyActions{actions: [action]}

    flow_mod    = %Messages.FlowMod{xid: 770168906, match: match, instructions: instruction}
    
    assert Messages.FlowMod.encode(flow_mod) == TestHelper.read_file("flow_mod.bin")
  end
end
