require_relative("../db/sql_runner.rb")

class Seller

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO sellers (name)
      VALUES ($1)
      RETURNING *;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.find(id)
    sql = "SELECT *
      FROM sellers
      WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    seller = Seller.new(results[0])
    return seller
  end

  def update()
    sql = "UPDATE sellers
      SET name = $1
      WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM sellers
      WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT *
      FROM sellers;"
    results = SqlRunner.run(sql)
    sellers = results.map { |result| Seller.new(result) }
    return sellers
  end

  def self.all_except_none()
    sql = "SELECT *
      FROM sellers
      WHERE name <> $1;"
    values = ['None']
    results = SqlRunner.run(sql, values)
    sellers = results.map { |result| Seller.new(result) }
    return sellers
  end

  def self.delete_all()
    sql = "DELETE FROM sellers;"
    SqlRunner.run(sql)
  end

  def self.delete_all_except_none()
    sql = "DELETE FROM sellers
      WHERE name <> $1;"
    values = ['None']
    SqlRunner.run(sql, values)
  end

end
