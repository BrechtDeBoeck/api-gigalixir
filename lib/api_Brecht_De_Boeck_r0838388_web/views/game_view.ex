defmodule Api_Brecht_De_BoeckR0838388Web.GameView do
  use Api_Brecht_De_BoeckR0838388Web, :view

  alias Api_Brecht_De_BoeckR0838388Web.GameView

  def render("list.json", %{products: games}) do
    render_many(games, GameView, "product.json", as: :product)
  end

  def render("product.json", %{product: game}) do
    %{
      id: game.id,
      title: game.title,
      description: game.description,
      price: game.price,
      picture_url: game.picture_url
    }
  end
end