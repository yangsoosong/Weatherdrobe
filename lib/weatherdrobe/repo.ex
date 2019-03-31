defmodule Weatherdrobe.Repo do
  use Ecto.Repo,
    otp_app: :weatherdrobe,
    adapter: Ecto.Adapters.Postgres
end
