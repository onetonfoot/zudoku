defmodule Zudoku.Challenges.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :question, :string
    field :readme, :string
    field :solution, :string
    field :test, :string
    has_many :trials, Zudoku.Challenges.Trial
    belongs_to :lang, Zudoku.Challenges.Lang


    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :readme, :solution, :test])
    |> validate_required([:question, :readme, :solution, :test])
  end
end
