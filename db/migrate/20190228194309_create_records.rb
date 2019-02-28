class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :pages, null: false
      t.string :dewey_decimal_code, null: false
      t.integer :book_read_status, null: false, default: 0

      t.timestamps
    end
  end
end
