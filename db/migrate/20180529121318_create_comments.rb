class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      # t.belongs_to :memo, foreign_key: true
      
      t.references :memo, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
