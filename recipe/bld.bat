"%R%" CMD INSTALL --build .
if errorlevel 1 exit 1

set R_PACKAGE_NAME=%PKG_NAME:~2%
mkdir %PREFIX%\bin
echo ln -s ${PREFIX}/R/library/%R_PACKAGE_NAME% ${PREFIX}/lib/R/library/%R_PACKAGE_NAME% > %PREFIX%\bin\.%PKG_NAME%-post-link.sh
echo rm ${PREFIX}/lib/R/library/%R_PACKAGE_NAME% > %PREFIX%\bin\.%PKG_NAME%-post-unlink.sh

