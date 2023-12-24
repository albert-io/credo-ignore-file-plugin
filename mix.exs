defmodule CredoIgnoreFilePlugin.MixProject do
  use Mix.Project

  def project do
    [
      app: :credo_ignore_file_plugin,
      description: "Credo plugin for allowing you to ignore checks based on a credo ignore file",
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      links: %{
        "Credo" => "https://hex.pm/packages/credo",
        "GitHub" => "https://github.com/albert-io/credo-ignore-file-plugin"
      }
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:credo, "~> 1.0"}
    ]
  end
end
