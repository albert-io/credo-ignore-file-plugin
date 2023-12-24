defmodule CredoIgnoreFilePlugin do
  @moduledoc false

  import Credo.Plugin

  def init(exec) do
    exec
    |> append_task(
      Credo.CLI.Command.Suggest.SuggestCommand,
      :filter_issues,
      CredoIgnoreFilePlugin.IgnoreIssues
    )
  end
end
