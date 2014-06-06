class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest, :required => true
      t.string :email
      t.string :cohort

      t.timestamps
    end
  end
end
