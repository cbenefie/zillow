class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :idcnum
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :hometype
      t.integer :lot
      t.integer :sqft
      t.float :bath
      t.float :bed
      t.float :total
    end
  end
end
