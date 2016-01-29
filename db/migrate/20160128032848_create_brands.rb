class CreateBrands < ActiveRecord::Migration
  def change
    create_table(:brands) do |t|
      t.column(:brand_name, :string)

      t.timestamps()
    end
  end
end
