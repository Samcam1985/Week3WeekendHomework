require('pg')

class SqlRunnder

  def self.run(sql)
    begin
      db = PG.connect({ dbname: 'cinema', host: 'localhost'})
      result = db.exec(sql)
    ensure
      db.close
    end
    return result
  end

end