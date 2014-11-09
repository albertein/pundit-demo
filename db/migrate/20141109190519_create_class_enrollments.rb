class CreateClassEnrollments < ActiveRecord::Migration
  def change
    create_table :class_enrollments do |t|
      t.integer :school_class_id
      t.integer :student_id
      t.integer :grade

      t.timestamps
    end
  end
end
