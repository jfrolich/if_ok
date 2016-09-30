defmodule IfOk.Mixfile do
  use Mix.Project

  def project do
    [
      app: :if_ok,
      version: "0.1.0",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      description: """
      if_ok is a small utility library that let's you create pipelines that
      expect ok tuples to continue in a very readable way.
      """
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp package do
    [
      name: :if_ok,
      maintainers: ["Jaap Frölich"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/jfrolich/if_ok"},
      files: ~w(lib mix.exs README.md),
    ]
  end
end
