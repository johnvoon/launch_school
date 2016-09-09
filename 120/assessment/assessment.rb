module Delegable
  def delegate
    puts 'I delegated my work'
  end
end

class Employee
  attr_reader :name, :serial_number, :type

  def initialize(name, serial_number, type)
    @name = name
    @serial_number = serial_number
    @type = type
  end
  
  def vacation_days
    "I have #{@vacation_days} vacation days."
  end
  
  def work_location
    "I have a desk in the #{@work_location}"
  end
end

class Executive < Employee
  include Delegable

  def initialize(name, serial_number)
    super(name, serial_number, 'full-time')
    @vacation_days = 20
    @work_location =  'corner office'
  end

  def name
    "Exe #{@name}"
  end
end

class Manager < Employee
  include Delegable

  def initialize(name, serial_number)
    super(name, serial_number, 'full-time')
    @vacation_days = 14
    @work_location =  'regular private office'
  end

  def name
    "Mgr #{@name}"
  end
end

class Regular < Employee
  def initialize(name, serial_number)
    super(name, serial_number, 'full-time')
    @vacation_days = 10
    @work_location =  'cubicle farm'
  end
end

class PartTime < Employee
  def initialize(name, serial_number)
    super(name, serial_number, 'part-time')
    @vacation_days = 20
    @work_location =  'open workspace'
  end
end

executive = Executive.new("John", 123)
p executive.vacation_days
p executive.work_location
p executive.name
p executive.serial_number
p executive.type
executive.delegate

manager = Manager.new("Hello", 1234)
p manager.vacation_days
p manager.work_location
p manager.name
p manager.serial_number
p manager.type
executive.delegate

regular = Regular.new("Man", 1234123)
p regular.vacation_days
p regular.work_location
p regular.name
p regular.serial_number
p regular.type

part_time = PartTime.new("Hig", 123414413413)
p part_time.vacation_days
p part_time.work_location
p part_time.name
p part_time.serial_number
p part_time.type