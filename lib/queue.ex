defmodule Queue do
  use GenServer

  @impl true
  def init(state) do
    {:ok, state}
  end

  def start_link(_initial_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  def enqueue(pid, element) do
    GenServer.cast(pid, {:enqueue, element})
  end

  @impl true
  def handle_cast({:enqueue, element}, state) do
    new_state = [state | element]

    {:noreply, new_state}
  end
end
