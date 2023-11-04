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
end
