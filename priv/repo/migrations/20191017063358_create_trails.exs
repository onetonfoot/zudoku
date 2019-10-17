defmodule Zudoku.Repo.Migrations.CreateTrails do
  use Ecto.Migration

  def change do
    create table(:trails) do
      add :passed, :boolean, default: false, null: false
      add :question_id, references(:questions, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:trails, [:question_id])
    create index(:trails, [:user_id])
  end
end
