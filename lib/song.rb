# The Song class will be responsible for creating songs given each
# filename and sending the artist's name (a string) to the Artist class

# class Song

# 	attr_accessor :name, :artist

# 	def initialize(name)
# 		@name = name
# 	end

# 	def artist_name=(file_name)
# 		self.artist =  Artist.find_or_create_by_name(name)
# 		artist.add_song(self)
# 	end

# 	def self.new_by_filename(file_name)
# 		new_song = Song.new(file_name.split(" - ")[1])
# 		if new_song.artist_name.include?(file_name.split(" - ")[0]) == false
# 			new_song.artist_name = file_name.split(" - ")[0]
# 		end
# 		new_song
# 	end


# end

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end