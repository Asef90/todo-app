# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

data = YAML.load_file(File.expand_path('data/seeds.yml', __dir__))

projects = data['projects']

projects.each do |project|
  created_project = Project.create!(title: project['title'])
  created_project.todos.create!(project['todos'])
end
