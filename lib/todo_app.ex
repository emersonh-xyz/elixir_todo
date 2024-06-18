defmodule TodoApp do
  alias TodoApp.Todo

  def start(_type, _args) do
    IO.puts("To-Do App")
    main_loop(Todo.new())
  end

  def main_loop(todo) do
    IO.puts("1. Create a task")
    IO.puts("2. View tasks")
    IO.puts("3. Remove a task")
    IO.puts("4. Quit")

    input = IO.gets("> ") |> String.trim() |> String.to_integer()

    case input do
      # Add task
      1 ->
        todo = add_task(todo)
        main_loop(todo)

      # # List tasks
      2 ->
        list_tasks(todo)
        main_loop(todo)

      # Remove tasks
      3 ->
        todo = remove_task(todo)
        main_loop(todo)

      4 ->
        IO.puts("Quitting")

      _ ->
        IO.puts("Invalid option provided")
        main_loop(todo)
    end
  end

  def add_task(todo) do
    id = map_size(todo.tasks) + 1
    IO.puts("Enter a description for your task")
    description = IO.gets("> ")
    Todo.add_task(todo, id, description)
  end

  def list_tasks(todo) do
    IO.puts("Tasks: [#{map_size(todo.tasks)}]")

    Enum.each(todo.tasks, fn {id, task} ->
      IO.puts("#{id}: #{task}")
    end)
  end

  def remove_task(todo) do
    list_tasks(todo)
    IO.puts("Enter task ID to remove: ")
    id = IO.gets("> ") |> String.trim() |> String.to_integer()
    Todo.remove_task(todo, id)
  end
end
