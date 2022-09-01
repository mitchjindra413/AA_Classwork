require_relative "tree_node"

class KnightPathFinder

    attr_reader :root_node

    def self.root_node(pos)
        PolyTreeNode.new(pos)
    end

    def initialize(pos)
        @start = pos
        @root_node = KnightPathFinder.root_node(pos)
        @considered_positions = [@start]
    end


    def self.valid_moves(pos)
        x, y = pos
        valid_pos = []
        if (x + 2) >= 0 && (x + 2) < 8 && (y + 1) >= 0 && (y + 1) < 8 
            valid_pos << [x+2, y+1]
        end
        if (x + 2) >= 0 && (x + 2) < 8 && (y - 1) >= 0 && (y - 1) < 8 
            valid_pos << [x+2, y-1]
        end
        if (x - 2) >= 0 && (x - 2) < 8 && (y - 1) >= 0 && (y - 1) < 8 
            valid_pos << [x-2, y-1]
        end
        if (x - 2) >= 0 && (x - 2) < 8 && (y + 1) >= 0 && (y + 1) < 8 
            valid_pos << [x-2, y+1]
        end
        if (x + 1) >= 0 && (x + 1) < 8 && (y - 2) >= 0 && (y - 2) < 8 
            valid_pos << [x+1, y-2]
        end
        if (x + 1) >= 0 && (x + 1) < 8 && (y + 2) >= 0 && (y + 2) < 8 
            valid_pos << [x+1, y+2]
        end
        if (x - 1) >= 0 && (x - 1) < 8 && (y + 2) >= 0 && (y + 2) < 8 
            valid_pos << [x-1, y+2]
        end
        if (x - 1) >= 0 && (x - 1) < 8 && (y - 2) >= 0 && (y - 2) < 8 
            valid_pos << [x-1, y-2]
        end
        valid_pos
    end

    def new_move_positions(pos)
        possible = KnightPathFinder.valid_moves(pos)
        uniq_pos = possible - @considered_positions
        @considered_positions = @considered_positions + uniq_pos
        uniq_pos
    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            first = queue.shift
            children = new_move_positions(first.value)
            children.each do |child|
                child_node = PolyTreeNode.new(child)
                first.add_child(child_node)
                queue << child_node
            end
        end
        return @considered_positions.length
    end

    def find_path(end_pos)
        tree = self.root_node.dfs(end_pos)
        trace_path_back(tree)
        
    end

    def trace_path_back(node)
        move_order = []
        current_child = node
        until current_child.parent == nil
            move_order.unshift(current_child.value)
            current_child = current_child.parent
        end
        move_order.unshift(@start)
    end
end
