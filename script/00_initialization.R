# ## ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
# 
#
# test
# First script : test repository
# Mars 2021
# Mary Varoux
# 
# ## ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###



### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

#### 1. Create folders  #### 

### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

dossier_script <- file.path("script") #for script
dir.create(file.path(dossier_script))

dossier_data <- file.path("data") #for script
dir.create(file.path(dossier_data))

dossier_res <- file.path("res") #for script
dir.create(file.path(dossier_res))

rm(dossier_script, dossier_data, dossier_res) # supprimer les objets transitoires



### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

#### 2. Create result folders  #### 

### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

#create folder names
script_names <- list.files(path = file.path("script"), pattern = "^[0-9]{2}.+\\.R$")
script_names <- script_names[-1]
dir_names    <- gsub("\\.R", "", script_names)
dir_vars     <- stringr::str_extract(dir_names, "^[0-9]{2}[a-z]?")
dir_vars     <- paste0("res_dir_", dir_vars)

#create folders & folder names variables
sapply(1:length(dir_names), function(i) {
  
  dir.create(
    path          = file.path("res", dir_names[i]),
    showWarnings  = FALSE,
    recursive     = TRUE
  )
  
  assign(
    x      = dir_vars[i],
    value  = file.path("res", dir_names[i]),
    envir  = .GlobalEnv
  )
})

cat(">>> All folders created !\n")

#clean temporary variables
rm(list = c("script_names", "dir_names", "dir_vars", "cran_packages", "n_i_p"))
