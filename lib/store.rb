class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:store_name, :presence => true)

    before_save(:titleize_store_name)

    private

    define_method(:titleize_store_name) do
      self.store_name=(store_name().titleize())
    end
end
