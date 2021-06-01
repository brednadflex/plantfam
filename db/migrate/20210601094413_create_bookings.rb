class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :client, null: false, foreign_key: {to_table: :users}
      t.references :provider, null: false, foreign_key: {to_table: :users}
      t.string :service_type
      t.date :start_date
      t.date :end_date
      t.boolean :confirmed, default: false, null: false
      t.boolean :completed, default: false, null: false

      t.timestamps
    end
  end
end
