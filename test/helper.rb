# this file is automatically required when you run `assert`
# put any test helpers here

# add the root dir to the load path
require 'pathname'
ROOT_PATH = Pathname.new(File.expand_path('../..', __FILE__))
$LOAD_PATH.unshift(ROOT_PATH.to_s)
TMP_PATH = ROOT_PATH.join('tmp')
TEST_SUPPORT_PATH = ROOT_PATH.join('test/support')

# require pry for debugging (`binding.pry`)
require 'pry'

require 'test/support/factory'

# 1.8.7 backfills

# Array#sample
if !(a = Array.new).respond_to?(:sample) && a.respond_to?(:choice)
  class Array
    alias_method :sample, :choice
  end
end

FILES_PATH          = TEST_SUPPORT_PATH.join("files")
OUTPUT_PATH         = TMP_PATH
INVALID_OUTPUT_PATH = ROOT_PATH.join("invalid")
FILES = {
  'basic image'    => FILES_PATH.join("basic.jpg"),
  'invalid image'  => FILES_PATH.join("invalid.jpg"),
  'error image'    => FILES_PATH.join("error.jpg"),
  'basic video'    => FILES_PATH.join("basic.mpg"),
  'invalid video'  => FILES_PATH.join("invalid.mov"),
  'error video'    => FILES_PATH.join("error.mov"),
  'invalid format' => FILES_PATH.join("invalid_format.xyz"),
  'tiff'           => FILES_PATH.join("image.tiff")
}
