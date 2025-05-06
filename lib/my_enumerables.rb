module Enumerable
  # Your code goes here
  # 
  # Define my_each_with_index here
  def my_each_with_index
    if block_given?
      index = 0
      for elem in self do
        yield elem, index
        # increment index
        index += 1
      end    
    end
    return self
  end


  # Define my_select here
  def my_select
    select_array = Array.new()
    if block_given?
      for elem in self do
        if ( yield(elem) == true )
          select_array << elem
        end
      end
      return select_array    
    end  
    return self    
  end

  # Define my_all here
  def my_all?
    if block_given?
      for elem in self do
        if ( yield(elem) == false )
          return false
        end
      end
    end  
    return true         
  end

  # Define my_any here
  def my_any?
    if block_given?
      for elem in self do
        if ( yield(elem) != false && yield(elem) != nil)
          return true
        end
      end
      return false
    end  
    return true          
  end

  # Define my_none here
  def my_none?
    if block_given?
      for elem in self do
        if ( yield(elem) == true )
          return false
        end
      end
    end  
    return true        
  end

  # Define my_count here
  def my_count(*args)
    da_count = 0
    # if !ARGV.empty?
    #   for elem in self do
    #     if ( ARGV[0] == true )
    #       da_count += 1
    #     end
    #   end
    # end
    if block_given?
      for elem in self do
        if ( yield(elem) == true )
          da_count += 1
        end
      end
    else
      da_count = self.length()
    end   
    return da_count        
  end

  # Define my_map here
  def my_map
    some_array = Array.new()
    if block_given?
      for elem in self do
        some_array << yield(elem)
      end
      return some_array
    end  
    return self        
  end

  # Define my_inject here
  def my_inject(*args)
    if args.empty?
      memo = self[0]     
    else
      memo = args[0]
    end
    if block_given?
      for elem in self do
        memo = yield(memo, elem)
      end
      return memo
    end     
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

  # Define my_each here
  def my_each
    if block_given?
      for elem in self do
        yield elem
      end    
    end
    return self
  end

end
