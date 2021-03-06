### Hooks for the editor to set the default target
## https://cygubicko.github.io/wash/
## https://cygubicko.github.io/wash/simulations_writeup.html

current: target
-include target.mk

##################################################################

## Defs

# stuff

Sources += Makefile README.md

msrepo = https://github.com/dushoff
ms = makestuff
-include $(ms)/os.mk

## Used by Steve to link data to right place
Ignore += local.mk
-include local.mk

# -include $(ms)/perl.def

Ignore += $(ms)
## Sources += $(ms)
Makefile: $(ms)/Makefile
$(ms)/Makefile:
	git clone $(msrepo)/$(ms)

######################################################################

Sources += $(wildcard *.R *.rmd *.tex *.sage *.ipynb *.py *.md)
Sources += $(tutorials)
Sources += example.txt
Sources += example2.txt
Sources += students_grades_summary.txt
Sources += student_inquiries.md
Sources += CD3NOEXTREMES_DATA.csv

######################################################################

# https://cygubicko.github.io/math1mp3-fall2019
index.html.pages: index.html

# https://cygubicko.github.io/math1mp3-fall2019/tutorial1.html
tutorial1.html.pages: tutorial1.rmd

# https://cygubicko.github.io/math1mp3-fall2019/tutorial2.html
tutorial2.html: tutorial2.rmd

# https://cygubicko.github.io/math1mp3-fall2019/tutorial3.html
tutorial3.html: tutorial3.rmd

# https://cygubicko.github.io/math1mp3-fall2019/tutorial4.html
tutorial4.html: tutorial4.rmd

# https://cygubicko.github.io/math1mp3-fall2019/tutorial5.html
tutorial5.html: tutorial5.rmd

## Weekly tutorial templates
# https://cygubicko.github.io/math1mp3-fall2019/tutorial_temp.html
tutorial_temp.html: tutorial_temp10.html

# Sync all the pages at once
pushindex:
	make tutorial1.html.pages
	make tutorial2.html.pages
	make tutorial3.html.pages
	make tutorial4.html.pages
	make tutorial5.html.pages
	make tutorial_temp10.html.pages
	make index.html.pages
	cd pages && git push

######################################################################

Ignore += *.rda
Ignore += *.Rhistory
Ignore += *.pdf *.html *.csv *.vrb *.png *.Rexit
sub += hh autopsy data docs temp_files 
Ignore += $(sub)

clean: 
	rm -f *Rout.*  *.Rout .*.RData .*.Rout.* .*.wrapR.* .*.Rlog *.RData *.wrapR.* *.Rlog *.rdeps *.rda .*.rdeps .*.rda *.vrb *.toc *.out *.nav *.snm *.log *.aux

######################################################################

### Makestuff

-include $(ms)/texdeps.mk
-include $(ms)/pandoc.mk
-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/stepR.mk
