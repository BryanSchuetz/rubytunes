#!/usr/bin/env ruby
require 'rubygems'
require 'terminal-notifier'

def getTrack()
	%x[osascript \
	    -e 'tell application "iTunes"' \
	    -e '(get name of current track) & "\n" & (get artist of current track)' \
	    -e 'end tell']
end
track=''
loop do
	newTrack = getTrack()
	if newTrack.eql?(track)
		sleep(10)
	else
	TerminalNotifier.notify(newTrack, :title => 'RubyTunes', :group => 'rubytunes.pid', :activate => 'com.apple.iTunes') 
	TerminalNotifier.remove('previous rubytunes.pid')
	sleep(10)
	track = getTrack()
	end
end	




