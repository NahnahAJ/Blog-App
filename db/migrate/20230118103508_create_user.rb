class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo
      t.string :bio
      t.datetime :updatedAt
      t.datetime :createdAt
      t.integer :postsCounter

      t.timestamps
    end
  end
end
