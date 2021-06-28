if (!Rails.env.test?)
  Rack::MiniProfiler.config.position = 'bottom-right'
end