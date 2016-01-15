defmodule OfProto.Messages.FlowMod do
  import OfProto.Constants
  alias OfProto.Messages, as: M

  defstruct version: 4,
            type: to_index(ofp_type, :OFPT_FLOW_MOD),
            length: 0,
            xid: 0,
            cookie: 0,
            cookie_mask: 0,
            table_id: 0,
            command: 0,
            idle_timeout: 0,
            hard_timeout: 0,
            priority: 0,
            buffer_id: 0,
            out_port: 0,
            out_group: 0,
            flags: 0,
            pad: 0,
            match: %M.Match{},
            instructions: nil

  def encode(msg) do
    match        = OfProto.encode(msg.match)
    instructions = OfProto.encode(msg.instructions)

    << msg.version      :: size(8),
       msg.type         :: size(8),
       msg.length       :: size(16),
       msg.xid          :: size(32),
       msg.cookie       :: size(64),
       msg.cookie_mask  :: size(64),
       msg.table_id     :: size(8),
       msg.command      :: size(8),
       msg.idle_timeout :: size(16),
       msg.hard_timeout :: size(16),
       msg.priority     :: size(16),
       msg.buffer_id    :: size(32),
       msg.out_port     :: size(32),
       msg.out_group    :: size(32),
       msg.flags        :: size(16),
       msg.pad          :: size(16),
       match            :: bitstring,
       instructions     :: bitstring >>
  end
end
