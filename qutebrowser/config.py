import catppuccin

config.load_autoconfig()

config.unbind("f")
config.unbind("H")
config.unbind("J")
config.unbind("K")
config.unbind("L")


config.bind("<Alt-j>", "tab-next")
config.bind("<Alt-k>", "tab-prev")

config.bind("<Alt-h>", "back")
config.bind("<Alt-l>", "forward")

config.bind("<Alt-e>", "config-cycle tabs.show always never")
config.bind("<Alt-s>", "config-cycle statusbar.show always never")
config.bind(
    "<Ctrl-Alt-c>",
    "config-cycle statusbar.show always never;; config-cycle tabs.show always never",
)

catppuccin.setup(c, "mocha", True)
