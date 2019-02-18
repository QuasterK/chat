class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nick
      t.string :name
      t.string :surname
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
