class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    artists = Artist.all.map do |artist|
      artist.name
    end
    if artists.include?("Drake")
      drake = Artist.find_by(name: "Drake")
      self.artist = drake
    else
      drake = Artist.create(name: "Drake")
      self.artist = drake
    end
  end
end