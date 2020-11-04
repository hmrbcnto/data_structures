class Node
  attr_accessor :left, :right, :data
  def initialize()
    @left = nil
    @right = nil
    @data = nil
  end # => end of initialize method
end # => end of Node class

class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr)
  end #entriesnd of initialize

  def build_tree(arr)
    base_arr = arr.sort.uniq # => sorts array and removes none repeating entries
    root = Node.new() # => creates a new node class and assigns value to root variable
    root.data = base_arr[base_arr.length/2] # => sets data of Node instance 'root' to center element

    cursor = root # => cursor is now at root variable

    #recursion
    if base_arr.length > 1

      #divides the array into two sub arrays
      left_array = base_arr.slice(0, base_arr.length/2)
      right_array = base_arr.slice(base_arr.length/2+1, base_arr.length)

      #recurses, calling build_tree function on left_array and right_array
      cursor.left = self.build_tree(left_array)
      cursor.right = self.build_tree(right_array)

    end # => end of if conditional

    # => returns the root variable
    return root 
  end # => end of build_tree method

  def insert(val)
    #check if value is already within tree
    if self.find(val)
      puts "Value already in tree"
      return nil
    else
      place = false
    end # => end of conditional

    cursor = @root
    place = false
    until place = true
      if val > cursor.data && val > cursor.right.data
        #if value is greater than cursor data, move to right
        cursor = cursor.right
      elsif val < cursor.data && val < cursor.left.data
        #if value is lesser than cursor data, move to left
        cursor = cursor.left
      elsif val        
        
      end # => end of conditional
    end # => end of until 
  end # => end of insert method

  def find(val)
    cursor = @root
    result = nil
    while result == nil
      if val > cursor.data
        cursor = cursor.right
        result = cursor_checker(cursor) # => checks for end of tree
      elsif val < cursor.data
        cursor = cursor.left
        result = cursor_checker(cursor) # => checks for end of tree
      elsif val == cursor.data
        puts "Value is located in node #{cursor}, containing value #{cursor.data}"
        result = true
        return result
      else
      end # => end of conditional
    end # => end of until loop
  end # => end of find function

  def cursor_checker(cursor)
    #check if current cursor value is empty
    if cursor == nil
      #if empty, returns search failure
      puts "Value is not located in BST"
      return false
    else 
      #else, enables while loop to continue
      return nil
    end # => end of conditional
  end # => end of cursor_checker


  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end # => end of pretty_print method
end # => end of tree class

something = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
something.pretty_print

