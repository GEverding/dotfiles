# Sample Maid rules file -- some ideas to get you started.
#
# To use, remove ".sample" from the filename, and modify as desired.  Test using:
#
#     maid clean -n
#
# **NOTE:** It's recommended you just use this as a template; if you run these rules on your machine without knowing what they do, you might run into unwanted results!
#
# Don't forget, it's just Ruby!  You can define custom methods and use them below:
# 
#     def magic(*)
#       # ...
#     end
# 
# If you come up with some cool tools of your own, please send me a pull request on GitHub!
#
# For more help on Maid:
#
# * Run `maid help`
# * Read the README, tutorial, and documentation at https://github.com/benjaminoakes/maid#maid
# * Ask me a question over email (hello@benjaminoakes.com) or Twitter (@benjaminoakes)

Maid.rules do
  # **NOTE:** It's recommended you just use this as a template; if you run these rules on your machine without knowing what they do, you might run into unwanted results!

  rule 'Linux ISOs, etc' do
    trash(dir('~/Downloads/*.iso'))
  end

  rule 'Linux applications in Debian packages' do
    trash(dir('~/Downloads/*.deb'))
  end



  rule 'Misc Screenshots' do
    dir('~/Pictures/Screen shot *').each do |path|
      if 1.week.since?(accessed_at(path))
        move(path, '~/Documents/Misc Screenshots/')
      end
    end
  end

  rule 'Move Videos' do
    dir('~/Downloads/*.avi').each do |path|
      move(path, '~/Videos/')
    end
  end
  
end
