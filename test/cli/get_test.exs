defmodule Doex.Cli.GetTest do
  use ExUnit.Case
  alias Doex.Cli.Get

  setup do
    System.put_env("DOEX_CONFIG", "~/.doex.live")
    Doex.reload
    on_exit fn ->
      System.delete_env("DOEX_CONFIG")
      Doex.reload
    end
    :ok
  end

  @tag :live
  test "GET some data" do
    {:ok, %{"account" => _}} = Get.run(["/account", "--quiet"])
  end

  @tag :live
  test "GET with attributes" do
    {:ok, %{"images" => _, "links" => _, "meta" => _}} = Get.run(["/images", "--page", "1", "--per-page", "1", "--private", "--quiet"])
  end

end