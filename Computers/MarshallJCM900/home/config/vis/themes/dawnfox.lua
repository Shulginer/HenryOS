local lexers = vis.lexers

--         regular    bright     dim	
black   = {"#575279", "#5f5695", "#504c6b"}
red     = {"#b4637a", "#c26d85", "#a5576d"}
green   = {"#618774", "#629f81", "#597668"}
yellow  = {"#ea9d34", "#eea846", "#dd9024"}
blue    = {"#286983", "#2d81a3", "#295e73"}
magenta = {"#907aa9", "#9a80b9", "#816b9a"}
cyan    = {"#56949f", "#5ca7b4", "#50848c"}
white   = {"#e5e9f0", "#e6ebf3", "#c8cfde"}
orange  = {"#d7827e", "#de8c88", "#ca6e69"}
pink    = {"#d685af", "#de8db7", "#c9709e"}

comment = "#9893a5"

bg0     = "#ebe5df" -- Dark bg (status line and float)
bg1     = "#faf4ed" -- Default bg
bg2     = "#ebe0df" -- Lighter bg (colorcolm folds)
bg3     = "#ebdfe4" -- Lighter bg (cursor line)
bg4     = "#bdbfc9" -- Conceal, border fg

fg0     = "#4c4769" -- Lighter fg
fg1     = "#575279" -- Default fg
fg2     = "#625c87" -- Darker fg (status line)
fg3     = "#a8a3b3" -- Darker fg (line numbers, fold colums)

sel0    = "#d0d8d8" -- Popup bg, visual selection bg
sel1    = "#b8cece" -- Popup sel bg, search bg

local fg = ',fore:'..fg1..','
local bg = ',back:'..bg1..','

lexers.STYLE_DEFAULT = fg..bg
lexers.STYLE_NOTHING = ''
lexers.STYLE_CLASS = 'fore:'..yellow[1]
lexers.STYLE_COMMENT = 'fore:'..comment..',italics'
lexers.STYLE_CONSTANT = 'fore:'..orange[3] 
lexers.STYLE_DEFINITON = 'fore:'..yellow[1]
lexers.STYLE_ERROR = 'fore:'..red[1]..',italics'
lexers.STYLE_FUNCTION = 'fore:'..cyan[3]
lexers.STYLE_KEYWORD = 'fore:'..magenta[1]
lexers.STYLE_LABEL = 'fore:'..magenta[1]
lexers.STYLE_NUMBER = 'fore:'..orange[1]
lexers.STYLE_OPERATOR = 'fore:'..fg2
lexers.STYLE_REGEX = 'fore:'..yellow[3]
lexers.STYLE_STRING = 'fore:'..green[1]
lexers.STYLE_PREPROCESSOR = 'fore:'..pink[3]
lexers.STYLE_TAG = 'fore:'..'fore:'..black[1] 
lexers.STYLE_TYPE = 'fore:'..yellow[1]
lexers.STYLE_VARIABLE = 'fore:'..black[1]
lexers.STYLE_WHITESPACE = bg
lexers.STYLE_IDENTIFIER = 'fore:'..black[1] 

lexers.STYLE_LINENUMBER = 'fore:'..fg3
lexers.STYLE_CURSOR = 'fore:'..fg2..',back:'..fg
lexers.STYLE_CURSOR_PRIMARY = 'fore:'..fg2..',back:'..fg1
lexers.STYLE_CURSOR_LINE = 'back:'..bg3
lexers.STYLE_COLOR_COLUMN = 'back:'..bg3
lexers.STYLE_SELECTION = 'back:'..sel0
lexers.STYLE_STATUS = fg..',back:'..bg0
lexers.STYLE_STATUS_FOCUSED = fg..',back:'..bg0
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = ''
