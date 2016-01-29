require('spec_helper')

describe(Brand) do
  it("converts the brand name to titlecase upon entry") do
    brand = Brand.create({:brand_name => "fancy boots"})
    expect(brand.brand_name()).to(eq("Fancy Boots"))
  end
end
