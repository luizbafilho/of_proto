defmodule OfProto.Constants do

  def to_atom(list, index) do
    list |> Enum.at(index)
  end

  def value_to_atom(list, value) do
    #It searchs a given keyword list and returns the key given the value
    list
    |> Enum.find(fn ({_k, v}) -> v == value end)
    |> Tuple.to_list
    |> Enum.at(0)
  end

  def to_index(list, atom) do
    Enum.find_index(list, fn(x) ->
      case x do
        {key, length} -> key == atom
        key -> key == atom
      end
    end)
  end

  def ofp_no_buffer, do: 0xffffffff

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

  def ofp_oxm_class do
    [
      OFPXMC_NXM_0: 0x0000,
      OFPXMC_NXM_1: 0x0001,
      OFPXMC_OPENFLOW_BASIC: 0x8000,
      OFPXMC_EXPERIMENTER: 0xFFFF
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

  def ofp_match_type do
    [OFPMT_STANDARD: 0, OFPMT_OXM: 1]
  end

  def oxm_ofb_match_fields do
    [
      OFPXMT_OFB_IN_PORT: 4,
      OFPXMT_OFB_IN_PHY_PORT: 4,
      OFPXMT_OFB_METADATA: 8,
      OFPXMT_OFB_ETH_DST: 6,
      OFPXMT_OFB_ETH_SRC: 6,
      OFPXMT_OFB_ETH_TYPE: 2,
      OFPXMT_OFB_VLAN_VID: 2,
      OFPXMT_OFB_VLAN_PCP: 1,
      OFPXMT_OFB_IP_DSCP: 1,
      OFPXMT_OFB_IP_ECN: 1,
      OFPXMT_OFB_IP_PROTO: 1,
      OFPXMT_OFB_IPV4_SRC: 4,
      OFPXMT_OFB_IPV4_DST: 4,
      OFPXMT_OFB_TCP_SRC: 2,
      OFPXMT_OFB_TCP_DST: 2,
      OFPXMT_OFB_UDP_SRC: 2,
      OFPXMT_OFB_UDP_DST: 2,
      OFPXMT_OFB_SCTP_SRC: 2,
      OFPXMT_OFB_SCTP_DST: 2,
      OFPXMT_OFB_ICMPV4_TYPE: 1,
      OFPXMT_OFB_ICMPV4_CODE: 1,
      OFPXMT_OFB_ARP_OP: 2,
      OFPXMT_OFB_ARP_SPA: 4,
      OFPXMT_OFB_ARP_TPA: 4,
      OFPXMT_OFB_ARP_SHA: 6,
      OFPXMT_OFB_ARP_THA: 6,
      OFPXMT_OFB_IPV6_SRC: 16,
      OFPXMT_OFB_IPV6_DST: 16,
      OFPXMT_OFB_IPV6_FLABEL: 4,
      OFPXMT_OFB_ICMPV6_TYPE: 1,
      OFPXMT_OFB_ICMPV6_CODE: 1,
      OFPXMT_OFB_IPV6_ND_TARGET: 16,
      OFPXMT_OFB_IPV6_ND_SLL: 6,
      OFPXMT_OFB_IPV6_ND_TLL: 6,
      OFPXMT_OFB_MPLS_LABEL: 4,
      OFPXMT_OFB_MPLS_TC: 1,
      OFPXMT_OFP_MPLS_BOS: 1,
      OFPXMT_OFB_PBB_ISID: 3,
      OFPXMT_OFB_TUNNEL_ID: 8,
      OFPXMT_OFB_IPV6_EXTHDR: 2
    ]
  end
end
