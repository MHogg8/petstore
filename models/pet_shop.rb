require('pg')


class PetShop

  attr_reader :id, :name, :address, :stock

  def initialize (params)
    @id = params['id'] or nil
    @name = params['name']
    @address = params['address']
    @stock = params['stock']
  end

  def save
    sql= "INSERT INTO pet_shop (name, address, stock)  VALUES ('#{name}', '#{address}', '#{stock}')"
    PetShop.run_sql(sql)
  end

  def self.run_sql(sql)
    begin
      db= PG.connect({dbname: 'pet_shop', host: 'localhost'})
        result = db.exec(sql)
    ensure
      db.close
    end
    return result
  end

  def self.find(id)
   sql = "SELECT * FROM pet_shop WHERE id = #{id}"
   result = PetShop.run_sql( sql )
   return PetShop.new( result[0] )
  end

  def update
    PetShop.run_sql("UPDATE pet_shop SET name= '#{@name}', address = '#{@address}', stock = '#{@stock}' Where id='#{id}'")
  end

  def self.all()
    sql = "SELECT * FROM pet_shop"
    store = PetShop.run_sql( sql )
    result = store.map { |store| PetShop.new(store) } 
  end

  def pets
    sql = "SELECT * FROM pet WHERE id=#{@id} ORDER BY name"
    pets = PetShop.run_sql(sql)
    result = pets.map { |pet| Pet.new(pet) } 
  end

end