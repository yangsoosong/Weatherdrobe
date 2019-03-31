defmodule Weatherdrobe.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :zipcode, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash, :zipcode])
    |> validate_required([:email, :password_hash, :zipcode])
  end
end
