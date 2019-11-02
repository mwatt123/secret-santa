class CreateSanta < ActiveRecord::Migration[6.0]
  def change
    create_table :santa do |t|
      t.string     :name
      t.string     :email
      t.string     :token
      t.references :family

      t.timestamps
    end
  end
end
