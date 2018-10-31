defmodule FaasWebWeb.FunctionView do
  use FaasWebWeb, :view

  def render("index.json", %{functions: functions}) do
    %{
      functions: Enum.map(functions, &render_function/1)
    }
  end

  def render("errors.json", %{errors: errors}) do
    %{
      errors: Enum.map(errors, &extract_error/1)
    }
  end

  def render("show.json", function) do
    render_function(function)
  end

  def render_function(function) do
    %{
      id: function.id,
      name: function.name,
      code: function.code,
      inserted_at: function.inserted_at,
      updated_at: function.updated_at
    }
  end

  def extract_error({field, {message, _opts}}) do
    %{field => message}
  end
end
