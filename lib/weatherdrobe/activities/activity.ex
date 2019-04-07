defmodule Weatherdrobe.Activities.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field :indoor?, :boolean, default: false
    field :name, :string

    belongs_to :user, Weatherdrobe.Users.User
    has_many :conjunction, Weatherdrobe.Conjunctions.Conjunction
    has_many :calendar, Weatherdrobe.Calendars.Calendar
    
    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:name, :indoor?])
    |> validate_required([:name, :indoor?])
  end
end
