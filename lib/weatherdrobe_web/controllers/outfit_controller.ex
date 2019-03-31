defmodule WeatherdrobeWeb.OutfitController do
  use WeatherdrobeWeb, :controller

  alias Weatherdrobe.Outfits
  alias Weatherdrobe.Outfits.Outfit

  def index(conn, _params) do
    outfits = Outfits.list_outfits()
    render(conn, "index.html", outfits: outfits)
  end

  def new(conn, _params) do
    changeset = Outfits.change_outfit(%Outfit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"outfit" => outfit_params}) do
    case Outfits.create_outfit(outfit_params) do
      {:ok, outfit} ->
        conn
        |> put_flash(:info, "Outfit created successfully.")
        |> redirect(to: Routes.outfit_path(conn, :show, outfit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    outfit = Outfits.get_outfit!(id)
    render(conn, "show.html", outfit: outfit)
  end

  def edit(conn, %{"id" => id}) do
    outfit = Outfits.get_outfit!(id)
    changeset = Outfits.change_outfit(outfit)
    render(conn, "edit.html", outfit: outfit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "outfit" => outfit_params}) do
    outfit = Outfits.get_outfit!(id)

    case Outfits.update_outfit(outfit, outfit_params) do
      {:ok, outfit} ->
        conn
        |> put_flash(:info, "Outfit updated successfully.")
        |> redirect(to: Routes.outfit_path(conn, :show, outfit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", outfit: outfit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    outfit = Outfits.get_outfit!(id)
    {:ok, _outfit} = Outfits.delete_outfit(outfit)

    conn
    |> put_flash(:info, "Outfit deleted successfully.")
    |> redirect(to: Routes.outfit_path(conn, :index))
  end
end
