class CreateIdentities < ActiveRecord::Migration
  def self.up
    create_table :identities do |t|
      t.text :private_key
      t.text :public_key

      t.timestamps
    end
  end

  def self.down
    drop_table :identities
  end
end
