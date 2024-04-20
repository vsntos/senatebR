
library(hexSticker)

imgurl <- image_read("inst/figures/logo-fotor.png")

t = sticker(imgurl, package="senatebR", p_size=1, s_x=.98, s_y=.74, s_width=1.1, s_height=1.1,
            filename="inst/figures/img.png")


