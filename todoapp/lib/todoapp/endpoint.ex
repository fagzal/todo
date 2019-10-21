defmodule Todoapp.Endpoint do
	@moduledoc """
	FAGZAL routed here from application/start by Cowboy.
	"""

    # FAGZAL this module is a Plug, which is an Elixir official project.
	# See: https://elixirschool.com/en/lessons/specifics/plug/
	use Plug.Router

	plug(Plug.Logger)

	plug(:match)

	plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
	
	plug(:dispatch)

	# First route:
	get "/ping" do
		send_resp(conn, 200, "pong")
	end

	# This is for accepting protobuf
	post "/pbping" do
		%{"payload" => payload } = conn.body_params
		answer = process_pping(payload)

		send_resp(conn, 200, answer)
	end

	defp process_pping(payload) do
	    dec = Messages.Person.decode(payload)
		dec.name
	end

	# Catch-all:
	match _ do 
		send_resp(conn, 404, "No such route")
    end
end 
