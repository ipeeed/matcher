class CreateTransporters < ActiveRecord::Migration[6.0]
  def change
    create_table :transporters do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
