namespace :video do
  desc 'update vid position column in db where position is nil'
  task update_video_position: :environment do
    puts 'running script to update video position from nil'
    Video.all.each do |video|
        if video.position.nil?
          position = Video.order(position: :desc)
          .first
          .position + 1
          video.update(position: position)
        end
    end
    binding.pry
    puts 'you have updated video positions'
  end
end
