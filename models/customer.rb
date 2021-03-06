require_relative("../db/sql_runner")

class Customer

attr_reader :id
attr_accessor :name, :funds

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @funds = options['funds'].to_i
end

def save()
  sql = "INSERT INTO customers (name, funds)
  VALUES ('#{@name}', '#{@funds}') RETURNING id"
  customer = SqlRunner.run(sql).first
  @id = customer['id'].to_i
end

def Customer.all()
  sql = "SELECT * FROM customers"
  return Customer.map_items(sql)
end


def Customer.delete_all() 
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end

def update()
  sql = "UPDATE customer SET (name, funds) = ('#{@name}' #{funds}') WHERE id = #{id}"
  customers = SqlRunner.run(sql)
  return customers.map{|customer| Customer.new(customer)} 
end

end