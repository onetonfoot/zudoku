defmodule Zudoku.Challenges.Lang do
  use Ecto.Schema
  import Ecto.Changeset

  schema "langs" do
    field :desc, :string
    field :name, :string
    has_many :questions, Zudoku.Challenges.Question

    timestamps()
  end

  @doc false
  def changeset(lang, attrs) do
    lang
    |> cast(attrs, [:name, :desc])
    |> validate_required([:name, :desc])
  end
end
