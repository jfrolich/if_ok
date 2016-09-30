defmodule IfOkTest do
  use ExUnit.Case
  use AssertFunctional
  import IfOk

  doctest IfOk

  def accept_and_return_ok_atom(_), do: :ok
  def accept_map_and_return(map), do: map
  def accept_map_and_return_ok_tuple(map), do: {:ok, map}
  def accept_and_return_error_atom(_), do: :error
  def accept_map_and_return_error_tuple(map), do: {:error, map}

  test "assert ok on no tuple or atom" do
    accept_map_and_return_ok_tuple(%{success: true})
    |> if_ok(&accept_map_and_return/1)
    |> assert_equal({:ok, %{success: true}})
  end

  test "assert ok on tuple" do
    accept_map_and_return_ok_tuple(%{success: true})
    |> if_ok(&accept_map_and_return_ok_tuple/1)
    |> assert_equal({:ok, %{success: true}})
  end

  test "assert ok on atom" do
    accept_map_and_return_ok_tuple(%{success: true})
    |> if_ok(&accept_and_return_ok_atom/1)
    |> assert_equal(:ok)
  end

  test "assert return error atom" do
    accept_map_and_return_ok_tuple(%{success: true})
    |> if_ok(&accept_and_return_error_atom/1)
    |> if_ok(&accept_map_and_return_ok_tuple/1)
    |> assert_equal(:error)
  end

  test "assert and return error tuple" do
    accept_map_and_return_ok_tuple(%{success: true})
    |> if_ok(&accept_map_and_return_error_tuple/1)
    |> if_ok(&accept_and_return_ok_atom/1)
    |> assert_equal({:error, %{success: true}})
  end
end
