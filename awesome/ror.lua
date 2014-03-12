-- ror.lua
-- This is the file goes in your ~/.config/awesome/ directory
-- It contains your table of 'run or raise' key bindings for aweror.lua
-- Table entry format: ["key"]={"function", "match string", "optional attribute to match"}
-- The "key" will be bound as "modkey + key".
-- The "function" is what gets run if no matching client windows are found.
-- Usual attributes are "class","instance", or "name". If no attribute is given it defaults to "class".
-- The "match string"  will match substrings.  So "Firefox" will match "blah Firefox blah"  
-- Use xprop to get this info from a window.  WM_CLASS(STRING) gives you "instance", "class".  WM_NAME(STRING) gives you the name of the selected window (usually something like the web page title for browsers, or the file name for emacs).

modkey = "Mod1"
table5={
   ["c"]={"skype", "ConversationsWindow", "role"}, 
   ["g"]={"google-chrome", "Google-chrome"}, 
   ["f"]={"firefox", "^Firefox$"}, 
   ["t"]={"thunderbird", "^Thunderbird$"}, 
   ["d"]={"/usr/local/bin/st -c dev -e tmux_attach dev", "dev", "instance"},
   ["m"]={"/usr/local/bin/st -c main -e tmux_attach main", "main", "instance"},

   -- vms
   ["w"]={"VBoxManage startvm --type gui \"Windows 8 x64\"", "Windows 8 x64", "name"},
   ["o"]={"VBoxManage startvm --type gui \"Mac OS X\"", "Mac OS X", "name"},

   --, "instance"},
   --["x"]={"xterm","xterm", "instance"}, 
   --["f"]={"xterm -name mcTerm -e mc -d","mcTerm", "instance"}, 
   --["s"]={"xterm -name rootTerm -cr red -title rootTerm -e su","rootTerm", "instance"}, 
   --["t"]={"xterm -name htopTerm -e htop","htopTerm","instance"}, 
   --["b"]={"xterm -name rtorrentTerm -e rtorrent","rtorrentTerm","instance"}, 
   --["z"]={"xterm -name mocpTerm -e mocp","mocpTerm", "instance"} 
}

