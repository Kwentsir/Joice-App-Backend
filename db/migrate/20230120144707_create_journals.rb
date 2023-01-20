class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.datetime :date
      t.text :transcribed_text
      t.string :file_name

      t.timestamps
    end
  end
end
