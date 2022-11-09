defmodule Api_Brecht_De_BoeckR0838388.OrderProductContext do
  alias __MODULE__.OrderProduct
  alias Api_Brecht_De_BoeckR0838388.OrderContext
  alias Api_Brecht_De_BoeckR0838388.GamesContext
  alias Api_Brecht_De_BoeckR0838388.Repo

  def change_order_product(%OrderProduct{} = order_product) do
    order_product |> OrderProduct.changeset(%{})
  end

  def add_product_to_order(%{"order" => order, "product" => product}) do
    case GamesContext.get_game!(product["id"]) do
      nil ->
        OrderContext.delete_order(order)
        {:error, "game doesn't exist"}
      game ->
        if game.title == product["title"] && game.description == product["description"] && game.price == product["price"] && game.picture_url == product["picture_url"] do
          %OrderProduct{}
          |> OrderProduct.changeset(%{"order_id" => order.id, "product_id" => product["id"]})
          |> Repo.insert()
        else
          OrderContext.delete_order(order)
          {:error, "games do not match"}
        end
    end
  end
end