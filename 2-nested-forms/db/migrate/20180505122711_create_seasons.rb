class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.integer :number
      t.references :show, foreign_key: true

      t.timestamps
    end
  end
end
