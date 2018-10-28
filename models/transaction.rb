require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader :id
  attr_accessor :seller_id, :category_id, :amount, :transaction_time, :description, :transaction_time_formatted, :transaction_time_formatted_html

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @seller_id = options['seller_id'].to_i if options['seller_id']
    @category_id = options['category_id'].to_i if options['category_id']
    @amount = options['amount'].to_f
    @transaction_time = options['transaction_time'] if options['transaction_time']
    @transaction_time_formatted = options['transaction_time_formatted'] if options['transaction_time_formatted']
    @transaction_time_formatted_html = options['transaction_time_formatted_html'] if options['transaction_time_formatted_html']
    @description = options['description'] if options['transaction_time']
  end

  def save()
    sql = "INSERT INTO transactions (seller_id, category_id, amount, transaction_time, description)
      VALUES ($1, $2, $3, $4, $5)
      RETURNING *;"
    values = [@seller_id, @category_id, @amount, @transaction_time, @description]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.find(id)
    sql = "SELECT *
      FROM transactions
      WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    transaction = Transaction.new(results[0])
    return transaction
  end

  def self.find_formatted(id)
    sql = "SELECT
        id,
        seller_id,
        category_id,
        amount,
        description,
        transaction_time,
        TO_CHAR(
          transaction_time,
          'DD-Mon-YYYY HH24:MI'
        ) transaction_time_formatted
      FROM transactions
      WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    transaction = Transaction.new(results[0])
    return transaction
  end

  def self.find_formatted_for_html_edit_form(id)
    sql = "SELECT
        id,
        seller_id,
        category_id,
        amount,
        description,
        transaction_time,
        TO_CHAR(
          transaction_time,
          'yyyy-MM-ddThh24:mm'
        ) transaction_time_formatted_html
      FROM transactions
      WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    transaction = Transaction.new(results[0])
    return transaction
  end


  def update()
    sql = "UPDATE transactions
      SET (seller_id, category_id, amount, transaction_time, description) = ($1, $2, $3, $4, $5)
      WHERE id = $6;"
    values = [@seller_id, @category_id, @amount, @transaction_time, @description, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions
      WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT *
      FROM transactions;"
    results = SqlRunner.run(sql)
    transactions = results.map { |result| Transaction.new(result) }
    return transactions
  end

  def self.all_formatted()
    sql = "SELECT
        id,
        seller_id,
        category_id,
        amount,
        description,
        transaction_time,
        TO_CHAR(
          transaction_time,
          'DD-Mon-YYYY HH24:MI'
        ) transaction_time_formatted
      FROM transactions
      ORDER BY transaction_time DESC;"
    results = SqlRunner.run(sql)
    transactions = results.map { |result| Transaction.new(result) }
    return transactions
  end

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def find_category
    sql = "SELECT *
      FROM categories
      WHERE id = $1;"
    values = [@category_id]
    results = SqlRunner.run(sql, values)
    category = Category.new(results[0])
    return category
  end

  def find_seller
    sql = "SELECT *
      FROM sellers
      WHERE id = $1;"
    values = [@seller_id]
    results = SqlRunner.run(sql, values)
    seller = Seller.new(results[0])
    return seller
  end

end
