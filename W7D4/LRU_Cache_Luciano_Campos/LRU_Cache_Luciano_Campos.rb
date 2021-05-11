##Friday, January 23, 2021
##aAcademy > LRU Cache
##Luciano A. Campos

class LRUCache
    def initialize(size)
        @size = size
        @cache = []
    end

    # Returns number of elements currently in cache
    def count
        @cache.count
    end

    # Adds element to cache according to LRU principle
    def add (el)
        if @cache.include?(el)
            @cache.delete(el)
            @cache << el    
        elsif count >= @size 
            @cache.shift
            @cache << el   
        else
            @cache << el  
        end
    end

    # Shows the items in the cache, with the LRU item first
    def show
        p @cache
        nil
    end

end

