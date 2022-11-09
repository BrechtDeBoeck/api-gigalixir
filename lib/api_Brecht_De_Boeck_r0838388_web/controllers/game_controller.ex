defmodule Api_Brecht_De_BoeckR0838388Web.GameController do
  use Api_Brecht_De_BoeckR0838388Web, :controller

  alias Api_Brecht_De_BoeckR0838388.GamesContext
  alias Api_Brecht_De_BoeckR0838388.GamesContext.Game

  def list(conn, _params) do
    games = GamesContext.list_games()
    render(conn, "list.json", products: games)
  end

  def create(conn, params) do
    case GamesContext.create_game(params) do
      {:ok, _game} ->
        games = GamesContext.list_games()

        conn
        |> put_view(Api_Brecht_De_BoeckR0838388Web.GameView)
        |> render("list.json", products: games)
      {:error, _changeset} ->
        send_resp(conn, 400, "Something went wrong, sorry")
    end
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = GamesContext.get_game!(id)
    case GamesContext.update_game(game, game_params) do
      {:ok, _game} ->
        games = GamesContext.list_games()

        conn
        |> put_view(Api_Brecht_De_BoeckR0838388Web.GameView)
        |> render("list.json", products: games)
      {:error, _changeset} ->
        send_resp(conn, 400, "Something went wrong, sorry")
    end
  end

  def delete(conn, %{"id" => id}) do
    game = GamesContext.get_game!(id)
    case GamesContext.delete_game(game) do
      {:ok, _game} ->
        games = GamesContext.list_games()

        conn
        |> put_view(Api_Brecht_De_BoeckR0838388Web.GameView)
        |> render("list.json", products: games)
      {:error, _changeset} ->
        send_resp(conn, 400, "Something went wrong, sorry")
    end
  end
end