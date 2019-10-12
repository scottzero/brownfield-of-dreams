namespace :video do
  desc 'update vid position column in db where position is nil'
  task update_video_position: :environment do
    puts 'running script to update video position from nil'
    tutorials = Tutorial.where(videos: Video.pos_0)
    max = {}
      tutorials.each do |tutorial|
        max[tutorial] = tutorial.videos.maximum(:position)
      end

      Video.pos_0.each do |video|
        video.update(position: max[video.tutorial] + 1)
      end
    end
    puts 'you have updated video positions'
end
