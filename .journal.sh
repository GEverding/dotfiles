#! /bin/bash

/usr/bin/gvim -U ~/.journal.gvimrc -c "call vimwiki#diary#make_note(v:count1)" + -c "r! date +'\%n= \%r =\%n'"

