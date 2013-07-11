require_relative '../config'



class UpdatedNameColumn < ActiveRecord::Migration
  def change
    add_column :students, :name, :string
  end
end
