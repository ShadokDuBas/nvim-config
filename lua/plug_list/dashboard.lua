-- généré par http://patorjk.com/software/taag/
-- police ansi shadow
local art = [[
 █████╗ ██╗   ██╗    ███████╗███████╗ ██████╗ ██████╗ ██╗   ██╗██████╗ ███████╗
██╔══██╗██║   ██║    ██╔════╝██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝
███████║██║   ██║    ███████╗█████╗  ██║     ██║   ██║██║   ██║██████╔╝███████╗
██╔══██║██║   ██║    ╚════██║██╔══╝  ██║     ██║   ██║██║   ██║██╔══██╗╚════██║
██║  ██║╚██████╔╝    ███████║███████╗╚██████╗╚██████╔╝╚██████╔╝██║  ██║███████║
╚═╝  ╚═╝ ╚═════╝     ╚══════╝╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝
                                                                               
███████╗██╗   ██╗██╗███████╗      ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗███████╗
██╔════╝██║   ██║██║██╔════╝     ██╔════╝██╔═══██╗██║████╗  ██║██╔════╝██╔════╝
███████╗██║   ██║██║███████╗     ██║     ██║   ██║██║██╔██╗ ██║██║     █████╗  
╚════██║██║   ██║██║╚════██║     ██║     ██║   ██║██║██║╚██╗██║██║     ██╔══╝  
███████║╚██████╔╝██║███████║     ╚██████╗╚██████╔╝██║██║ ╚████║╚██████╗███████╗
╚══════╝ ╚═════╝ ╚═╝╚══════╝      ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
                                                                               
    ██████╗  █████╗ ███╗   ██╗███████╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗    
    ██╔══██╗██╔══██╗████╗  ██║██╔════╝    ████╗  ██║██║   ██║██║████╗ ████║    
    ██║  ██║███████║██╔██╗ ██║███████╗    ██╔██╗ ██║██║   ██║██║██╔████╔██║    
    ██║  ██║██╔══██║██║╚██╗██║╚════██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║    
    ██████╔╝██║  ██║██║ ╚████║███████║    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║    
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝    

Non, vraiment, je suis à l’intérieur de l’ordinateur, sortez-moi de là…]]

return {
  enabled = true,
  preset = {
    header = art,
    keys = {
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "/", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      { icon = " ", key = "g", desc = "Git", action = ":Git" },
      { icon = " ", key = "t", desc = "Capture Task", action = "<leader>oc" },
      { icon = " ", key = "a", desc = "Agenda", action = "<leader>oa" },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy",},-- enabled = package.loaded.lazy ~= nil ,
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    }
  },
  sections = {
    { section = "header",  },
    { section = "keys", gap = 1, padding = 2, pane = 2 },
    { section = "startup", pane = 2 },
  },
}


