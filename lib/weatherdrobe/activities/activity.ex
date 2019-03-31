defmodule Weatherdrobe.Activities.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field :indoor?, :boolean, default: false
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:name, :indoor?])
    |> validate_required([:name, :indoor?])
  end
end
