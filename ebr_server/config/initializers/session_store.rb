# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ebr_server_session',
  :secret      => '7493577d68ae5e0a3d7f40a6ee2f2144bc6bba932a5e0381fa532d80d02d7214ab29dd7a0160f87e3d968883096e656f99302dcfcb6437facfe5aa9da6638c41'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
