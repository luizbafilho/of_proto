defmodule OfProto.Messages.Instructions.ApplyActions do
  import OfProto.Constants

  @header_length 8

  defstruct type: ofp_instruction_type[:OFPIT_APPLY_ACTIONS], pad: 0, actions: []

  def encode(instruction) do
    %{type: type, pad: pad, actions: actions} = instruction

    actions_encoded = actions |> encode_actions
    length = @header_length + actions_length(actions)

    <<type::size(16), length::size(16), pad::size(32), actions_encoded::bitstring>>
  end

  def encode_actions(actions) do
    actions |> Enum.reduce(<<>>, fn(action, acc) -> acc <> OfProto.Encoder.encode(action) end)
  end

  def actions_length(actions) do
    actions |> Enum.reduce(0, fn(a, acc) -> acc + a.length end)
  end
end
