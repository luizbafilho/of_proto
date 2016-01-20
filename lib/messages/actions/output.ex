defmodule OfProto.Messages.Actions.Output do
  import OfProto.Constants
  alias OfProto.Messages, as: M

  @length 16

  defstruct type: ofp_action_type[:output],
            length: @length,
            port: ofp_port_no[:controller],
            max_len: ofp_controller_max_len[:no_buffer],
            pad: <<0,0,0,0,0,0>>

  def encode(action) do
    %{type: type, length: length, port: port, max_len: max_len, pad: pad} = action

    <<type::size(16), length::size(16), port::size(32), max_len::size(16), pad::bitstring>>
  end
end
