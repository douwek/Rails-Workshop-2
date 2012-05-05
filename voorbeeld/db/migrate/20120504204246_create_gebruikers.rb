class CreateGebruikers < ActiveRecord::Migration
  def change
    create_table :gebruikers do |t|
      t.string :naam
      t.string :email
      t.string :wachtwoord_hash
      t.string :wachtwoord_salt

      t.timestamps
    end
  end
end
