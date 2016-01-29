require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end

post('/stores') do
  @stores = Store.all
  store_name = params.fetch('store_name')
  Store.create({store_name: store_name})
  erb(:stores)
end

get('/stores/:id') do
  @brands = Brand.all
  @store = Store.find(params.fetch("id").to_i)
  erb(:store)
end

delete('/stores/:id/delete') do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete
  redirect('/')
end

patch('/stores/:id/edit') do
  @brands = Brand.all
  store_name = params.fetch('store_name')
  @store = Store.find(params.fetch("id").to_i)
  @store.update({:store_name => store_name})
  erb(:store)
end

# brands in prog

get('/brands') do
  @brands = Brand.all
  erb(:brands)
end

post('/brands') do
  @brands= Brand.all
  brand_name = params.fetch('brand_name')
  Brand.create({brand_name: brand_name})
  erb(:brands)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch("id").to_i)
  erb(:brand)
end

delete('/brands/:id/delete') do
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.delete
  redirect('/brands')
end

patch('/brands/:id/edit') do
  brand_name = params.fetch('brand_name')
  @brand = Brand.find(params.fetch("id").to_i)
  @brand.update({:brand_name => brand_name})
  erb(:brand)
end

patch('/stores/:id/brands') do
  @brands = Brand.all
  @brand = Brand.find(params.fetch("brand_id").to_i)
  @store = Store.find(params.fetch("id").to_i)
  @store.brands.push(@brand)
  erb(:store)
end






# post('/stores/:id/brands') do
#  brand_name = params.fetch('brand_name')
#  @brand = Brand.create({brand_name: brand_name})
#  @brands = Brand.all
#  @store = Store.find(params.fetch("id").to_i)
#  @store.brands.push(@brand)
#  erb(:store)
# end
