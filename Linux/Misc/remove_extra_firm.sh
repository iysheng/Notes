#!/bin/sh

sudo dnf remove -y $(dnf repoquery  --installonly --latest-limit=-1 -q)
