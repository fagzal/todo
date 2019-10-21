defmodule Messages do
  use Protobuf, from: Path.expand("../schema/example1.proto", __DIR__)
end
