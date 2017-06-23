class CreatePostcodeData < ActiveRecord::Migration[5.0]
  def change
    create_table :postcode_data do |t|
      t.integer :row_id
      t.string :postcode

      t.timestamps
    end
  end
end
