require "pry"
require "active_record"

# Setting up a Database connection
Activerecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/students.sqlite"
)
# Once 'establish_connection is run, ActiveRecord::Base keeps it stored as a class variable at ActiveRecord::Base.connection'

# Create a Students table
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT
  )
SQL
ActiveRecord::Base.connection.execute(sql)

# Log SQL output to the terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Have the Student class inherit from ActiveRecord::Base
class Student < ActiveRecord::Base
end

binding.pry
""
