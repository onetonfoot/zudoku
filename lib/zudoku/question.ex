defmodule Zudoku.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :question, :string
    field :readme, :string
    field :solution, :string
    field :test, :string
    belongs_to :lang, Zudoku.Language

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:readme, :test, :solution, :question])
    |> validate_required([:readme, :test, :solution, :question])
  end
end