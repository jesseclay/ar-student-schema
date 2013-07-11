require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
  # attr_accessor :first_name, :last_name, :gender, :birthday, :email, :phone

  def age
    now = Date.today
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def name
    first_name + " " + last_name
  end

  validates :email, format: { with: /.+@.+[.].{2,}/,
                              message: "invalid email"}                            
  validates :email, uniqueness: true
  validate :age_greater_than_4
  validates :phone, format: { with: /\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})/,
                              message: "invalid phone"}

  def age_greater_than_4
    errors.add(:birthday, "YOU ARE TOO YOUNG") if self.age < 5
  end

end

students = Student.all
students.each do |student|
  student.update_attributes(
    :name => student.name)
  student.save
end
