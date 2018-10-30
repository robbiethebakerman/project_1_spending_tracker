class Budget

  attr_reader :id
  attr_accessor :type, :amount

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @amount = options['amount'] if options['amount']
  end

    def self.find(id)
      sql = "SELECT *
        FROM budgets
        WHERE id = $1;"
      values = [id]
      results = SqlRunner.run(sql, values)
      budget = Budget.new(results[0])
      return budget
    end

    def self.find_by_type(type)
      sql = "SELECT *
        FROM budgets
        WHERE type = $1;"
      values = [type]
      results = SqlRunner.run(sql, values)
      budget = Budget.new(results[0])
      return budget
    end

    def update_amount()
      sql = "UPDATE budgets
        SET amount = $1
        WHERE id = $2;"
      values = [@amount, @id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT *
        FROM budgets;"
      results = SqlRunner.run(sql)
      budgets = results.map { |result| Budget.new(result) }
      return budgets
    end

end
