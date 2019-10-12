namespace :video do
  desc 'update vid position column in db where position is nil'
  task update_video_position: :environment do
    puts 'running script to update video position from nil'
    videos = Video.where(position: nil)
    videos.each do |video|
    video.update(:position, 0)
    end
  end
end
