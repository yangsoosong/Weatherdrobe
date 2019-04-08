defmodule Weatherdrobe.Repo.Migrations.CreateCalendars do
  use Ecto.Migration

  def change do
    create table(:calendars) do
      add :date, :date, null: false
      add :name, :string, null: false
      add :activity_id, references(:activities, on_delete: :nothing), null: false
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:calendars, [:activity_id])
    create index(:calendars, [:user_id])
  end
end
