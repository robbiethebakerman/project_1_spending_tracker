class Budget

  attr_reader :id
  attr_accessor :type, :amount, :alert_range

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @amount = options['amount'].to_f if options['amount']
    @alert_range = options['alert_range'].to_f if options['alert_range']
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

    def update_amount_and_alert()
      sql = "UPDATE budgets
        SET (amount, alert_range) = ($1, $2)
        WHERE id = $3;"
      values = [@amount, @alert_range, @id]
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
