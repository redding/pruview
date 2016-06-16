require 'pathname'
require "pruview/version"
require 'pruview/document'
require 'pruview/video'
require 'pruview/video_image'

module Pruview

  def self.gem_bin_path;   self.gem_path.join('bin');               end
  def self.ffyml_bin_path; self.gem_bin_path.join('pruview-ffyml'); end


  private

  def self.gem_path
    @gem_path ||= Pathname(Gem.loaded_specs['pruview'].full_gem_path)
  end

  InvalidError = Class.new(StandardError)

end
