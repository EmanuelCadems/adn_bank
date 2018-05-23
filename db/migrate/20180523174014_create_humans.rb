class CreateHumans < ActiveRecord::Migration[5.2]
  def change
    create_table :humans do |t|
      t.text :dna, default: [].to_yaml

      t.timestamps
    end
  end
end
