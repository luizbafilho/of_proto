defmodule OfProto.Constants do

  def to_atom(list, index) do
    list |> Enum.at(index)
  end

  def to_index(list, atom) do
    Enum.find_index(list, fn(x) -> x == atom end)
  end

  def ofp_port_no do
    [
      OFPP_MAX:         0xffffff00,
      OFPP_IN_PORT:     0xfffffff8,
      OFPP_TABLE:       0xfffffff9,
      OFPP_NORMAL:      0xfffffffa,
      OFPP_FLOOD:       0xfffffffb,
      OFPP_ALL:         0xfffffffc,
      OFPP_CONTROLLER:  0xfffffffd,
      OFPP_LOCAL:       0xfffffffe,
      OFPP_ANY:         0xffffffff
    ]
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

  def ofp_instruction_type do
    [
      OFPIT_GOTO_TABLE:     1,
      OFPIT_WRITE_METADATA: 2,
      OFPIT_WRITE_ACTIONS:  3,
      OFPIT_APPLY_ACTIONS:  4,
      OFPIT_CLEAR_ACTIONS:  5,
      OFPIT_METER:          6,
      OFPIT_EXPERIMENTER:   0xFFFF
    ]
  end

  def ofp_action_type do
    [
      OFPAT_OUTPUT:       0,
      OFPAT_COPY_TTL_OUT: 11,
      OFPAT_COPY_TTL_IN: 12,
      OFPAT_SET_MPLS_TTL: 15,
      OFPAT_DEC_MPLS_TTL: 16,
      OFPAT_PUSH_VLAN: 17,
      OFPAT_POP_VLAN: 18,
      OFPAT_PUSH_MPLS: 19,
      OFPAT_POP_MPLS: 20,
      OFPAT_SET_QUEUE: 21,
      OFPAT_GROUP: 22,
      OFPAT_SET_NW_TTL: 23,
      OFPAT_DEC_NW_TTL: 24,
      OFPAT_SET_FIELD: 25,
      OFPAT_PUSH_PBB: 26,
      OFPAT_POP_PBB: 27,
      OFPAT_EXPERIMENTER: 0xffff
    ]
  end
  
  def ofp_controller_max_len do
    [OFPCML_MAX: 0xffe5, OFPCML_NO_BUFFER: 0xffff]
  end
end
