class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.string :majors
      t.integer :start_year
      t.integer :end_year
      t.string :gpa
      t.text :activities
      t.text :honors
      t.text :minors
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
