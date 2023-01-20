class AddVoicesRefToJournals < ActiveRecord::Migration[7.0]
  def change
    add_reference :journals, :voices, null: false, foreign_key: true
  end
end
