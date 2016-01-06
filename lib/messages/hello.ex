defmodule OfProto.Messages.Hello do
  use BinFormat

  defformat do
    integer :version, 0, 8
    integer :type, 0, 8
    integer :length, 0, 16
    integer :xid, 0, 32
  end
end
