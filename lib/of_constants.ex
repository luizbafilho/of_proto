defmodule OfProto.Constants do
  def ofp_type do
    %{
      # Immutable messages.
      OFPT_HELLO: 0,
      OFPT_ERROR: 1,
      OFPT_ECHO_REQUEST: 2,
      OFPT_ECHO_REPLY: 3,
      OFPT_EXPERIMENTER: 4,

      # Switch configuration messages. */
      OFPT_FEATURES_REQUEST: 5,
      OFPT_FEATURES_REPLY: 6,
      OFPT_GET_CONFIG_REQUEST: 7,
      OFPT_GET_CONFIG_REPLY: 8,
      OFPT_SET_CONFIG: 9,

      # Asynchronous messages.
      OFPT_PACKET_IN: 10,
      OFPT_FLOW_REMOVED: 11,
      OFPT_PORT_STATUS: 12,

      # Controller command messages.
      OFPT_PACKET_OUT: 13,
      OFPT_FLOW_MOD: 14,
      OFPT_GROUP_MOD: 15,
      OFPT_PORT_MOD: 16,
      OFPT_TABLE_MOD: 17,

      # Multipart messages.
      OFPT_MULTIPART_REQUEST: 18,
      OFPT_MULTIPART_REPLY: 19,

      # Barrier messages.
      OFPT_BARRIER_REQUEST: 20,
      OFPT_BARRIER_REPLY: 21,

      # Queue Configuration messages.
      OFPT_QUEUE_GET_CONFIG_REQUEST: 22,
      OFPT_QUEUE_GET_CONFIG_REPLY: 23,

      # Controller role change request messages.
      OFPT_ROLE_REQUEST: 24,
      OFPT_ROLE_REPLY: 25,

      # Asynchronous message configuration.
      OFPT_GET_ASYNC_REQUEST: 26,
      OFPT_GET_ASYNC_REPLY: 27,
      OFPT_SET_ASYNC: 28,

      # Meters and rate limiters configuration messages.
      OFPT_METER_MOD: 29
    }
  end
end
