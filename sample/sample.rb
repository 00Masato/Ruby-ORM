require '../lib/ruby_orm'

class Sample < RubyORM::Base

end

sample = Sample.new
sample.query("SELECT * FROM users").each do |row|
  puts row["id"]
  puts row["name"]
end