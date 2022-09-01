require 'byebug'
class PolyTreeNode

    attr_reader :parent, :value, :children
    
    def initialize(value, parent = nil)
        @value = value
        @parent = parent
        @children = []
    end

    # def inspect
    #     "value = #{@value}"
    # end

    def parent=(node)
        if node == nil
            self.parent.children.delete(self)
        elsif self.parent == nil
            node.children << self
        elsif self.parent != node
            self.parent.children.delete(self)
            node.children << self
        end
        @parent = node
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
    end

    def dfs(target_value) #check node value 
        return self if self.value == target_value
        
        self.children.each do |el|
            stack = el.dfs(target_value)
            return stack if !stack.nil?
        end

        nil
    end

    def bfs(target_value)
        local = [self]
        
        until local.empty?
            first = local.shift
            if first.value == target_value
                return first
            end
            first.children.each do |child|
                local << child
            end
        end
        nil
    end

    
end


