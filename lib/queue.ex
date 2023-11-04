defmodule Queue do
  use GenServer

  @impl true
  def init(state) do
    {:ok, state}
  end

  def start_link(_initial_state) do
    GenServer.start_link(__MODULE__, %{})
  end
end
