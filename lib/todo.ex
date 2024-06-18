defmodule TodoApp.Todo do
  defstruct tasks: %{}

  def new do
    %TodoApp.Todo{}
  end

  def add_task(todo, id, task) do
    %TodoApp.Todo{todo | tasks: Map.put(todo.tasks, id, task)}
  end

  # List all the tasks
  def list_tasks(todo) do
    Enum.map(todo.tasks, fn {id, task} -> {id, task} end)
  end

  def remove_task(todo, id) do
    IO.puts(id)
    %TodoApp.Todo{todo | tasks: Map.delete(todo.tasks, 1)}
    IO.inspect(todo)
  end
end
