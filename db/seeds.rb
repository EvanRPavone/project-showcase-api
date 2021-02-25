# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.create(
    title: "Favorite Breweries App",
    description: "A web application using javascript for the frontend and Rails API to manage the backend.",
    githubUrl: "https://github.com/EvanRPavone/favorite-breweries-frontend",
    videoUrl: "https://youtu.be/H1ueFQ45Apw",
    language: "JavaScript"
)

Project.create(
    title: "Sinatra Game Reviews",
    description: "Sinatra Game Reviews is a Website where a user can post a review of a game and also see other reviews by other users.",
    githubUrl: "https://github.com/EvanRPavone/sinatra-games",
    videoUrl: "https://youtu.be/j-aPzFtImqg",
    language: "Ruby"
)

Project.create(
    title: "Strong Missions",
    description: "This application/website is used to plan a trip for strong missions, the strong missions admin can view the trip and contact the user who planned the trip via email with more information regarding their trip. The user can log in and see their own planned trips but they cannot see anyone elses trip unless they are admin.",
    githubUrl: "https://github.com/EvanRPavone/StrongMissions",
    videoUrl: "https://youtu.be/_OcqbgDSsTs",
    language: "Ruby on Rails"
)

Project.create(
    title: "Super Droid Robots",
    description: "This program gives the user a way of seeing the new robots that superdroid has built by category. Shows the category, price, description and gives the user the url to the robot.",
    githubUrl: "https://github.com/EvanRPavone/cli-superdroid-robots",
    videoUrl: "https://youtu.be/AdQF3HjicvM",
    language: "CLI"
)

u = User.create(username: "Evan", password: "password")
u2 = User.create(username: "Tester", password: "test")
u3 = User.create(username: "Robert", password: "test")
users = [u, u2, u3]

# k = Keep.create(name: "Flatiron Projects", user: u)
# k.projects << Project.first
# k.projects << Project.find(2)
# k.projects << Project.find(3)
# k.projects << Project.find(4)

comments = ["Great Work!", "You definitely could have said more in your video demo", "Great idea!", "This is great!"]

Project.all.each{|project| 
    project.comments.create(
        user: users[rand(0..2)],
        project: project,
        text: comments[rand(0..3)]
    )
}
