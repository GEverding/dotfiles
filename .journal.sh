#! /bin/bash

/usr/bin/gvim -U ~/.journal.gvimrc -geometry 100x40+512+400 -c "call vimwiki#diary#make_note(v:count1)" + -c "r! date +'\%n= \%r =\%n'"

