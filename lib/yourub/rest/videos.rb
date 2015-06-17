require 'yourub/rest/request'

module Yourub
  module REST
    module Videos
      class << self
        # @param client[Yourub::Client]
        # @param params[hash]
        #
        #
        # @example
        #   client = Yourub::Client.new
        #   req = Yourub::REST::Videos.list(client, params)
        #

        def list(client, params)
          Yourub::REST::Request.new(client, "videos", "list", params)
        end

        def single_video(client, video_id, part=nil, fields=nil)
          params = single_video_params(video_id, fields)
          list(client, params)
        end

        private

        def single_video_params(video_id, part='snippet,statistics,id', fields='items(id,snippet(title,thumbnails),statistics(viewCount))')
          fields = URI::encode(fields)
          { :id => video_id,
            :part => part,
            :fields => fields }
        end
      end
    end
  end
end
