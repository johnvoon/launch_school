# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

require 'pry'

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  def <<(todo)
    raise TypeError, 'Can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end

    list
  end

  def find_by_title(todo_title)
    matches = select { |todo| todo.title == todo_title }
    matches ? matches.first : nil
  end

  def return_done_todos
    matches = select { |todo| todo.done? }
    matches ? matches : nil
  end

  def return_undone_todos
    matches = select { |todo| !todo.done? }
    matches ? matches : nil
  end

  def mark_as_done(todo_title)
    match = find_by_title(todo_title)
    match.done!
  end

  def mark_all_as_done
    each { |todo| todo.done! }
  end

  def mark_all_as_undone
    each { |todo| todo.undone! }
  end
end

system 'clear'

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)

puts list

puts "Find Buy milk todo"
p list.find_by_title("Buy milk")
puts ""
puts "Find Buy hello todo"
p list.find_by_title("Buy hello")
puts ""
puts "Return done todos"
p list.return_done_todos
puts ""
puts "Return undone todos"
p list.return_undone_todos
puts ""
puts "Mark Buy milk as done"
p list.mark_as_done("Buy milk")
puts list
puts ""
puts "Mark all todos as done"
p list.mark_all_as_done
puts ""
puts list
puts ""
puts "Mark all todos as undone"
p list.mark_all_as_undone
puts ""
puts list