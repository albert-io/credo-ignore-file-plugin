defmodule CredoIgnoreFilePlugin.IgnoreIssues do
  @moduledoc false

  use Credo.Execution.Task

  def call(exec, _opts) do
    ignore_issues = ignore_file_issues()

    kept_issues =
      exec
      |> Execution.get_issues()
      |> Enum.reject(&ignore_issue?(&1, ignore_issues))

    Execution.put_issues(exec, kept_issues)
  end

  defp ignore_file_issues do
    File.read!(".credoignore") |> Jason.decode!(keys: :atoms) |> Map.fetch!(:issues)
  end

  defp ignore_issue?(issue, ignore_issues) do
    Enum.any?(ignore_issues, fn ignore_issue ->
      issue.filename == ignore_issue.filename &&
        issue.line_no == ignore_issue.line_no &&
        issue.column == ignore_issue.column &&
        check_name(issue.check) == ignore_issue.check
    end)
  end

  defp check_name(check) do
    check
    |> to_string()
    |> String.replace(~r/^(Elixir\.)/, "")
  end
end
