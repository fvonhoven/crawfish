BASE_URL = "https://api.yelp.com/v2/business/"
class Api
  class << self
    # Init API server, with the shared client
    def init_server
      AFMotion::SessionClient.build_shared(BASE_URL) do
        session_configuration :default
        header "Accept", "application/json"
        response_serializer :json
      end
    end

    METHODS = %w(get post put delete patch).freeze
    # Api.get "apitest", {} do |result, error|
    #   if result; Do something here; end
    #   if error;  Do something here; end
    # end
    METHODS.each do |method|
      define_method method do |path, parameters=nil, *args, &block|
        # p "API:: #{method} #{path} #{AFNetworkReachabilityManager.sharedManager.reachable?}"
        # if AFNetworkReachabilityManager.sharedManager.reachable?
          AFMotion::SessionClient.shared.send(method, path, parameters) do |result|
            if result.success?
              block.call(result.object, nil) if block
            else
              block.call(nil, result.error.localizedDescription) if block
            end
          end
        # else
          # SVProgressHUD.dismiss
          # app.alert("Network not available right now, please try again later.")
        # end
      end
    end
  end
end
