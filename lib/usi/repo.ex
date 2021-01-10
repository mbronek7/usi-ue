defmodule Usi.Repo do
  use Ecto.Repo,
    otp_app: :usi,
    adapter: Ecto.Adapters.Postgres
end
