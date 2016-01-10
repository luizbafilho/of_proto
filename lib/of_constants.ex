defmodule OfProto.Constants do

  def to_atom(list, index) do
    list |> Enum.at(index)
  end

  def to_index(list, atom) do
    Enum.find_index(list, fn(x) -> x == atom end)
  end

  def ofp_type do
    [
      # Immutable messages.
      :OFPT_HELLO,
      :OFPT_ERROR,
      :OFPT_ECHO_REQUEST,
      :OFPT_ECHO_REPLY,
      :OFPT_EXPERIMENTER,

      # Switch configuration messages. */
      :OFPT_FEATURES_REQUEST,
      :OFPT_FEATURES_REPLY,
      :OFPT_GET_CONFIG_REQUEST,
      :OFPT_GET_CONFIG_REPLY,
      :OFPT_SET_CONFIG,

      # Asynchronous messages.
      :OFPT_PACKET_IN,
      :OFPT_FLOW_REMOVED,
      :OFPT_PORT_STATUS,

      # Controller command messages.
      :OFPT_PACKET_OUT,
      :OFPT_FLOW_MOD,
      :OFPT_GROUP_MOD,
      :OFPT_PORT_MOD,
      :OFPT_TABLE_MOD,

      # Multipart messages.
      :OFPT_MULTIPART_REQUEST,
      :OFPT_MULTIPART_REPLY,

      # Barrier messages.
      :OFPT_BARRIER_REQUEST,
      :OFPT_BARRIER_REPLY,

      # Queue Configuration messages.
      :OFPT_QUEUE_GET_CONFIG_REQUEST,
      :OFPT_QUEUE_GET_CONFIG_REPLY,

      # Controller role change request messages.
      :OFPT_ROLE_REQUEST,
      :OFPT_ROLE_REPLY,

      # Asynchronous message configuration.
      :OFPT_GET_ASYNC_REQUEST,
      :OFPT_GET_ASYNC_REPLY,
      :OFPT_SET_ASYNC,

      # Meters and rate limiters configuration messages.
      :OFPT_METER_MOD
    ]
  end
end
