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
Sources += example.txt example2.txt

######################################################################

# https://cygubicko.github.io/math1mp3-fall2019
index.html.pages: index.html

# https://cygubicko.github.io/math1mp3-fall2019/tutorial1.html
tutorial1.html.pages: tutorial1.rmd

# https://cygubicko.github.io/math1mp3-fall2019/tutorial12.html
tutorial2.html: tutorial2.rmd

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
