#!/usr/bin/env bash
# Ajouter une clé GPG au porte-cles
# Utiliser gpgkeys pour gérer la suppression
echo "coller la clef (8 caractères)"
read cle
gpg --keyserver pgpkeys.mit.edu --recv-key $cle
gpg -a --export $cle | apt-key add -
