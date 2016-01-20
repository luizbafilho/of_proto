defmodule OfProto.Messages.Actions.SetField do
  import OfProto.Constants

  @header_length 4
  @pad           0

  defstruct type: ofp_action_type[:OFPAT_SET_FIELD],
            oxm_field: nil

  def encode(%{type: type, oxm_field: oxm_field}) do

    oxm_field = OfProto.encode(oxm_field)
    oxm_length = byte_size(oxm_field)

    length = @header_length + oxm_length

    padding_length = div(((8 + length) + 7), 8) * 8 - (8 + length)

    length = length + padding_length

    padding_length = padding_length * 8

    <<type::size(16), length::size(16), oxm_field::binary, @pad::size(padding_length)>>
  end
end
