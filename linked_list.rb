class LinkedList
  def initialize()
    @linked_list = []
  end #end of initialize method

  def append(value)
    @linked_list.push(value)
  end #end of append method

  def prepend(value)
    @linked_list.unshift(value)
  end #end of prepend function

  def size() #returns number of nodes in the list
    @linked_list.length
  end #end of size method

  def head()
    @linked_list[0]
  end #end of head method

  def tail()
    @linked_list[-1]
  end #end of tail method

  def at(index)
    @linked_list[index]
  end #end of at method

  def pop()
    @linked_list.pop
  end #end of pop method

  def contains?(value)
    @linked_list.include?(value)
  end #end of contains? method

  def find(value)
    @linked_list.each_with_index(|val, index| return index if val == value  )
  end #end of find method

  def to_s()
    @linked_list.map(
      |val| do 
        if !self.tail(val)
          print "(#{val}) --> "
        else 
          print "(#{val})"
        end #end of if conditional
        )
  end #end of to_s method

end #end of linkedlist class

class Node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end #end of initialize method
end #end of node class