require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all
  erb(:index)
end

post('/stores') do
  store_name = params.fetch('store_name')
  Store.create({store_name: store_name})
  redirect ('/')
end

get('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i)
  erb(:store)
end

delete('/stores/:id/delete') do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete
  redirect('/')
end

patch('/stores/:id/edit') do
  store_name = params.fetch('store_name')
  @store = Store.find(params.fetch("id").to_i)
  @store.update({:store_name => store_name})
  erb(:store)
end

post('/stores/:id/brands') do
 brand_name = params.fetch('brand_name')
 @brand = Brand.create({brand_name: brand_name})
 @brands = Brand.all
 @store = Store.find(params.fetch("id").to_i)
 @store.brands.push(@brand)
 erb(:store)
end
