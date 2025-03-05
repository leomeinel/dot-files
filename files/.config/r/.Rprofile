##
# https://wiki.archlinux.org/title/r#Profile
##

# Called at the end
.First <- function() {
    message(
        "Welcome back ", Sys.getenv("USER"), "!\n",
        "Working directory is: ", getwd()
    )
}
# General
options(digits = 12)
options(scipen = 2)
options(show.signif.stars = FALSE)
# Parallelization
local({
    n <- max(parallel::detectCores() - 2L, 1L)
    options(Ncpus = n)
    options(mc.cores = n)
})
# CRAN Mirror
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cloud.r-project.org/"
    options(repos = r)
})
# Debugging
error <- quote(dump.frames("${R_HOME_USER}/testdump", TRUE))
