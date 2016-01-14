defmodule OfProto.Encoder do
  def encode(msg), do: msg.__struct__.encode(msg)
end
