defmodule KawaiiKwotes.MarkovChain do
  use GenServer
  require Faust

  def start_link(_state, filename \\ []) do
    {:ok, text} = File.read(filename)
    {:ok, chain} = Faust.generate_chain(text, 3)
    GenServer.start_link(__MODULE__, chain, filename)
  end

  def handle_call({:traverse, num}, _from, chain) do
    {:reply, Faust.traverse(chain, num)}
  end

end
