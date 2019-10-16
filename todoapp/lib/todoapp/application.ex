defmodule Todoapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc "FAGZAL this is a PoC implementation for a JSON API using OTP"

  use Application

  # FAGZAL: note that "start" is just the application start; children are started at start_liink
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Todoapp.Worker.start_link(arg)
      # {Todoapp.Worker, arg}
      # FAGZAL added this block: children handled by Cowboy, on given http/port, handled by Endpoint
	  # (which is in /lib/todoapp/endpoint.ex)
	  Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Todoapp.Endpoint,
        options: [port: 8080]
	  ),
	  # Add another children using different impl.
      { Sqlsaver, [:passz] }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Todoapp.Supervisor]	# FAGZAL note: one_for_one means only the dead child is restarted; that's OK for me
    Supervisor.start_link(children, opts)
  end
end
