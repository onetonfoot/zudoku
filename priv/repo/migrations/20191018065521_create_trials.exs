defmodule Zudoku.Repo.Migrations.CreateTrials do
  use Ecto.Migration

  def change do
    create table(:trials) do
      add :passed, :boolean
      add :question_id, references(:questions, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:trials, [:question_id])
    create index(:trials, [:user_id])
  end
end
