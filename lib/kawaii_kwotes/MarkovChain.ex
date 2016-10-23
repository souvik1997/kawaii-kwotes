defmodule KawaiiKwotes.MarkovChain do
  use GenServer
  require Faust
  require Logger

  def start_link(state, opts \\ []) do
    GenServer.start_link(__MODULE__, state, opts)
  end

  def handle_call({:traverse, num}, _from, state) do
    {:reply, Faust.traverse(state, num), state}
  end

end
