class CreateSporcads < ActiveRecord::Migration
  def change
    create_table :sporcads do |t|
      t.integer :academy_id
      t.integer :sport_id

      t.timestamps
    end
  end
end
