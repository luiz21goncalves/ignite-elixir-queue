defmodule QueueTest do
  use ExUnit.Case

  describe "init/1" do
    test "when call init" do
      initial_state = %{}

      response = Queue.init(initial_state)

      expected_response = {:ok, initial_state}

      assert expected_response == response
    end
  end

  describe "start_link/1" do
    test "when call start_lint" do
      response = Queue.start_link(%{})

      assert {:ok, _} = response
    end
  end

  describe "enqueue/2" do
    test "when the state is empty" do
      {:ok, pid} = Queue.start_link(%{})

      response = Queue.enqueue(pid, 1)

      expected_response = :ok

      assert expected_response == response
    end
  end
end
