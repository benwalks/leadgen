class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.integer :q1, default: 0
      t.integer :q2, default: 0
      t.integer :q3, default: 0
      t.integer :q4, default: 0
      t.integer :q5, default: 0
      t.boolean :lead, default: false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
