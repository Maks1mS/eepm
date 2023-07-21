#!/bin/sh -x

# It will be run with two args: buildroot spec
BUILDROOT="$1"
SPEC="$2"

PRODUCT=webstorm
PRODUCTCUR=WebStorm

. $(dirname $0)/common.sh

subst "s|^Group:.*|Group: Development/Tools|" $SPEC
#subst "s|^License: unknown$|License: GPLv2|" $SPEC
subst "s|^URL:.*|URL: https://www.jetbrains.com/webstorm/|" $SPEC
subst "s|^Summary:.*|Summary: WebStorm - The smartest JavaScript IDE|" $SPEC

move_to_opt "/$PRODUCTCUR-*"
add_bin_link_command $PRODUCT $PRODUCTDIR/bin/$PRODUCT.sh
add_bin_link_command $PRODUCTCUR $PRODUCT

# create desktop file
mkdir -p $BUILDROOT/usr/share/applications/
cat <<EOF >$BUILDROOT/usr/share/applications/$PRODUCT.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=WebStorm
Comment=The smartest JavaScript IDE
Exec=$PRODUCT %f
Icon=$PRODUCT
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-webstorm
Categories=Development;IDE
EOF

pack_file /usr/share/applications/$PRODUCT.desktop

mkdir -p $BUILDROOT/usr/share/pixmaps
install_file $PRODUCTDIR/bin/$PRODUCT.png /usr/share/pixmaps/
install_file $PRODUCTDIR/bin/$PRODUCT.svg /usr/share/pixmaps/

# kind of hack
subst 's|%dir "'$PRODUCTDIR'/"||' $SPEC
subst 's|%dir "'$PRODUCTDIR'/bin/"||' $SPEC
subst 's|%dir "'$PRODUCTDIR'/lib/"||' $SPEC
subst 's|%dir "'$PRODUCTDIR'/plugins/"||' $SPEC

pack_dir $PRODUCTDIR/
pack_dir $PRODUCTDIR/bin/
pack_dir $PRODUCTDIR/lib/
pack_dir $PRODUCTDIR/plugins/
