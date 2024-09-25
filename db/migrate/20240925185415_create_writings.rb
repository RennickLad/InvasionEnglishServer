class CreateWritings < ActiveRecord::Migration[7.2]
  def change
    create_table :writings do |t|
      t.text :body

      t.timestamps
    end
  end
end
