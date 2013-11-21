class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :date
      t.references :user
      t.string :title
      t.text :subject

      t.timestamps
    end
  end
end
