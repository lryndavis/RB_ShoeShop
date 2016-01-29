require('spec_helper')

describe(Store) do
  it("converts the store name to titlecase upon entry") do
    store = Store.create({:store_name => "the fancy boot store"})
    expect(store.store_name()).to(eq("The Fancy Boot Store"))
  end

  it("validates the prescence of a store name entry") do
    store = Store.new({:store_name => ""})
    expect(store.save()).to(eq(false))
  end
end
