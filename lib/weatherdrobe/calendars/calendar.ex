defmodule Weatherdrobe.Calendars.Calendar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calendars" do
    field :date, :naive_datetime
    #field :activity_id, :id
    #field :user_id, :id

    belongs_to :user, Weatherdrobe.Users.User
    belongs_to :activity, Weatherdrobe.Activities.Activity

    timestamps()
  end

  @doc false
  def changeset(calendar, attrs) do
    calendar
    |> cast(attrs, [:date, :user_id, :activity_id])
    |> validate_required([:date, :user_id, :activity_id])
  end
end
