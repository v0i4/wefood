defmodule Wefood.Repo do
  use Ecto.Repo,
    otp_app: :wefood,
    adapter: Ecto.Adapters.Postgres
end
