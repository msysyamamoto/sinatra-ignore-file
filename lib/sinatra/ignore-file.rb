require 'rubygems'
require 'sinatra/base'

module Sinatra
  class Base
    set :ignore_static_files, []

    def static!
      return if (public_dir = settings.public).nil?
      public_dir = File.expand_path(public_dir)

      path = File.expand_path(public_dir + unescape(request.path_info))
      return unless path.start_with?(public_dir) and File.file?(path)

      return if is_ignore_file?

      env['sinatra.static_file'] = path
      send_file path, :disposition => nil
    end

    private

    def is_ignore_file?
      path = unescape(request.path_info)
      settings.ignore_static_files.each do |f|
        if f.kind_of?(Proc)
          return true if f.call path
        elsif f.kind_of?(Regexp)
          return true if f === path
        else
          return true if f == path 
        end
      end

      false
    end
  end
end
