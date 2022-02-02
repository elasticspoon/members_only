class DropsCommentsTable < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        drop_table :comments
      end
      dir.down do
        create_table :comments do |t|
          t.string :body
          t.references :has_comment, null: false, polymorphic: true
          t.references :user, null: false, foreign_key: true

          t.timestamps
        end
      end
    end
  end
end
