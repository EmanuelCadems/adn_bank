class CreateMutants < ActiveRecord::Migration[5.2]
  def change
    create_table :mutants do |t|
      t.text :dna

      t.timestamps
    end
  end
end
