class CreatePostcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :postcodes do |t|
      t.string :postcode

      t.timestamps
    end
  end
end
