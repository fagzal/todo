defmodule Todoapp.MixProject do
  use Mix.Project

  def project do
    [
      app: :todoapp,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :plug_cowboy],	# FAGZAL added plug_cowboy
      mod: {Todoapp.Application, []},
	  application: [:exprotobuf]		# FAGZAL addex protobuf
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
	  {:plug_cowboy, "~> 2.1" },	# FAGZAL added dep; 2.7 in GIT, 2.1 in repo
	  {:poison, "~> 3.1" },			# FAGZAL added dep
      {:exprotobuf, "~> 1.2.17"},	# FAGZAL added protobuf
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
