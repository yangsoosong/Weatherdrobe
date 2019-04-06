defmodule Weatherdrobe.Calendars.Calendar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calendars" do
    field :date, :naive_datetime
    field :activity_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(calendar, attrs) do
    calendar
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end