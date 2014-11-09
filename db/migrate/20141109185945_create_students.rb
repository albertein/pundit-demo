class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :user_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
