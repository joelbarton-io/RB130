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
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
    # remove and return last item of @list
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type
    # we want to raise a TypeError if << passes in an object of the wrong type
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('str') }
    assert_raises(TypeError) { @list.add({}) }
    assert_raises(TypeError) { @list.add([]) }
    assert_raises(TypeError) { @list.add(nil) }
    assert_raises(TypeError) { @list.add(false) }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_add
    random_todo = Todo.new("random task")
    @list << random_todo
    @todos << random_todo
    assert_equal(@list.to_a, @todos)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(@list.size) || @list.item_at(1 - @list.size) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at # unsure
    assert_raises(IndexError) { @list.item_at(@list.size) || @list.item_at(1 - @list.size) }

    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.item_at(@list.size) || @list.item_at(1 - @list.size) }
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(@list.size) || @list.remove_at(1 - @list.size) }
    assert_same(@todo1, @list.remove_at(0))
    assert_same(@todo2, @list.remove_at(0))
    assert_same(@todo3, @list.remove_at(0))
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_return
    assert_equal(@list.each, @list)
  end

  def test_select
    @todo1.done!
    # select returns a new TodoList obj;
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select(&:done?).to_s)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end

  def test_all_done
    list_new = TodoList.new(@list.title)
    assert_equal(list_new.size, @list.all_done.size)
    @list.done!
    assert_equal(@todos, @list.all_done.to_a)
  end

  def test_all_not_done
    list_new = TodoList.new(@list.title)
    assert_equal(@todos, @list.all_not_done.to_a)
    @list.done!
    assert_equal(list_new.size, @list.all_not_done.size)
  end

  # def test_mark_done

  # end

  # def test_mark_all_done

  # end

  # def test_mark_all_undone

  # end
end
