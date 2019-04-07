defmodule Weatherdrobe.Conjunctions.Conjunction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "conjunctions" do
'''
    field :user_id, :id
    field :activity_id, :id
    field :outfit_id, :id
'''

    belongs_to :user, Weatherdrobe.Users.User
    belongs_to :activity, Weatherdrobe.Activities.Activity
    belongs_to :outfit, Weatherdrobe.Outfits.Outfit

    timestamps()
  end

  @doc false
  def changeset(conjunction, attrs) do
    conjunction
    |> cast(attrs, [])
    |> validate_required([])
  end
end
