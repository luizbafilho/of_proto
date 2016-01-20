defmodule Ether do
  require Record
  Record.defrecord :ether, Record.extract(:ether, from: "deps/pkt/include/pkt_ether.hrl")
end
