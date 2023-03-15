class AddForeignKeyToChat < ActiveRecord::Migration[7.0]
  def change
  end

  add_foreign_key :chats, :users, column: :owner_id
  add_foreign_key :chats, :users, column: :vet_id
end
