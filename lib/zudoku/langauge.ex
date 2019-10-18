defmodule Zudoku.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "langauges" do
    field :description, :string
    field :name, :string
    has_many :question, Zudoku.Question

    timestamps()
  end

  @doc false
  def changeset(langauge, attrs) do
    langauge
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
