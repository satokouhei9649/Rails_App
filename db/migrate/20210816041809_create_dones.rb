class CreateDones < ActiveRecord::Migration[6.1]
  def change
    create_table :dones do |t|
      t.integer :done_user
      t.integer :done_topic
      t.integer :done

      t.timestamps
    end
  end
end
