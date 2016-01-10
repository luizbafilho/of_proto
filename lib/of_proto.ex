defmodule OfProto do
  import OfProto.Constants
  alias OfProto.Decoder
  alias OfProto.Encoder

  def encode(message) do
    Encoder.encode(message)
  end

  def decode(bin) do
    Decoder.decode(bin)
  end
end
