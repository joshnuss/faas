defmodule Faas.Core.Runtime do
  alias Faas.Core.{Repo, Function, Call}

  def execute(call) do
    function = Repo.get!(Function, call.function_id)

    start_at = NaiveDateTime.utc_now()
    changeset = Call.start(call, %{start_at: start_at})
    call = Repo.update!(changeset)

    {:ok, result} = Faas.Worker.execute(function, call)

    completed_at = NaiveDateTime.utc_now()

    changeset = Call.complete(call, %{
      completed_at: completed_at,
      duration: NaiveDateTime.diff(completed_at, start_at, :milliseconds),
      result: result
    })
    call = Repo.update!(changeset)

    {:ok, call}
  end
end
