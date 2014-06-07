class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote
      t.references :votable, polymorphic: true
      t.timestamps
    end
    add_index :votes, [:votable_id, :votable_type]
  end
end
