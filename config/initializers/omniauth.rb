Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "NlVSfVumkRUgQtTpNzHjQ", "wk2IxvzHB7CJpH4aPMd7lmV4rJGYYminXtCj6oVwuE"
  provider :facebook, "1386046981641635", "df5ebdec3ee009b41d8597866b9f80de"
  provider :linkedin, "770hov8cbp2osf", "aoX68F8r0Zr0zV5c"
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE #fix from stackoverflow

