#!/usr/bin/env python
# replace a string in multiple files
# from here:
# http://www.goldb.org/goldblog/CommentView,guid,d6a6577a-decb-4688-83fc-9f9016b99a50.aspx

import fileinput
import glob
import sys
import os


if len(sys.argv) < 2:
    print 'usage: %s search_text replace_text directory' \
        % os.path.basename(sys.argv[0])
    sys.exit(0)


stext = sys.argv[1]
rtext = sys.argv[2]
path = sys.argv[3]

print 'finding: %s and replacing with: %s' % (stext, rtext)

files = glob.glob(path)
print 'files: %s' % files
for line in fileinput.input(files, inplace=1):
    if stext in line:
        line = line.replace(stext, rtext)
    sys.stdout.write(line)
