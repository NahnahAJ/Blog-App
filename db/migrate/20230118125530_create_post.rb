class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.datetime :createdAt
      t.datetime :updatedAt
      t.integer :commentsCounter
      t.string :likesCounter

      t.timestamps
    end
  end
end
