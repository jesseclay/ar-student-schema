require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
  attr_reader :first_name, :last_name, :gender, :dob, :email, :phone
  def initialize(args)
    @first_name = args.fetch(:first_name)
    @last_name = args.fetch(:last_name)
    @gender = args.fetch(:gender)
    @DOB = args.fetch(:DOB)
    @email = args.fetch(:email)
    @phone = args.fetch(:phone)
  end

  def age
    Date.today.strftime("%Y").to_i - @dob.scan(/\d{4}/).to_i
  end

  def name
    @first_name + " " + @last_name
  end

end
