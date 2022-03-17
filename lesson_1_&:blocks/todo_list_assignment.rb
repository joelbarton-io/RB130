# frozen_string_literal: true

# This class represents a todo item and its associated
# data: title and description. There's also a "done"
# flag to show whether this todo item is done.
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
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

  def ==(other)
    title == other.title &&
      description == other.description &&
      done == other.done
  end
end

class ToDoTypeError < TypeError; end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.
class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  private :todos

  def add(todo)
    raise ToDoTypeError "Can only add Todo objects!" unless todo.instance_of? Todo
    todos.push(todo)
    self
  end

  alias << add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def remove_at(idx)
    todos.delete_at(idx)
  end

  def done?
    todos.all?(&:done?)
  end

  def done!
    todos.each(&:done!)
  end

  # def each # Me
  #   count = 0
  #   while count < todos.size
  #     yield(todos[count])
  #     count += 15
  #   end
  #   self
  # end

  def each # LS
    todos.each { |todo| yield(todo) }
    self
  end

  # def select # Me
  #   selected_tasks = Array.new

  #   each do |task|
  #     ans = yield(task)
  #     selected_tasks << task if ans
  #   end
  #   modified_todolist_obj = TodoList.new(title)
  #   modified_todolist_obj.todos = selected_tasks
  #   modified_todolist_obj
  # end

  def select # LS
    list = TodoList.new(title)
    each do |todo|
      list << todo if yield(todo)
    end
    list
  end

  def find_by_title(str)
    select { |el| el.title == str }.first
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select { |el| !el.done }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end

  def to_s
    str = "----#{title} ----\n"
    str << todos.map(&:to_s).join("\n")
    str
  end
end

vacuum   = Todo.new("vacuum", "basement room")
laundry  = Todo.new("laundry", "fold cloths")
bathroom = Todo.new("bathroom", "clean counter + sink")

today = TodoList.new('Today')

today.add vacuum
today << laundry
today << bathroom

today.mark_done_at(2)
today.mark_done_at(1)
# today.each { |todo| puts todo }

# benefits of custom `each`:
# - provides a generic way to iterate through a ToDoList object

# - The entire goal of creating a class and encapsulating logic in a class is to hide
# implementation details and contain ripple effects when things change. Prefer to use
# the class's interface where possible.

# completed = today.select(&:done?)
# p completed

# p today.find_by_title("vacuum")
# p today.all_done
# p today.all_not_done
p today.mark_all_done
p today.all_done
p today.mark_all_undone
p today.all_not_done

# class is generic and thus powerful, since we leave much of how things work (exact implementation) to the caller
