defmodule Api_Brecht_De_BoeckR0838388.OrderContext.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api_Brecht_De_BoeckR0838388.GamesContext.Game
  alias Api_Brecht_De_BoeckR0838388.OrderProductContext.OrderProduct

  schema "order" do
    field(:email, :string)
    field(:date, :date)

    many_to_many(:products, Game,
     join_through: OrderProduct,
     join_keys: [order_id: :id, product_id: :id]
    )
  end

  def changeset(order, attrs) do
    order
    |> cast(attrs, [
      :email
    ])
    |> validate_required([
      :email
    ])
    |> put_date()
  end

  def update_changeset(order, attrs) do
    order
    |> cast(attrs, [
      :email
    ])
    |> validate_required([
      :email
    ])
  end

  defp put_date(%{changes: %{date: _d}} = changeset), do: changeset

  defp put_date(changeset) do
    changeset
    |> put_change(:date, Date.utc_today())
  end
end