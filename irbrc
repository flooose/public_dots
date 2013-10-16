require 'irb/completion'
require 'irb/ext/save-history'
# ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:SAVE_HISTORY] = 10000
