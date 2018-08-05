require "any/version"

class Any
  class << self
    # Always returns true in a comparison
    # 
    # @param other [Any]
    #   Any other type
    #   
    # @return true
    def ==(other)
      true
    end

    # Always returns true in a comparison
    # 
    # @param other [Any]
    #   Any other type
    #   
    # @return true
    def ===(other)
      true
    end

    # Always returns true from a proc
    #   
    # @return Proc[Any] => true
    def to_proc
      proc { true }
    end
  end
end
