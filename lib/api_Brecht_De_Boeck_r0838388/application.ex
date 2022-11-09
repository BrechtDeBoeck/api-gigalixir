defmodule Api_Brecht_De_BoeckR0838388.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Api_Brecht_De_BoeckR0838388.Repo,
      # Start the Telemetry supervisor
      Api_Brecht_De_BoeckR0838388Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Api_Brecht_De_BoeckR0838388.PubSub},
      # Start the Endpoint (http/https)
      Api_Brecht_De_BoeckR0838388Web.Endpoint
      # Start a worker by calling: Api_Brecht_De_BoeckR0838388.Worker.start_link(arg)
      # {Api_Brecht_De_BoeckR0838388.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Api_Brecht_De_BoeckR0838388.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Api_Brecht_De_BoeckR0838388Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
