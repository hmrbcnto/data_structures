class LinkedList
  attr_accessor :name

  def initialize(name = nil)
    @head = nil
    @tail = nil
    @name = name
  end #end of initialize

  def append(val)
    new_node = Node.new(val)
    if @head ==  nil
      @tail = new_node
      @head = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
      @tail.next_node = nil
    end #end of if conditional
  end #end of append method

  def prepend(val)
    new_node = Node.new(val)
    if @tail == nil
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end #end of conditional
  end #end of prepend method

  def size
    cursor = @head
    counter = 0
    #start at head
    until cursor.next_node == nil
      counter += 1 
      cursor = cursor.next_node
    end #end of until
    return counter
  end #end of size method

  def head
    #return first node in the list
    @head
  end #end of head method

  def tail
    #return last node in the list
    @tail
  end #end of tail method

  def at(index)
    cursor = @head
    index_counter = 0
    until index_counter == index
      index_counter += 1
      cursor = cursor.next_node
    end #end of until loop

    return cursor

  end #end of index method

  def pop 
    cursor = @head
    until cursor.next_node == @tail
      cursor = cursor.next_node
    end #end of until loop
    cursor.next_node = nil
    @tail = cursor
  end #end of pop method

  def contains?(val)
    cursor = @head
    until cursor == @tail || cursor.value == val
      cursor = cursor.next_node
    end #end of until

    if cursor.value == val
      return true
    else 
      return false
    end #end of conditional

  end #end of contains? method

  def find(val)
    cursor = @head
    counter = 0
    until cursor == @tail || cursor.value == val
      cursor = cursor.next_node
      counter += 1
    end #end of until loop
  end #end of find method

  def to_s
    cursor = @head
    until cursor == nil
      if cursor.next_node == nil
        print "(#{cursor.value})"
      else
        print "(#{cursor.value}) --> "
      end #end of conditional
      cursor = cursor.next_node
    end #end of until
    puts " "
  end #end of to_s function


end #end of LinkedList class

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end 

end #end of Node class

something = LinkedList.new("Schokolade")

5.times do
  something.append(5)
end

something.to_s