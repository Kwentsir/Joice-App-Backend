class CreateVoices < ActiveRecord::Migration[7.0]
  def change
    create_table :voices do |t|
      t.string :voice_file
      t.string :file_name
      t.datetime :date

      t.timestamps
    end
  end
end
