class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, null: false, foreign_key: true
      t.integer :taggable_id, foreign_key: true
      t.string :taggable_type

      t.timestamps
    end
  end
end
