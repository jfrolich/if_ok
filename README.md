# if_ok

`if_ok` if_ok is a small utility library that let's you create pipelines that expect ok tuples to continue in a very readable way.

An example how we can use this:

```elixir
defmodule MyApp.DoStuff do
  import IfOk
  alias MyApp.Repo

  def broadcast_out(item) do: {:ok, item}
  def update(changeset) do
    changeset
    |> authorize(user, :update)
    |> if_ok(&Repo.update)
    |> if_ok(&broadcast_out)
    |> if_ok(:ok)
  end
end
```

## Installation

The package can be installed as:

  1. Add `if_ok` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:if_ok, "~> 0.1.0"}]
    end
    ```

  2. Ensure `if_ok` is started before your application:

    ```elixir
    def application do
      [applications: [:if_ok]]
    end
    ```
