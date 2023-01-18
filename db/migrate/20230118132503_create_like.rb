class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.datetime :createdAt
      t.datetime :updatedAt

      t.timestamps
    end
  end
end
