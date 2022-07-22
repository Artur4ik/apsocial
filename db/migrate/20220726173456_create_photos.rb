class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :data
      
      t.timestamps
    end
  end
end
