class AddUserReferencesToChat < ActiveRecord::Migration[7.0]
  def change
    add_reference :chats, :owner, null: false
    add_reference :chats, :vet, null: false
  end
end
