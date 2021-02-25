class CreateStockpileProjectJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :stockpiles, :projects do |t|
      t.index [:stockpile_id, :project_id]
      t.index [:project_id, :stockpile_id]
    end
  end
end
