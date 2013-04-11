class RenameColumnsBlogs < ActiveRecord::Migration
  def up
     rename_column :blogs, :comment, :content
     remove_column :blogs, :birddate      
  end

  def down
  end
end
