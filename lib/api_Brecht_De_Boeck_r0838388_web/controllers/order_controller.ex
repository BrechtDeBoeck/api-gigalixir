defmodule Api_Brecht_De_BoeckR0838388Web.OrderController do
  use Api_Brecht_De_BoeckR0838388Web, :controller

  alias Api_Brecht_De_BoeckR0838388.OrderContext
  alias Api_Brecht_De_BoeckR0838388.OrderContext.Order

  def list(conn, _params) do
    orders = OrderContext.list_orders()
    render(conn, "list.json", orders: orders)
  end

  def create(conn, params) do
    case OrderContext.create_order(params) do
      {:ok, _order} ->
        orders = OrderContext.list_orders()

        conn
        |> put_view(Api_Brecht_De_BoeckR0838388Web.OrderView)
        |> render("list.json", orders: orders)
      {:error, _error} ->
        send_resp(conn, 400, "Something went wrong. Do the games within your order exist?")
    end
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = OrderContext.get_order!(id)
    case OrderContext.update_order(order, order_params) do
      {:ok, _order} ->
        orders = OrderContext.list_orders()

        conn
        |> put_view(Api_Brecht_De_BoeckR0838388Web.OrderView)
        |> render("list.json", orders: orders)
      {:error, _changeset} ->
        send_resp(conn, 400, "Something went wrong")
    end
  end

  def delete(conn, %{"id" => id}) do
    order = OrderContext.get_order!(id)

    case OrderContext.delete_order(order) do
      {:ok, _order} ->
        orders = OrderContext.list_orders()

        conn
        |> put_view(Api_Brecht_De_BoeckR0838388Web.OrderView)
        |> render("list.json", orders: orders)

      {:error, _changeset} ->
        send_resp(conn, 400, "Something went wrong while trying to delete order nr. #{order.id}")
    end
  end

  def test(conn, _params) do
    render(conn, "test.json")
  end
end