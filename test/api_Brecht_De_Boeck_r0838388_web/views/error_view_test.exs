defmodule Api_Brecht_De_BoeckR0838388Web.ErrorViewTest do
  use Api_Brecht_De_BoeckR0838388Web.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(Api_Brecht_De_BoeckR0838388Web.ErrorView, "404.json", []) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(Api_Brecht_De_BoeckR0838388Web.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
