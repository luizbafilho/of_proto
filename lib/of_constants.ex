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
      max:         0xffffff00,
      in_port:     0xfffffff8,
      table:       0xfffffff9,
      normal:      0xfffffffa,
      flood:       0xfffffffb,
      all:         0xfffffffc,
      controller:  0xfffffffd,
      local:       0xfffffffe,
      any:         0xffffffff
    ]
  end

  def ofp_oxm_class do
    [
      nxm_0: 0x0000,
      nxm_1: 0x0001,
      openflow_basic: 0x8000,
      experimenter: 0xffff
    ]
  end
  def ofp_type do
    [
      # Immutable messages.
      :hello,
      :error,
      :echo_request,
      :echo_reply,
      :experimenter,

      # Switch configuration messages. */
      :features_request,
      :features_reply,
      :get_config_request,
      :get_config_reply,
      :set_config,

      # Asynchronous messages.
      :Ofpt_packet_in,
      :flow_removed,
      :port_status,

      # Controller command messages.
      :packet_out,
      :flow_mod,
      :group_mod,
      :port_mod,
      :table_mod,

      # Multipart messages.
      :multipart_request,
      :multipart_reply,

      # Barrier messages.
      :barrier_request,
      :barrier_reply,

      # Queue Configuration messages.
      :queue_get_config_request,
      :queue_get_config_reply,

      # Controller role change request messages.
      :role_request,
      :role_reply,

      # Asynchronous message configuration.
      :get_async_request,
      :get_async_reply,
      :set_async,

      # Meters and rate limiters configuration messages.
      :meter_mod
    ]
  end

  def ofp_instruction_type do
    [
      goto_table:     1,
      write_metadata: 2,
      write_actions:  3,
      apply_actions:  4,
      clear_actions:  5,
      meter:          6,
      experimenter:   0xFFFF
    ]
  end

  def ofp_action_type do
    [
      output:        0,
      copy_ttl_out:  11,
      copy_ttl_in:   12,
      set_mpls_ttl:  15,
      dec_mpls_ttl:  16,
      push_vlan:     17,
      pop_vlan:      18,
      push_mpls:     19,
      pop_mpls:      20,
      set_queue:     21,
      group:         22,
      set_nw_ttl:    23,
      dec_nw_ttl:    24,
      set_field:     25,
      push_pbb:      26,
      pop_pbb:       27,
      experimenter:  0xffff
    ]
  end

  def ofp_controller_max_len do
    [max: 0xffe5, no_buffer: 0xffff]
  end

  def ofp_match_type do
    [standard: 0, oxm: 1]
  end

  def oxm_ofb_match_fields do
    [
      in_port:        4,
      in_phy_port:    4,
      metadata:       8,
      eth_dst:        6,
      eth_src:        6,
      eth_type:       2,
      vlan_vid:       2,
      vlan_pcp:       1,
      ip_dscp:        1,
      ip_ecn:         1,
      ip_proto:       1,
      ipv4_src:       4,
      ipv4_dst:       4,
      tcp_src:        2,
      tcp_dst:        2,
      udp_src:        2,
      udp_dst:        2,
      sctp_src:       2,
      sctp_dst:       2,
      icmpv4_type:    1,
      icmpv4_code:    1,
      arp_op:         2,
      arp_spa:        4,
      arp_tpa:        4,
      arp_sha:        6,
      arp_tha:        6,
      ipv6_src:       16,
      ipv6_dst:       16,
      ipv6_flabel:    4,
      icmpv6_type:    1,
      icmpv6_code:    1,
      ipv6_nd_target: 16,
      ipv6_nd_sll:    6,
      ipv6_nd_tll:    6,
      mpls_label:     4,
      mpls_tc:        1,
      mpls_bos:       1,
      pbb_isid:       3,
      tunnel_id:      8,
      ipv6_exthdr:    2
    ]
  end
end
