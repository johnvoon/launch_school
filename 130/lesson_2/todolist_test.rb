require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @todos.size)
  end

  def test_first
    assert_equal(@todo1, @todos.first)
  end

  def test_last
    assert_equal(@todo3, @todos.last)
  end

  def test_shift
    first_todo = @list.shift
    assert_equal(@todo1, first_todo)
    assert_includes(@list.to_a, @todo2, @todo3)
    assert_equal(2, @list.size)
  end

  def test_pop
    last_todo = @list.pop
    assert_equal(@todo3, last_todo)
    assert_includes(@list.to_a, @todo1, @todo2)
    assert_equal(@todo2, @list.last)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) do
      @list.add(3)
    end
  end

  def test_add_alias
    new_todo = Todo.new("Walk the dog")
    @list.add(new_todo)
    todos = @todos << new_todo

    assert_equal(todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    assert_raises(IndexError) {@list.mark_undone_at(100) }
  end

  def test_mark_all_as_done
    @list.mark_all_as_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done_at_1
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_as_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_returns_original_list
    each_return_value = @list.each { |todo| nil }
    assert_equal(@list, each_return_value)
  end

  def test_select
    list = TodoList.new(@list.title)
    list.add(@todo1)
    selection = @list.select { |todo| todo.title == "Buy milk" }
    assert_equal(list.to_s, selection.to_s)
  end
end