defmodule WeatherdrobeWeb.ConjunctionControllerTest do
  use WeatherdrobeWeb.ConnCase

  alias Weatherdrobe.Conjunctions

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:conjunction) do
    {:ok, conjunction} = Conjunctions.create_conjunction(@create_attrs)
    conjunction
  end

  describe "index" do
    test "lists all conjunctions", %{conn: conn} do
      conn = get(conn, Routes.conjunction_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Conjunctions"
    end
  end

  describe "new conjunction" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.conjunction_path(conn, :new))
      assert html_response(conn, 200) =~ "New Conjunction"
    end
  end

  describe "create conjunction" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.conjunction_path(conn, :create), conjunction: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.conjunction_path(conn, :show, id)

      conn = get(conn, Routes.conjunction_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Conjunction"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.conjunction_path(conn, :create), conjunction: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Conjunction"
    end
  end

  describe "edit conjunction" do
    setup [:create_conjunction]

    test "renders form for editing chosen conjunction", %{conn: conn, conjunction: conjunction} do
      conn = get(conn, Routes.conjunction_path(conn, :edit, conjunction))
      assert html_response(conn, 200) =~ "Edit Conjunction"
    end
  end

  describe "update conjunction" do
    setup [:create_conjunction]

    test "redirects when data is valid", %{conn: conn, conjunction: conjunction} do
      conn = put(conn, Routes.conjunction_path(conn, :update, conjunction), conjunction: @update_attrs)
      assert redirected_to(conn) == Routes.conjunction_path(conn, :show, conjunction)

      conn = get(conn, Routes.conjunction_path(conn, :show, conjunction))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, conjunction: conjunction} do
      conn = put(conn, Routes.conjunction_path(conn, :update, conjunction), conjunction: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Conjunction"
    end
  end

  describe "delete conjunction" do
    setup [:create_conjunction]

    test "deletes chosen conjunction", %{conn: conn, conjunction: conjunction} do
      conn = delete(conn, Routes.conjunction_path(conn, :delete, conjunction))
      assert redirected_to(conn) == Routes.conjunction_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.conjunction_path(conn, :show, conjunction))
      end
    end
  end

  defp create_conjunction(_) do
    conjunction = fixture(:conjunction)
    {:ok, conjunction: conjunction}
  end
end
