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

	# Actually this is enought, but...

	# Catch-all:
	match _ do 
		send_resp(conn, 404, "No such route")
    end
end 
