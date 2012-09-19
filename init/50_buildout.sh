# Create a .buildout/default.cfg
#
# Buildout doesn't do userdir expansion, i.e. we cannot tell it to use
# ~/.foo/bar in its config, so we have to build it here.

mkdir -p ~/.buildout
cat >~/.buildout/default.cfg <<EOF
[buildout]
download-cache = $HOME/.buildout/downloads
eggs-directory = $HOME/.buildout/eggs

newest = false
EOF
