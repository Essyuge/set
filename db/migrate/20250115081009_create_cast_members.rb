class CreateCastMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :cast_members do |t|
      t.string :name
      t.string :role
      t.belongs_to :production, null: false, foreign_key: true

      t.timestamps
    end
  end
end
