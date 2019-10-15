class YoutubeService
  def video_info(id)
    params = { part: "snippet,contentDetails,statistics", id: id }

    get_json("youtube/v3/videos", params, "videos")
  end

  def playlist_info(id)
    params = { part: "snippet,contentDetails", id: id }

    get_json("youtube/v3/playlists", params, "playlists")
  end

  def playlist_video_info(id)
    params = { part: "snippet,contentDetails", playlistId: id }

    get_json("youtube/v3/playlists", params, "playlistItems")
  end

  private
    def get_json(url, params, type)
      response = conn.get("youtube/v3/#{type}", params)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "https://www.googleapis.com") do |f|
        f.adapter  Faraday.default_adapter
        f.params[:key] = ENV["YOUTUBE_API_KEY"]
      end
    end
end
