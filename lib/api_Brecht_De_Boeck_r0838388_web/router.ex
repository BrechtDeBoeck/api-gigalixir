defmodule Api_Brecht_De_BoeckR0838388Web.Router do
  use Api_Brecht_De_BoeckR0838388Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Api_Brecht_De_BoeckR0838388Web do
    pipe_through :api

    get("/", OrderController, :test)

    #Products
    get("/products/list", GameController, :list)
    post("/products/create", GameController, :create)
    put("/products/update/:id", GameController, :update)
    patch("/products/update/:id", GameController, :update)
    delete("/products/delete/:id", GameController, :delete)

    #Orders
    get("/orders/list", OrderController, :list)
    post("/orders/create", OrderController, :create)
    put("/orders/update/:id", OrderController, :update)
    patch("/orders/update/:id", OrderController, :update)
    delete("/orders/delete/:id", OrderController, :delete)
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/live" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: Api_Brecht_De_BoeckR0838388Web.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
