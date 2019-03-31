defmodule WeatherdrobeWeb.ConjunctionController do
  use WeatherdrobeWeb, :controller

  alias Weatherdrobe.Conjunctions
  alias Weatherdrobe.Conjunctions.Conjunction

  def index(conn, _params) do
    conjunctions = Conjunctions.list_conjunctions()
    render(conn, "index.html", conjunctions: conjunctions)
  end

  def new(conn, _params) do
    changeset = Conjunctions.change_conjunction(%Conjunction{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"conjunction" => conjunction_params}) do
    case Conjunctions.create_conjunction(conjunction_params) do
      {:ok, conjunction} ->
        conn
        |> put_flash(:info, "Conjunction created successfully.")
        |> redirect(to: Routes.conjunction_path(conn, :show, conjunction))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    conjunction = Conjunctions.get_conjunction!(id)
    render(conn, "show.html", conjunction: conjunction)
  end

  def edit(conn, %{"id" => id}) do
    conjunction = Conjunctions.get_conjunction!(id)
    changeset = Conjunctions.change_conjunction(conjunction)
    render(conn, "edit.html", conjunction: conjunction, changeset: changeset)
  end

  def update(conn, %{"id" => id, "conjunction" => conjunction_params}) do
    conjunction = Conjunctions.get_conjunction!(id)

    case Conjunctions.update_conjunction(conjunction, conjunction_params) do
      {:ok, conjunction} ->
        conn
        |> put_flash(:info, "Conjunction updated successfully.")
        |> redirect(to: Routes.conjunction_path(conn, :show, conjunction))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", conjunction: conjunction, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    conjunction = Conjunctions.get_conjunction!(id)
    {:ok, _conjunction} = Conjunctions.delete_conjunction(conjunction)

    conn
    |> put_flash(:info, "Conjunction deleted successfully.")
    |> redirect(to: Routes.conjunction_path(conn, :index))
  end
end
