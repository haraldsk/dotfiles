--  https://github.com/LunarVim/LunarVim/issues/4082
--  INSTALL:
--
--  brew install puppetlabs/puppet/ruby@2.7
--  export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
--  gem install puppet
--  gem install puppet-lint

local util = require("lspconfig/util")
return {
  cmd = { "puppet-languageserver", "--stdio" },
  root_dir = util.root_pattern("manifests", ".puppet-lint.rc", "hiera.yaml", ".git"),
}
