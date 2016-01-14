defmodule OfProto do
  defdelegate encode(message), to: OfProto.Encoder
  defdelegate decode(bin),     to: OfProto.Decoder
end
