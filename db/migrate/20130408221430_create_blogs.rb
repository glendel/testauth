class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :picture
      t.string :name
      t.date :birddate
      t.text :comment

      t.timestamps
    end
  end
end
