defmodule Api_Brecht_De_BoeckR0838388.Repo.Migrations.OrderProduct do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:order_product) do
      add(:order_id, references(:order, on_delete: :delete_all))
      add(:product_id, references(:product, on_delete: :delete_all))
    end
  end
end
