require_relative('../models/pet_shop')
require_relative('../models/pet')

post '/pets' do
  #CREATE
  @pet = Pet.new( params )
  @pet.save()
  redirect to("/petshop/#{params['shop']}")
end

get '/pets/:id' do
  #SHOW
  @pet = Pet.find(params[:id])
  @store = @pet.store()
  erb :"pets/show"
end

get '/pets/:id/edit' do
  #EDIT
  @pet = Pet.find(params[:id])
  @store = PetShop.all()
  erb :"pets/edit"
end

post '/pets/:id' do
  #UPDATE
  @pet = Pet.new( params )
  @pet.update()
  redirect to("/petshop/#{params['shop']}")
end

delete '/pets/:id' do
  #DELETE
end