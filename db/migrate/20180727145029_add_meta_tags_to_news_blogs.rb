class AddMetaTagsToNewsBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :news_blogs, :meta_keywords, :text
  end
end
