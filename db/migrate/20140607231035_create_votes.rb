class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote, :defualt => 1
      t.references :votable, polymorphic: true
      t.timestamps
    end
    add_index :votes, [:votable_id, :votable_type]
  end
end
