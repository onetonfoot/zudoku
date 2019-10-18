defmodule Zudoku.Repo.Migrations.CreateLangs do
  use Ecto.Migration

  def change do
    create table(:langs) do
      add :name, :string
      add :desc, :string

      timestamps()
    end

  end
end
