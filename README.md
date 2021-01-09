=== **This has been archived and is not maintained.** ===

# Pruview

Generate image previews (thumbnails) in Ruby.  **Note**: this is a fork/copy and rework/modernization of the original kelredd-pruview gem: https://github.com/kellyredding/pruview.

## Usage

```ruby
require 'pruview'

# Thumbnail an image (using image magick)

src_img_file  = '/path/to/src/file'
dest_root_dir = '/path/to/dest'
file_name     = 'my_thumb'
px_width      = 600
px_height     = 400

src_img       = Pruview::Document.new(src_img_file, dest_root_dir)
dest_img_path = src_img.to_jpg(file_name, px_width, px_height)

# Thumbnail a video frame
#   - ffmpeg to get a frame image from the movie
#   - then image magick to resize that frame image

src_vid_file  = '/path/to/src/video'
dest_root_dir = '/path/to/dest'
file_name     = 'my_video_thumb'
px_width      = 600
px_height     = 400

vid_img_path      = Pruview::VideoImage.to_jpg(src_vid_file, dest_root_dir, file_name)
vid_img           = Pruview::Document.new(vid_img_path, dest_root_dir)
dest_vid_img_path = vid_img.to_jpg(file_name, px_width, px_height)
```

## Dependencies

* image magick + any special file type handling dependencies
* ffmpeg + h264 encoder + any special file type handling dependencies (for video previewing)
* gawk
* mini_magick gem
* flvtool2 gem

## Installation

Add this line to your application's Gemfile:

    gem 'pruview'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pruview

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
