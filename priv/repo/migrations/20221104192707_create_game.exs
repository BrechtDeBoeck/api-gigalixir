defmodule Api_Brecht_De_BoeckR0838388.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:product) do
      add(:title, :string, null: false)
      add(:description, :string, null: false)
      add(:price, :integer, null: false)
      add(:type, :string, null: false)
      add(:picture_url, :string)
    end
  end
end
