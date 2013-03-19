Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, '470807482986156', '0e7b31492fcf6d2ada78e4692dbb22b0'
  # provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end