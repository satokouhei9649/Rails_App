class RemoveVotesDoneFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users,:votes_done,:integer
  end
end
