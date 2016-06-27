defmodule ProcessesEx do
  def run do
    spawn_monitor(ProcessesEx, :child, [self])

    :timer.sleep(500)

    loop_receive
  end

  def loop_receive do
    receive do
      message ->
        IO.puts "Message: #{inspect message}"
        loop_receive
    after 500 -> IO.puts "All messages received."
    end
  end

  def child(parent) do
    send parent, "Hello!"
    raise RuntimeError
  end
end
