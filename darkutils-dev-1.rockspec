package = "darkutils"
version = "dev-1"
source = {
   url = "git://github.com/DarkWiiPlayer/darkutils.git";
}
description = {
   homepage = "https://github.com/DarkWiiPlayer/darkutils";
   license = "Unlicense";
}
dependencies = {
  "lua >= 5.1";
}
build = {
  install = {
    lua = {
      ['darkutils.init']='src/init.lua'
      ['darkutils.table']='src/table.lua'
    }
  }
}
