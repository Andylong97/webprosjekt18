# frozen_string_literal: true

class AddUserPasswordColumnToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :username, :string
    add_column :users, :password, :string
    add_column :users, :salt, :string
  end

  def down
    remove_column :users, :username
    remove_column :users, :password
    remove_column :users, :salt
  end
end
