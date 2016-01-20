defmodule MessagesTest do
  alias OfProto.Messages
  import OfProto.Constants
  use ExUnit.Case

  def print(bin) do
    IO.inspect bin|> Base.encode16 |> to_char_list |> Enum.chunk(2)
  end

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

  test "oxm_field match" do
    oxm_field = %Messages.OxmField{field: :OFPXMT_OFB_IN_PORT, value: 2}
    assert OfProto.encode(oxm_field) == <<128, 0, 0, 4, 0, 0, 0, 2>>
  end

  test "match" do
    oxm_field1 = %Messages.OxmField{field: :OFPXMT_OFB_IN_PORT, value: 2}
    oxm_field2 = %Messages.OxmField{field: :OFPXMT_OFB_ETH_DST, value: <<0x4a,0xac,0x77,0xde,0x2d,0xd7>>}
    match = %Messages.Match{oxm_fields: [oxm_field1, oxm_field2]}

    assert OfProto.encode(match) == <<0, 1, 0, 22, 128, 0, 0, 4, 0, 0, 0, 2, 128, 0, 6, 6, 74, 172, 119, 222, 45, 215, 0, 0>>
  end

  test "set field action" do
    oxm_field = %Messages.OxmField{field: :OFPXMT_OFB_ETH_SRC, value: <<0x0,0x0,0x0,0x0,0x0,0x01>>}
    action = %Messages.Actions.SetField{oxm_field: oxm_field}

    assert OfProto.encode(action) == <<0, 25, 0, 16, 128, 0, 8, 6, 0, 0, 0, 0, 0, 1, 0, 0>>
  end
end
