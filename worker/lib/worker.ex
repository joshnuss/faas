defmodule Faas.Worker do
  use GenServer

  require Logger

  @cmd Path.expand("#{__DIR__}/../object-runner")
  @cmd_opts [:stdin, :stderr, :stdout, :monitor]

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, _pid, id} = :exec.run_link(to_charlist(@cmd), @cmd_opts)

    {:ok, id}
  end

  def handle_call({:load, name, code}, _from, id) do
    message = %{
      type: "load",
      name: name,
      code: code
    }
    :ok = send_message(id, message)

    receive do
      {:stdout, ^id, response} ->
        response = Poison.decode!(response)
        response["result"] == :ok
    end

    {:reply, :ok, id}
  end

  def handle_call({:run, name, params}, _from, id) do
    message = %{
      type: "run",
      name: name,
      params: params
    }
    :ok = send_message(id, message)

    receive do
      {:stdout, ^id, response} ->
        response = Poison.decode!(response)
        response["result"] == :ok
        {:reply, {:ok, response["data"]}, id}
    end
  end

  def handle_info(msg, state) do
    Logger.info("#{inspect msg}")
    {:noreply, state}
  end

  def load(worker, name, code) do
    GenServer.call(worker, {:load, name, code})
  end

  def run(worker, name, params \\ []) do
    GenServer.call(worker, {:run, name, params})
  end

  defp send_message(id, message) do
    data = Poison.encode!(message)
    :exec.send(id, data)
  end
end
