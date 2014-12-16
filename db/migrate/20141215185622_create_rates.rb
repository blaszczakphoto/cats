class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :user_id
      t.references :photo

      t.timestamps
    end
  end
end
