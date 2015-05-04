defmodule PhoenixBlog.Repo.Migrations.CreateCar do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :user_id, references(:users)
      add :name, :string

      timestamps
    end
  end
end
