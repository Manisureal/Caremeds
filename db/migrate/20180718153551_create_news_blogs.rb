class CreateNewsBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :news_blogs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
