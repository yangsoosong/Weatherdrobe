defmodule Weatherdrobe.Outfits.Outfit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "outfits" do
    field :outfit_type, :string
    field :rain?, :boolean, default: false
    field :snow?, :boolean, default: false
    field :sun?, :boolean, default: false
    field :temp_high, :integer
    field :temp_low, :integer
    field :wind?, :boolean, default: false
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(outfit, attrs) do
    outfit
    |> cast(attrs, [:outfit_type, :rain?, :snow?, :wind?, :sun?, :temp_low, :temp_high])
    |> validate_required([:outfit_type, :rain?, :snow?, :wind?, :sun?, :temp_low, :temp_high])
  end
end
