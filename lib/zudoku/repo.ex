defmodule Zudoku.Repo do
  use Ecto.Repo,
    otp_app: :zudoku,
    adapter: Ecto.Adapters.Postgres
end
