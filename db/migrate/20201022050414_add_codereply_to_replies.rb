class AddCodereplyToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :codereply, :text
  end
end
