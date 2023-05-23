#!/bin/bash

# cd /Volumes/fsmresfiles/PBS/Stewarts/State Trait Study/current_studies/Letkiewicz_DDM/work

Rscript -e "rmarkdown::render('management/data01_LDDM.Rmd', clean=TRUE)"
# these can be run in parallel since they rely on different data files
Rscript -e "rmarkdown::render('management/data02_LDDM_rdoc.Rmd', clean=TRUE)" &
Rscript -e "rmarkdown::render('management/data02_LDDM_sttr.Rmd', clean=TRUE)" &
wait
# these can be run in parallel since they rely on different data files
Rscript -e "rmarkdown::render('analysis/do01_LDDM_rdoc.Rmd', clean=TRUE)" &
Rscript -e "rmarkdown::render('analysis/do01_LDDM_sttr.Rmd', clean=TRUE)" &
wait
echo "All done with data preprocessing for LDDM project!"
