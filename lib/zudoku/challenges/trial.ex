defmodule Zudoku.Challenges.Trial do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trials" do
    field :passed, :boolean
    belongs_to :question, Zudoku.Challenges.Question
    belongs_to :user, Zudoku.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(trial, attrs) do
    trial
    |> cast(attrs, [:passed])
    |> validate_required([:passed])
  end
end
