defmodule Usi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Usi.Repo,
      # Start the Telemetry supervisor
      UsiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Usi.PubSub},
      # Start the Endpoint (http/https)
      UsiWeb.Endpoint
      # Start a worker by calling: Usi.Worker.start_link(arg)
      # {Usi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Usi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    UsiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
