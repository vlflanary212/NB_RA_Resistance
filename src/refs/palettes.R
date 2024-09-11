# Custom original palettes
sen_palettes <- data.frame(
  as = c("firebrick", "steelblue2", "darkgrey", "green3", "purple", "orange"),
  vf = c("orchid4", "slateblue", "steelblue", "aquamarine4", "lightpink3", "goldenrod")
)

vf_new <- c("#4D4D4D", "royalblue3", "chartreuse4", "darkorchid4", "lightpink2", "violetred3")

vf_palettes <- data.frame(
  light = c("indianred", "lightpink", "thistle", "lavender", "lightblue", "lightcyan2", "mistyrose", "bisque", "lightgray"),
  med = c("firebrick", "maroon", "orchid4", "slateblue", "steelblue", "aquamarine4", "lightpink3", "goldenrod", "darkgray"),
  dark = c("firebrick4", "violetred4", "darkorchid4", "darkslateblue", "steelblue4", "darkslategray", "lightpink4", "darkgoldenrod", "dimgray")
)

# Customized RColorBrewer palettes
gn <- c("mintcream", "lightcyan2", "aquamarine4", "darkslategray")
brgn <- c("darkgoldenrod", "darkgoldenrod3", "goldenrod", "papayawhip", "floralwhite", "mintcream", "lightcyan2", "darkslategray3", "darkslategray4")

gnpu <- c("darkslategray", "aquamarine4", "lightcyan2", "mintcream", "white", "lavenderblush2", "thistle", "orchid4", "darkorchid4")
gnbu <- c("darkslategray", "aquamarine4", "lightcyan2", "mintcream", "white", "aliceblue", "lightblue", "steelblue", "steelblue4")

bu <- c("azure", "lightblue2", "steelblue", "steelblue4")
brbu <- c("darkgoldenrod", "darkgoldenrod3", "goldenrod", "papayawhip", "white", "aliceblue", "lightblue", "steelblue", "steelblue4")

bupu <- c("steelblue4", "steelblue", "lightblue", "aliceblue", "white", "lavenderblush2", "thistle", "orchid4", "darkorchid4")
burd <- c("steelblue4", "steelblue", "lightblue", "aliceblue", "white", "mistyrose", "indianred", "firebrick", "firebrick4")

rdpu <- c("seashell", "mistyrose", "lightpink2", "maroon", "maroon4", "darkorchid4", "purple4")
brpu <- c("darkgoldenrod", "darkgoldenrod3", "goldenrod", "papayawhip", "floralwhite", "lavenderblush2", "thistle", "orchid4", "darkorchid4")

bvrv <- c("darkslateblue", "slateblue3", "slateblue2", "lavender", "white", "mistyrose", "lightpink", "maroon", "violetred4")
bvbr <- c("darkslateblue", "slateblue3", "slateblue2", "lavender", "floralwhite", "papayawhip", "goldenrod", "darkgoldenrod3", "darkgoldenrod")

br <- c("floralwhite", "papayawhip", "goldenrod", "darkgoldenrod3", "darkgoldenrod", "darkgoldenrod4")

# Note: double-check if palettes are colorblind-friendly before use
check_colorblind <- function(palette) {
  library(gplots)
  library(colorblindcheck)
  temp_pal <- col2hex(palette)
  palette_check(temp_pal, plot = TRUE)
}
