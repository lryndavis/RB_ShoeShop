class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)

  before_save(:titleize_brand_name)

    private

    define_method(:titleize_brand_name) do
      self.brand_name=(brand_name().titleize())
    end
  end
