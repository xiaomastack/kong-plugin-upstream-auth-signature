package = "kong-plugin-upstream-auth-signature"
version = "1.0.0-1"
source = {
   url = "git://github.com/xiaomastack/kong-plugin-upstream-auth-signature.git",
   tag = "1.0.0-1"
}
description = {
   homepage = "https://www.xiaomastack.com/2019/01/17/kong-plugin-upstream-auth-signature/",
   license = "Apache-2.0"
}
dependencies = {}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.upstream-auth-signature.handler"] = "kong/plugins/upstream-auth-signature/handler.lua",
    ["kong.plugins.upstream-auth-signature.schema"] = "kong/plugins/upstream-auth-signature/schema.lua",
  }
}
