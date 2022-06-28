module RubyORM
  class ResultVal
    include Enumerable

    def initialize(query_result)
      @query_result = query_result
    end

    def size
      @query_result.count
    end

    def each(&block)
      @query_result.each(&block)
    end
  end
end
