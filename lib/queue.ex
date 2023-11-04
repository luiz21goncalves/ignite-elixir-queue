defmodule Queue do
  use GenServer

  require Logger

  @impl true
  def init(state) do
    Logger.info("Init Queue")

    {:ok, state}
  end

  def start_link(_initial_state) do
    GenServer.start_link(__MODULE__, [])
  end

  def enqueue(pid, element) do
    GenServer.cast(pid, {:enqueue, element})
  end

  def dequeue(pid) do
    GenServer.call(pid, :dequeue)
  end

  @impl true
  def handle_cast({:enqueue, element}, state) do
    new_state = List.insert_at(state, -1, element)

    Logger.info(%{
      element: element,
      new_state: new_state,
      message: "handle_cast :enqueue"
    })

    {:noreply, new_state}
  end

  @impl true
  def handle_call(:dequeue, _from, [head | tail]) do
    Logger.info(%{
      message: "handle_call :dequeue",
      new_state: tail,
      removed_element: head
    })

    {:reply, head, tail}
  end

  @impl true
  def handle_call(:dequeue, _from, state) do
    Logger.info(%{
      message: "handle_call :dequeue",
      new_state: state,
      removed_element: nil
    })

    {:reply, nil, state}
  end
end
