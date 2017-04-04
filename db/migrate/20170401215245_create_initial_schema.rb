class CreateInitialSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, :limit => 50
      t.string :service_era, :limit => 50
      t.string :status
      t.timestamps 
    end
    create_table :organizations do |t|
      t.integer :creator_id, foreign_key: true
      t.string :name, :limit => 100, :null => false
      t.text :description, :limit => 350, :null => false
      t.string :era_served, :null => false 
      t.string :category, :null => false
      t.float :avg_rating, :null => false
      t.string :url, :null => false
      t.string :address1, :null => false
      t.string :address2
      t.string :city, :null => false
      t.string :state, :null => false
      t.integer :zipcode, :null => false
      t.integer :phone
      t.string :email
      t.timestamps
    end
    create_table :reviews do |t|
      t.integer :user_id, foreign_key: true
      t.integer :rating, :null => false
      t.text :feedback, :limit => 350, :null => false
      t.boolean :recommend, :null => false
      t.integer :organization_id, foreign_key: true
      t.timestamps
    end
  end
end


