defmodule Weatherdrobe.Outfits do
  @moduledoc """
  The Outfits context.
  """

  import Ecto.Query, warn: false
  alias Weatherdrobe.Repo

  alias Weatherdrobe.Outfits.Outfit

  @doc """
  Returns the list of outfits.

  ## Examples

      iex> list_outfits()
      [%Outfit{}, ...]

  """
  def list_outfits do
    Repo.all(Outfit)
  end

  @doc """
  Gets a single outfit.

  Raises `Ecto.NoResultsError` if the Outfit does not exist.

  ## Examples

      iex> get_outfit!(123)
      %Outfit{}

      iex> get_outfit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_outfit!(id), do: Repo.get!(Outfit, id)

  @doc """
  Creates a outfit.

  ## Examples

      iex> create_outfit(%{field: value})
      {:ok, %Outfit{}}

      iex> create_outfit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_outfit(attrs \\ %{}) do
    %Outfit{}
    |> Outfit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a outfit.

  ## Examples

      iex> update_outfit(outfit, %{field: new_value})
      {:ok, %Outfit{}}

      iex> update_outfit(outfit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_outfit(%Outfit{} = outfit, attrs) do
    outfit
    |> Outfit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Outfit.

  ## Examples

      iex> delete_outfit(outfit)
      {:ok, %Outfit{}}

      iex> delete_outfit(outfit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_outfit(%Outfit{} = outfit) do
    Repo.delete(outfit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking outfit changes.

  ## Examples

      iex> change_outfit(outfit)
      %Ecto.Changeset{source: %Outfit{}}

  """
  def change_outfit(%Outfit{} = outfit) do
    Outfit.changeset(outfit, %{})
  end
end
