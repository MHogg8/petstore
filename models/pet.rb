require('pg')

class Pet

  attr_reader :id, :name, :species, :image, :shop

  def initialize(params)
    @id= params['id'] or nil
    @name = params['name']
    @species = params['species']
    @image = params['image']
    @shop = params['shop_id']
  end

  def save
    sql= "INSERT INTO pet (name, species, image, 
      shop_id ) VALUES ('#{name}', '#{species}', '#{image}', #{shop})"
    Pet.run_sql(sql)
  end

  def self.run_sql(sql)
    begin
      db= PG.connect({dbname: 'pet_shop', host: 'localhost'})
        result = db.exec(sql)
        return result
    ensure
      db.close
    end
  end

  def self.find(id)
   sql = "SELECT * FROM pet WHERE id= #{id}"
   result = Pet.run_sql( sql )
   return Pet.new( result[0] )
  end

  def update
    Pet.run_sql("UPDATE pet SET name= '#{@name}', species= '#{@species}', image = '#{@image}', '#{@shop}'")
  end

  def store
    result = Pet.run_sql("SELECT * FROM petshop WHERE id= #{@shop} ")
    return result
  end
    
  

end