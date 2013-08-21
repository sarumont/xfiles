#!/bin/sh
if test -f ~/.xprofile; then
	. ~/.xprofile
fi
exec awesome
