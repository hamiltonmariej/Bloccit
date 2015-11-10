class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :severity
      t.references :ratingable, polymorphic: true, index: true
      
      t.timestamps null: false
    end
  end
end
