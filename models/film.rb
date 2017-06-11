require_relative("../db/sql_runner")

class Film

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

def Film.delete_all() 
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

def Film.all()
  sql = "SELECT * FROM films"
  return Film.map_items(sql)
end

def update()
  sql = "UPDATE film SET (title, price) = ('#{@title}' #{price}') WHERE id = #{id}"
  films = SqlRunner.run(sql)
  return films.map{|film| Film.new(film)} 

end

def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON users.id = tickets.user_id
    WHERE tickets.film_id = #{@id}"
    return Customer.map_items(sql)
  end
end