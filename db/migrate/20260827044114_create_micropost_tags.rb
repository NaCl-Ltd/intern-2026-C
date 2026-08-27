class CreateMicropostTags < ActiveRecord::Migration[8.1]
  def change
    create_table :micropost_tags do |t|
      t.references :micropost, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :micropost_tags, [:micropost_id, :tag_id], unique: true
  end
end