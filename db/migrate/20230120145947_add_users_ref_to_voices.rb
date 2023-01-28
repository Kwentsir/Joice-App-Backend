class AddUsersRefToVoices < ActiveRecord::Migration[7.0]
  def change
    add_reference :voices, :user, null: false, foreign_key: true
  end
end
