# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ebr_client_session',
  :secret      => 'ce5c752fe21ecdeaf35f5bdd45006a7a06df8f29a990a491e82a4da8b4f929e8c29bcbe7cb20789b86dedaf5982017bbd36e862da5eadccb54cfcbff0a50839b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
