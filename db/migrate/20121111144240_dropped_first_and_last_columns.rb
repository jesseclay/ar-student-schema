require_relative '../config'



class DroppedFirstAndLastColumns < ActiveRecord::Migration
  def change
    remove_column :students, :first_name
    remove_column :students, :last_name
  end
end
