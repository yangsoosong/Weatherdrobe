defmodule Weatherdrobe.Repo.Migrations.CreateConjunctions do
  use Ecto.Migration

  def change do
    create table(:conjunctions) do
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :activity_id, references(:activities, on_delete: :nothing), null: false
      add :outfit_id, references(:outfits, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:conjunctions, [:user_id])
    create index(:conjunctions, [:activity_id])
    create index(:conjunctions, [:outfit_id])
  end
end
