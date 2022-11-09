# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Api_Brecht_De_BoeckR0838388.Repo.insert!(%Api_Brecht_De_BoeckR0838388.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
{:ok, _cs} = Api_Brecht_De_BoeckR0838388.GamesContext.create_game(%{
    "title" => "Cyberpunk 2077",
    "description" => "Role-playing, Action, Sci-fi",
    "price" => 60,
    "picture_url" => "https://images-2.gog-statics.com/c75e674590b8947542c809924df30bbef2190341163dd08668e243c266be70c5_product_tile_extended_432x243_2x.webp"
})
{:ok, _cs} = Api_Brecht_De_BoeckR0838388.GamesContext.create_game(%{
  "title" => "The Witcher 3: Wild Hunt - Game of the Year Edition",
  "description" => "Role-playing, Adventure, Fantasy",
  "price" => 50,
  "picture_url" => "https://images-3.gog-statics.com/e34b4189894110990510f1334151555bd1c0ed45926c5c8cbc7e9b80aa6744d1_product_tile_extended_432x243_2x.webp"
})