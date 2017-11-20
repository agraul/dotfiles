#!/bin/bash

TOUCHPAD=11
DISABLED_FILE=/tmp/touchpad_disabled
if [ -e $DISABLED_FILE ] ; then
    xinput enable $TOUCHPAD;
    rm $DISABLED_FILE;
else
    xinput disable $TOUCHPAD;
    touch $DISABLED_FILE;
fi
