module YouTube
  class Playlist
    attr_reader :thumbnail, :title, :description

    def initialize(data = {})
      @thumbnail = data[:items].first[:snippet][:thumbnails][:high][:url]
      @title = data[:items].first[:snippet][:title]
      @description = data[:items].first[:snippet][:description]
      @youtube_id = data[:items].first[:id]
     end

    def self.by_id(id)
      new(YoutubeService.new.playlist_info(id))
     end

    def video_data
      YoutubeService.new.playlist_video_info(@youtube_id)[:items]
     end

    def create_videos(tutorial)
      video_data.each do |video_hash|
        title = video_hash[:snippet][:title]
        description = video_hash[:snippet][:description]
        thumbnail = video_hash[:snippet][:thumbnails][:high][:url]
        position = video_hash[:snippet][:position]
        video_id = video_hash[:snippet][:resourceId][:videoId]
        tutorial.videos.create(video_id: video_id, title: title, description: description, thumbnail: thumbnail, position: position)
      end
     end
  end
  end
