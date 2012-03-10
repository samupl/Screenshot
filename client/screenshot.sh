#!/usr/bin/env bash
#
#  Copyright (c) 2011 Jakub Szafrański <samu@pirc.pl>
# 
#  All rights reserved.
# 
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
# 
#  THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
#  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#  ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
#  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
#  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
#  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#  SUCH DAMAGE.
#

#
#  Screenshot client, 0.1
#  Create and send a screenshot to a remote server.
#

# --------------------------
# Config goes here:

_USER="samu"
_PASSWORD="abc123"
_URL="http://your.website.with.trailing.slash/"
_IMGPATH="images/"

# Config ends here
# --------------------------

URL="${_URL}/up.php?user=${_USER}&password=${_PASSWORD}";
FPATH=`scrot '%Y-%m-%d-%s.jpg' -q 90 -e 'mv $f /tmp; echo /tmp/$f'`;
NURL=`curl -s -F "file=@$FPATH" $URL`;
rm $FPATH;
zenity --info --text="<a href='http://${_URL}/${_IMGPATH}/$NURL'>http://${_URL}/${_IMGPATH}/$NURL</a>" --no-wrap
