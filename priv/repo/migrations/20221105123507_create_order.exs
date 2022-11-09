defmodule Api_Brecht_De_BoeckR0838388.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:order) do
      add(:email, :string, null: false)
      add(:date, :date, null: false)
    end
  end
end
