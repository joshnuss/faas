defmodule Faas.Core.MixProject do
  use Mix.Project

  def project do
    [
      app: :faas_core,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Faas.Core.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0-rc"},
      {:postgrex, ">= 0.0.0-rc"},
    ]
  end
end
