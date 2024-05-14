sen_palettes <- data.frame(
  as = c("firebrick", "steelblue2", "darkgrey", "green3", "purple", "orange"),
  vf = c("orchid4", "slateblue", "steelblue", "aquamarine4", "lightpink3", "darkgoldenrod")
)

vf_palettes <- data.frame(
  light = c("indianred", "lightpink", "thistle", "lavender", "lightblue", "lightcyan2", "mistyrose", "bisque", "lightgray"),
  med = c("firebrick", "maroon", "orchid4", "slateblue", "steelblue", "aquamarine4", "lightpink3", "goldenrod", "darkgray"),
  dark = c("firebrick4", "violetred4", "darkorchid4", "darkslateblue", "steelblue4", "darkslategray", "lightpink4", "darkgoldenrod", "dimgray")
)

gn <- c("mintcream", "lightcyan2", "aquamarine4", "darkslategray")
brgn <- c("darkgoldenrod", "darkgoldenrod3", "goldenrod", "papayawhip", "floralwhite", "mintcream", "lightcyan2", "aquamarine4", "darkslategray")

gnpu <- c("darkslategray", "aquamarine4", "lightcyan2", "mintcream", "white", "lavenderblush2", "thistle", "orchid4", "darkorchid4")
gnbu <- c("darkslategray", "aquamarine4", "lightcyan2", "mintcream", "white", "aliceblue", "lightblue", "steelblue", "steelblue4")

bu <- c("azure", "lightblue2", "steelblue", "steelblue4")
brbu <- c("darkgoldenrod", "darkgoldenrod3", "goldenrod", "papayawhip", "floralwhite", "aliceblue", "lightblue", "steelblue", "steelblue4")

bupu <- c("steelblue4", "steelblue", "lightblue", "aliceblue", "white", "lavenderblush2", "thistle", "orchid4", "darkorchid4")
burd <- c("steelblue4", "steelblue", "lightblue", "aliceblue", "white", "mistyrose", "indianred", "firebrick", "firebrick4")

rdpu <- c("seashell", "mistyrose", "lightpink2", "maroon", "maroon4", "darkorchid4", "purple4")
brpu <- c("darkgoldenrod", "darkgoldenrod3", "goldenrod", "papayawhip", "linen", "lavenderblush2", "thistle", "orchid4", "darkorchid4")

bvrv <- c("darkslateblue", "slateblue3", "slateblue2", "lavender", "white", "mistyrose", "lightpink", "maroon", "violetred4")
bvbr <- c("darkslateblue", "slateblue3", "slateblue2", "lavender", "floralwhite", "papayawhip", "goldenrod", "darkgoldenrod3", "darkgoldenrod")

# Note: double-check if palettes are colorblind-friendly before use
## first convert r color names to hex codes with gplots::col2hex(palette),
## then check if colorblind-friendly with colorblindcheck::palette_check(palette, plot = TRUE)

# Non-colorblind-friendly palettes: bupu, gnbu, sen_palettes$as
# sen_palettes$vf is colorblind-friendly, but larger vf_palettes may not be
## colors too close for comfort in vf_palettes: 
### light: thistle and lightblue; lightgray and lightpink
## med: maroon and aquamarine4; lightpink3 and darkgray
## dark: darkorchid4 and darkslateblue; dimgray and lightpink4 and violetred4
