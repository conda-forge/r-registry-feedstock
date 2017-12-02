#!/bin/bash

# R refuses to build packages that mark themselves as Priority: Recommended
mv DESCRIPTION DESCRIPTION.old
grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION

R_PACKAGE_NAME=${PKG_NAME:2}

$R CMD INSTALL --build .
mkdir -p $PREFIX/R/library
mv $PREFIX/lib/R/library/$R_PACKAGE_NAME $PREFIX/R/library/$R_PACKAGE_NAME

echo "ln -s \${PREFIX}/R/library/$R_PACKAGE_NAME \${PREFIX}/lib/R/library/$R_PACKAGE_NAME" > $PREFIX/bin/.${PKG_NAME}-post-link.sh
echo "rm \${PREFIX}/lib/R/library/$R_PACKAGE_NAME" > $PREFIX/bin/.${PKG_NAME}-post-unlink.sh

