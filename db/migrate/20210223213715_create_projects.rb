class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :language
      t.string :githubUrl
      t.string :videoUrl

      t.timestamps
    end
  end
end
