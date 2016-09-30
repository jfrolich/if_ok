defmodule IfOk do
  defp transform_result(res) do
     case res do
       res when is_tuple(res) or is_atom(res) -> res
       other -> {:ok, other}
     end
  end

  def if_ok(input, fun) when is_function(fun) do
    input
    |> case do
      {:ok, payload} -> transform_result(fun.(payload))
      :ok -> transform_result(fun.())
      other -> other
    end
  end
  def if_ok(_, value) do
    transform_result(value)
  end
end
