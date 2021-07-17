
REM Not sure it is worthwhile to redo the whole thing automatically
REM because of umlauts.  Maybe easier to update new pubs by hand?

REM Before starting, check all files for NEWJEFF and "in press"

REM Updating by hand for new references, post-bibtex, you need to update:
REM   authorfull.htm
REM   chronofull.htm
REM   topicfull.htm
REM   (but so far I have updated the *skel.htm files too)
REM and also:
REM   Posters.htm
REM   the bibfile MillerJeff.txt

pause

REM This is a step-by-step guide to updating my web page.
REM
REM First, update references as follows:
reflines chronoskel.htm wrkchrono.rln
reflines authorskel.htm wrkauthor.rln
reflines topicskel.htm wrktopic.rln
copy \text\vita\pubs.tex
reflines pubs.tex vitapubs.rln
del pubs.tex

REM Compare the 4 *.rln files to make sure that all refs are included.
REM In particular, wrkchrono.rln, wrkauthor.rln and wrktopic.rln should be identical
REM  to each other and to vitapubs.rln except for:
REM   Miller 1976 PhD thesis
REM   Miller 1984: Lines of thought
REM   Miller 1990: ERPs and attention: Deep data, broad theory.
REM   Miller 1992: Review of
REM   which produce 196 extra characters in vitapubs.rln.
REM DO THIS IN A SEPARATE EPSILON WINDOW AND CONTINUE WHEN DONE.
Pause

del vitapubs.rln

REM Re-do the reflines without sorting:
reflines chronoskel.htm wrkchrono.rln -s
reflines authorskel.htm wrkauthor.rln -s
reflines topicskel.htm wrktopic.rln -s

fullrefs wrkchrono.rln wrkchrono.frf -s
fullrefs wrkauthor.rln wrkauthor.frf -s
fullrefs wrktopic.rln wrktopic.frf -s
REM Continue if all refs found OK.
pause

ToAPA wrkchrono.frf -htm +GooSchURL +PubMedURL
ToAPA wrkauthor.frf -htm +GooSchURL +PubMedURL
ToAPA wrktopic.frf -htm +GooSchURL +PubMedURL

refxpand chronoskel.htm wrkchrono.htm chronofull.htm -htm
refxpand authorskel.htm wrkauthor.htm authorfull.htm -htm
refxpand topicskel.htm wrktopic.htm topicfull.htm -htm


rem continue to delete work files.
pause
del *.rln
del *.frf
del wrk*.htm

REM Check for umlauts in Schroter, Tubingen, etc.
REM Now remove all backslashes & tildes.  HUH?
REM Now check for broken links with Xenu link sleuth
REM Now run ToServer.bat to update William's web page.

REM Schroter Schröter
REM f\"ur  für
REM Tubingen Tuebingen Tübingen
REM Fernandez Fernández
REM & &amp;