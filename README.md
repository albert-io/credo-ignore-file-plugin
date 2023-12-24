# credo-ignore-file-plugin

This is a plugin for https://github.com/rrrene/credo. It allows you to ignore files from credo analysis by adding a `.credoignore` file to your project.

## Installation

Add `credo_ignore_file_plugin` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:credo_ignore_file_plugin, , "~> 0.1.0", only: [:dev, :test], runtime: false}
  ]
end
```

To use it in Credo, add it to the list of plugins in .credo.exs:

```elixir
%{
  configs: [
    %{
      name: "default",
      plugins: [
        {CredoIgnoreFilePlugin, []}
      ]
    }
  ]
}
```

Now generate a `.credoignore` file in the root of your project:

```shell
mix credo list --format json > .credoignore
```

Now when you run `mix credo` it will ignore the checks listed in `.credoignore`.

## Contributing

1. Fork it!
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
