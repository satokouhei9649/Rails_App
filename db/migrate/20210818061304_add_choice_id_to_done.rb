class AddChoiceIdToDone < ActiveRecord::Migration[6.1]
  def change
    add_column :dones, :choice_id, :integer
  end
end
