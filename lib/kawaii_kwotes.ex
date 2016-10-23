defmodule KawaiiKwotes do
  use Application
  require Faust

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    {:ok, text} = File.read("./data/data.txt")
    {:ok, chain} = Faust.generate_chain(text, 3)
    children = [
      # Start the endpoint when the application starts
      supervisor(KawaiiKwotes.Endpoint, []),
      worker(KawaiiKwotes.MarkovChain, [chain, [name: MarkovChain]])
      # Here you could define other workers and supervisors as children
      # worker(KawaiiKwotes.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KawaiiKwotes.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    KawaiiKwotes.Endpoint.config_change(changed, removed)
    :ok
  end
end
