defmodule ProtoTest do
  use ExUnit.Case
  doctest Todoapp

  test "baisc protobuf call" do
    msg = Messages.Person.new(name: "Bela", id: 5)

	enc = Messages.Person.encode(msg)
	assert is_binary(enc)

	dec = Messages.Person.decode(enc)
	assert dec.name === "Bela"
	assert dec.id === 5

    assert Todoapp.hello() == :world
  end
end
