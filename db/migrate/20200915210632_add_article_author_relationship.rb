class AddArticleAuthorRelationship < ActiveRecord::Migration[6.0]
  def change
    change_table :articles do |t|
      t.references :author
    end
  end
end
