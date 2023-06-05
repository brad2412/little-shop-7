class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
