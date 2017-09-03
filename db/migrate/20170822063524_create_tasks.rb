class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :content
      t.string :state, default: "todo"

      t.timestamps
    end
  end
end
