defmodule Weatherdrobe.Conjunctions do
  @moduledoc """
  The Conjunctions context.
  """

  import Ecto.Query, warn: false
  alias Weatherdrobe.Repo

  alias Weatherdrobe.Conjunctions.Conjunction

  @doc """
  Returns the list of conjunctions.

  ## Examples

      iex> list_conjunctions()
      [%Conjunction{}, ...]

  """
  def list_conjunctions do
    Repo.all(Conjunction)
  end

  @doc """
  Gets a single conjunction.

  Raises `Ecto.NoResultsError` if the Conjunction does not exist.

  ## Examples

      iex> get_conjunction!(123)
      %Conjunction{}

      iex> get_conjunction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_conjunction!(id), do: Repo.get!(Conjunction, id)

  @doc """
  Creates a conjunction.

  ## Examples

      iex> create_conjunction(%{field: value})
      {:ok, %Conjunction{}}

      iex> create_conjunction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_conjunction(attrs \\ %{}) do
    %Conjunction{}
    |> Conjunction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a conjunction.

  ## Examples

      iex> update_conjunction(conjunction, %{field: new_value})
      {:ok, %Conjunction{}}

      iex> update_conjunction(conjunction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_conjunction(%Conjunction{} = conjunction, attrs) do
    conjunction
    |> Conjunction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Conjunction.

  ## Examples

      iex> delete_conjunction(conjunction)
      {:ok, %Conjunction{}}

      iex> delete_conjunction(conjunction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_conjunction(%Conjunction{} = conjunction) do
    Repo.delete(conjunction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking conjunction changes.

  ## Examples

      iex> change_conjunction(conjunction)
      %Ecto.Changeset{source: %Conjunction{}}

  """
  def change_conjunction(%Conjunction{} = conjunction) do
    Conjunction.changeset(conjunction, %{})
  end
end
