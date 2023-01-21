class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_picture
      t.string :role, :default => 'user'

      t.timestamps
    end
  end
end
