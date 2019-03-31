defmodule WeatherdrobeWeb.OutfitControllerTest do
  use WeatherdrobeWeb.ConnCase

  alias Weatherdrobe.Outfits

  @create_attrs %{outfit_type: "some outfit_type", rain?: true, snow?: true, sun?: true, temp_high: 42, temp_low: 42, wind?: true}
  @update_attrs %{outfit_type: "some updated outfit_type", rain?: false, snow?: false, sun?: false, temp_high: 43, temp_low: 43, wind?: false}
  @invalid_attrs %{outfit_type: nil, rain?: nil, snow?: nil, sun?: nil, temp_high: nil, temp_low: nil, wind?: nil}

  def fixture(:outfit) do
    {:ok, outfit} = Outfits.create_outfit(@create_attrs)
    outfit
  end

  describe "index" do
    test "lists all outfits", %{conn: conn} do
      conn = get(conn, Routes.outfit_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Outfits"
    end
  end

  describe "new outfit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.outfit_path(conn, :new))
      assert html_response(conn, 200) =~ "New Outfit"
    end
  end

  describe "create outfit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.outfit_path(conn, :create), outfit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.outfit_path(conn, :show, id)

      conn = get(conn, Routes.outfit_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Outfit"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.outfit_path(conn, :create), outfit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Outfit"
    end
  end

  describe "edit outfit" do
    setup [:create_outfit]

    test "renders form for editing chosen outfit", %{conn: conn, outfit: outfit} do
      conn = get(conn, Routes.outfit_path(conn, :edit, outfit))
      assert html_response(conn, 200) =~ "Edit Outfit"
    end
  end

  describe "update outfit" do
    setup [:create_outfit]

    test "redirects when data is valid", %{conn: conn, outfit: outfit} do
      conn = put(conn, Routes.outfit_path(conn, :update, outfit), outfit: @update_attrs)
      assert redirected_to(conn) == Routes.outfit_path(conn, :show, outfit)

      conn = get(conn, Routes.outfit_path(conn, :show, outfit))
      assert html_response(conn, 200) =~ "some updated outfit_type"
    end

    test "renders errors when data is invalid", %{conn: conn, outfit: outfit} do
      conn = put(conn, Routes.outfit_path(conn, :update, outfit), outfit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Outfit"
    end
  end

  describe "delete outfit" do
    setup [:create_outfit]

    test "deletes chosen outfit", %{conn: conn, outfit: outfit} do
      conn = delete(conn, Routes.outfit_path(conn, :delete, outfit))
      assert redirected_to(conn) == Routes.outfit_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.outfit_path(conn, :show, outfit))
      end
    end
  end

  defp create_outfit(_) do
    outfit = fixture(:outfit)
    {:ok, outfit: outfit}
  end
end
