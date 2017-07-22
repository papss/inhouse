class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :name
      t.belongs_to :league, index: true
      t.timestamps
    end
  end
end
