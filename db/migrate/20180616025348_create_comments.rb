class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.references :post, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
