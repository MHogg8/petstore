require_relative('../models/pet_shop')

get '/petshop' do
  #INDEX
  @stores = PetShop.all()
  erb :"petshop/index"
end

get '/petshop/new' do
  #NEW
  erb :"petshop/new"
end

post '/petshop' do
  #CREATE
  @store = PetShop.new( params )
  @store.save()
  redirect '/petshop'
end

get '/petshop/:id' do
  #SHOW
  @store = PetShop.find(params[:id])
  @pets = @store.pets()
  erb :"petshop/show"
end

get '/petshop/:id/edit' do
  #EDIT
  @store = PetShop.find(params[:id])
  erb :"petshop/edit"
end

post '/petshop/:id' do
  #UPDATE
  @store = PetShop.new( params )
  @store.update()
  redirect to("/petshop/#{params['id']}")
end

delete '/petshop/:id' do
  #DELETE
end