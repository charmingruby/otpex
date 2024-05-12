defmodule Otpex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      OtpexWeb.Telemetry,
      # Start the Ecto repository
      Otpex.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Otpex.PubSub},
      # Start Finch
      {Finch, name: Otpex.Finch},
      # Start the Endpoint (http/https)
      OtpexWeb.Endpoint
      # Start a worker by calling: Otpex.Worker.start_link(arg)
      # {Otpex.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Otpex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OtpexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
