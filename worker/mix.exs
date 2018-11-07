defmodule Faas.Worker.MixProject do
  use Mix.Project

  def project do
    [
      app: :faas_worker,
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
      mod: {Faas.Worker.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:erlexec, "~> 1.9"},
      {:poison, "~> 3.0"},
      {:faas_core, path: "../core"}
    ]
  end
end
