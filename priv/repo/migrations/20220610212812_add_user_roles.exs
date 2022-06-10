defmodule Wefood.Repo.Migrations.AddUserRoles do
  @moduledoc false
  use Ecto.Migration

  def change do
    create_query = "create type roles as ENUM ('USER', 'ADMIN')"
    drop_query = "DROP TYPE roles"
    execute(create_query, drop_query)

    alter table(:users) do
      add :role, :roles, default: "USER", null: false
    end
  end
end
