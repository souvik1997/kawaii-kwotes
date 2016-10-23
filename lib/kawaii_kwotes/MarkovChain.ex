defmodule KawaiiKwotes.MarkovChain do
  use GenServer
  require Faust
  require Logger

  def start_link(chain, opts \\ []) do
    GenServer.start_link(__MODULE__, chain, opts)
  end

  def handle_call({:traverse, num}, _from, chain) do
    {:reply, Faust.traverse(chain, num)}
  end

end
