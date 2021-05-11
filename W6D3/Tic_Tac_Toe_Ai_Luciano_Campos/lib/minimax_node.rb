class MinimaxNode

    attr_reader :minimax_value, :action

    #CLASS METHODS


    def self.set_successor_function(prc)
        @@set_successor_function = prc
    end

    def self.set_evaluation_function(prc)
        @@evaluation_function = prc
    end

    def self.set_termination_test(prc)
        @@termination_test = prc
    end

    #INSTANCE METHODS

    def initialize(state, action = nil)
        @state, @action = state, action
    end

    def minimax(take_maxium = true)
        if leaf_node?
            @minimax_value = get_score
            @action
        else
            choose_best_action(take_maxium)
        end
    end

    private

    def choose_best_action(take_maxium)
        best_value, best_action = set_best_value(take_maxium), nil

        generate_child_nodes.each do |child_node|
            child_node.minimax(!take_maxium)

            if child_action_is_best?(child_node, take_maxium)
                best_value = child_node.minimax_value
                best_action = child_node.action
            end

            break if child_action_is_best?(child_node, take_maxium)

        end

        @minimax_value = best_value
        best_action
    end

    def leaf_node?
        @@termination_test.call(@state)
    end

    def generate_child_nodes
        @@successor_function.call(@state)
    end

    def get_score
        @@evaluation_fuction.call(@state)
    end

    def child_action_is_best?(node, best_value, take_maxium)
        take_maxium ? node.minimax_value == 1 || !take_maxium && node.minimax_value == -1
    end

    def set_best_value(take_maxium)
        take_maxium ? Float::INFINITY * - 1 : Float::INFINITY
    end

end



