defmodule OfProto do
  import OfProto.Constants
  alias OfProto.Decoder

  def decode(bin) do
    Decoder.decode(bin)
  end
end
