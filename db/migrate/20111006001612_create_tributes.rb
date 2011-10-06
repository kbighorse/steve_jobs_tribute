class CreateTributes < ActiveRecord::Migration
  def self.up
    create_table :tributes do |t|
      t.string :name
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :tributes
  end
end
