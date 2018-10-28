require_relative("../db/sql_runner.rb")

class Category

  attr_reader :id
  attr_accessor :name, :colour

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @colour = options['colour'] if options['colour']
  end

  def save()
    sql = "INSERT INTO categories (name, colour)
      VALUES ($1, $2)
      RETURNING *;"
    values = [@name, @colour]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.find(id)
    sql = "SELECT *
      FROM categories
      WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    category = Category.new(results[0])
    return category
  end

  def update()
    sql = "UPDATE categories
      SET (name, colour) = ($1, $2)
      WHERE id = $3;"
    values = [@name, @colour, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM categories
      WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT *
      FROM categories;"
    results = SqlRunner.run(sql)
    categories = results.map { |result| Category.new(result) }
    return categories
  end

  def self.all_except_none()
    sql = "SELECT *
      FROM categories
      WHERE name <> $1
      ORDER BY name;"
    values = ['None']
    results = SqlRunner.run(sql, values)
    categories = results.map { |result| Category.new(result) }
    return categories
  end

  def self.delete_all()
    sql = "DELETE FROM categories;"
    SqlRunner.run(sql)
  end

  def self.delete_all_except_none()
    sql = "DELETE FROM categories
      WHERE name <> $1;"
    values = ['None']
    SqlRunner.run(sql, values)
  end

end
