defmodule Api_Brecht_De_BoeckR0838388.OrderContext do
  import Ecto.Query, only: [from: 2]

  alias __MODULE__.Order
  alias Api_Brecht_De_BoeckR0838388.Repo
  alias Api_Brecht_De_BoeckR0838388.OrderProductContext

  def change_order(%Order{} = order) do
    order |> Order.changeset(%{})
  end

  def create_order(%{"email" => email, "products" => products}) do
    %Order{}
    |> Order.changeset(%{email: email})
    |> Repo.insert!()
    |> add_products_to_order(products)
  end

  def list_orders() do
    from(o in Order, preload: [:products])
    |> Repo.all()
  end

  def get_order!(id) do
    Repo.get(Order, id)
  end

  def update_order(%Order{} = order, attrs) do
    order
    |> Order.update_changeset(attrs)
    |> Repo.update()
  end

  def delete_order(%Order{} = order), do: Repo.delete(order)

  def add_products_to_order(%Order{} = order, [product]), do: OrderProductContext.add_product_to_order(%{"order" => order, "product" => product})

  def add_products_to_order(%Order{} = order, [ head | tail ]) do
     OrderProductContext.add_product_to_order(%{"order" => order, "product" => head})
     add_products_to_order(order, tail)
  end
end