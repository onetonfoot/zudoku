defmodule Zudoku.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :string
      add :readme, :string
      add :solution, :string
      add :test, :string
      add :lang_id, references(:langs, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:questions, [:lang_id])
    create index(:questions, [:user_id])
  end
end
