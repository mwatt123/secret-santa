class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.references :secret_santa, class_name: 'Santa'
      t.references :recipient,    class_name: 'Santa'
      t.integer    :year

      t.timestamps
    end
  end
end
