defmodule Zudoku.Langauge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "langauges" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(langauge, attrs) do
    langauge
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
