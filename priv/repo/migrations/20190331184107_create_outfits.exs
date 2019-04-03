defmodule Weatherdrobe.Repo.Migrations.CreateOutfits do
  use Ecto.Migration

  def change do
    create table(:outfits) do
      add :outfit_type, :string, null: false
      add :rain?, :boolean, default: false, null: false
      add :snow?, :boolean, default: false, null: false
      add :wind?, :boolean, default: false, null: false
      add :sun?, :boolean, default: false, null: false
      add :temp_low, :integer, null: false
      add :temp_high, :integer, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:outfits, [:user_id])
  end
end
