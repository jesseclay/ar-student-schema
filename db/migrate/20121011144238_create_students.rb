require_relative '../config'

# this is where you should use an ActiveRecord migration to 

puts "migratin' baby"
class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |s|
      s.string :first_name
      s.string :last_name
      s.string :gender
      s.string :email
      s.string :phone
      s.date :birthday
      s.timestamps
    end
  end
end
