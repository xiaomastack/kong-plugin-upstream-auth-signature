local BasePlugin = require "kong.plugins.base_plugin"
local req_set_header = ngx.req.set_header
local openssl_hmac = require "openssl.hmac"

local UpstreamAuthSignatureHandler = BasePlugin:extend()

function UpstreamAuthSignatureHandler:new()
  UpstreamAuthSignatureHandler.super.new(self, "upstream-auth-signature")
end

function UpstreamAuthSignatureHandler:access(conf)
  UpstreamAuthSignatureHandler.super.access(self)

  local key = conf.key
  local secret = conf.secret
  local date = os.date("%Y-%m-%d %H:%M:%S", os.time())
  local signature_salt = string.format("date: %s", date)
  local signature = openssl_hmac.new(secret, "sha256"):final(signature_salt)
  local authorization = string.format('Signature keyId="%s",algorithm="hmac-sha256",signature="%s"', key, ngx.encode_base64(signature))

  req_set_header("date", date)
  req_set_header("x-api-key", key)
  req_set_header("authorization", authorization)

end

UpstreamAuthSignatureHandler.PRIORITY = 850

return UpstreamAuthSignatureHandler