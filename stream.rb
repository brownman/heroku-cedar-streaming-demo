require 'rubygems'
require 'bundler'
Bundler.require

class Stream < Goliath::API
  def on_close(env)
    env.logger.info "Connection closed."
  end
  
  def response(env)
    i = 0
    
    keepalive = EM.add_periodic_timer(1) do
      env.stream_send(".\n")
    end
    
    # EM.add_timer(10) do
    #   keepalive.cancel
    #   
    #   env.stream_send("End of stream.")
    #   env.stream_close
    # end
    
    [200, {'Content-Type' => 'text/plain'}, Goliath::Response::STREAMING]
  end
end