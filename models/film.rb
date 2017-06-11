require_relative("../db/sql_runner")

class film

attr_reader :id
attr_accessor :title, :price

def initialize(options)
  @id = options['id'].to_i
  @title = options['title']
  @price = options['price'].to_i
end

def save()
  sql = "INSERT INTO films (title, price)
  VALUES ('#{@title}', '#{@price}') RETURNING id"
  film = SqlRunner.run(sql).first
  @id = film['id'].to_i
end
end