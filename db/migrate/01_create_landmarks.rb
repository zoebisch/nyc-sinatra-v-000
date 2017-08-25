class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name
      t.string :figure_id
      t.integer :year_completed
    end
  end
end
