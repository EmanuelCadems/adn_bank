class CreateMutants < ActiveRecord::Migration[5.2]
  def change
    create_table :mutants do |t|
      t.text :dna, default: [].to_yaml

      t.timestamps
    end
  end
end
