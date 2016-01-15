ExUnit.start()

defmodule TestHelper do
  def read_file(file) do
    File.read!("test/fixtures/#{file}")
  end
end
