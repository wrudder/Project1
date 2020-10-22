class AddCodeReplyToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :code_reply, :string
    add_column :replies, :text, :string
  end
end
