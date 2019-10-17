defmodule Zudoku.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :readme, :string
      add :test, :string
      add :solution, :string
      add :question, :string
      add :lang_id, references(:langauges, on_delete: :nothing)

      timestamps()
    end

    create index(:questions, [:lang_id])
  end
end
