require 'pruview/video'
require 'pruview'

module Pruview

  class VideoImage

    # this class assumes you have 'ffmpeg' installed and in your path

    def self.to_jpg(source, target_dir, name)
      if !File.file?(source)
        raise Pruview::Exceptions::InvalidError, "Invalid source file:: #{source.to_s}"
      end
      if !File.directory?(target_dir)
        raise Pruview::Exceptions::InvalidError, "Invalid target directory: #{target_dir.to_s}"
      end
      if !format_supported?(source)
        raise InvalidError, "Video file extension not supported: " \
                            "#{file_extension(source)}"
      end
      target   = File.join(target_dir, name.to_s + '.jpg')
      video    = Video.new(source, target_dir)
      duration = video.info['duration'] || 10

      run(build_command(source, "-ss 00:00:#{duration * 0.1}", 'mjpeg', target), "Unable to get preview image for #{target}")

      # TODO: analyze image - create better
      return target
    end

    private

    def self.format_supported?(source)
      file_ext = file_extension(source)
      Video::EXT.each { |extension| return true if file_ext == extension }
      return false
    end

    def self.file_extension(source_file)
       File.extname(source_file).downcase.chomp
    end

    def self.build_command(source, time_str, format, target)
      command = %Q{#{Video::FFMPEG} -i "#{source}"}
      command += " #{time_str}"
      command += " -f #{format}" if !format.empty?
      command += " -an -y #{target}"
    end

    def self.run(command, error_message = "Unknown error.")
      if !system(command)
        raise "Ffmpeg error: " + error_message + " - command: '#{command}'"
      end
    end

  end

end
