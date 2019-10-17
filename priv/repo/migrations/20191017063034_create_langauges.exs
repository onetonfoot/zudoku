defmodule Zudoku.Repo.Migrations.CreateLangauges do
  use Ecto.Migration

  def change do
    create table(:langauges) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
