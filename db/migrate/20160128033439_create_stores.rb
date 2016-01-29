class CreateStores < ActiveRecord::Migration
  def change
    create_table(:stores) do |t|
      t.column(:store_name, :string)

      t.timestamps()
    end
  end
end
