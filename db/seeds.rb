# Add seed data here. Seed your database with `rake db:seed`
felix = Artist.create(name: "Felix")
linh = Artist.create(name: "Linh")

cry = Song.create(name: "Cry", artist_id: 1)
happy = Song.create(name: "Happy", artist_id: 2)
money = Song.create(name: "Money", artist_id: 3)

pop = Genre.create(name: "Pop")
rock = Genre.create(name: "Rock")
hiphop = Genre.create(name: "Hip Hop")

SongGenre.create(song_id: cry, genre_id: pop)
SongGenre.create(song_id: happy, genre_id: rock)
SongGenre.create(song_id: money, genre_id: hiphop)
