.onLoad <- function(libname,pkgname){
  align_cats <<- align_cats()
}

# assign(x = "align_cats",
#        value = ggalignment::align_cats(),
#        envir = parent.env(environment()))
