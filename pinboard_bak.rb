#!/usr/bin/env ruby -w

require 'rubygems'
require 'pit'

bak = '/Users/oppara/Dropbox/_bak_/pinboard.json';

config = Pit.get('pinboard.int', :require => {
    'username' => 'your name',
    'password' => 'your password',
})

uri = sprintf('https://%s:%s@api.pinboard.in/v1/posts/all?format=json', config['username'], config['password']);
cmd = sprintf('curl -s "%s" -o "%s"', uri, bak);
result = system(cmd);

