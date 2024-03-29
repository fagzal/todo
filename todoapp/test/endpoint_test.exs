defmodule Todoapp.EndpointTest do
 use ExUnit.Case, async: true
  use Plug.Test

  @opts Todoapp.Endpoint.init([])

  test "it returns pong" do
    # Create a test connection
    conn = conn(:get, "/ping")

    # Invoke the plug
    conn = Todoapp.Endpoint.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "pong"
  end

  test "protobuf encoding test" do
    msg = Messages.Person.new(name: "Bela", id: 5)
    enc = Messages.Person.encode(msg)
	conn = conn(:post, "/pbping", %{payload: enc})
	conn = Todoapp.Endpoint.call(conn, @opts)

	name = conn.resp_body
	assert name === "Bela"
  end

  test "it returns 404 when no route matches" do
    # Create a test connection
    conn = conn(:get, "/fail")

    # Invoke the plug
    conn = Todoapp.Endpoint.call(conn, @opts)

    # Assert the response
    assert conn.status == 404
  end
end
