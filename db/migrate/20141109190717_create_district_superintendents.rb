class CreateDistrictSuperintendents < ActiveRecord::Migration
  def change
    create_table :district_superintendents do |t|
      t.string :name
      t.integer :district_id
      t.integer :user_id

      t.timestamps
    end
  end
end
