class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.text :content
      t.integer :topic_id
      t.integer :votes

      t.timestamps
    end
  end
end
