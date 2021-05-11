class PolyTreeNode
    include Searchable

    attr_accessor :value
    attr_reader :parent

    def initialize(value = nil)
        @value, @parent, @children = value, nil, []
    end

    def children
        @children.dup
    end

    def parent=(parent)
        return if self.parent == parent
        if self.parent
            self.parent._children.delete(self)
        end

        @parent = parent
        self.parent._children << self unless self.parent.nil?
        
        self
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if child && !self.children.include?(child)
            raise "Tried to remove node that isn't a child"
        end

        child.parent = nil
    end

    protected

    def _children
        @children
    end

end

module Searchable

    def dfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }
        return self if prc.call(self)

        children.each do |child|
            result = child.dfs(&prc)
            return result unless result.nil?
        end
        nil
    end

end 

