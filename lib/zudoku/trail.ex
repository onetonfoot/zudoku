defmodule Zudoku.Trail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trails" do
    field :passed, :boolean, default: false
    field :question_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(trail, attrs) do
    trail
    |> cast(attrs, [:passed])
    |> validate_required([:passed])
  end
end
