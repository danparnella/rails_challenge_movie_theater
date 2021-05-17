LpTokenAuth.config do |config|

  # The secret used when encrypting the JWT
  #
  config.secret = '1ab239ab6a46189f1756cfea32dcce70df1ef9c52f09405c7734d0cc6d31fa05805df21c4e541805f450f6fed64fbe9a15a2e9d74576a034f4b7fc5f2a752087'

  # The number of hours the token is active
  # default: 7 * 24
  #
  config.expires = 7 * 24

  # The encryption algorithm to use
  # default: HS512
  #
  config.algorithm = 'HS512'

  # Where to include the token in the response, must be an array, options are
  # :cookie, :header
  # default: [:cookie]
  #
  config.token_transport = [:cookie]
end
