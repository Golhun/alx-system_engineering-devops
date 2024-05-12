#!/usr/bin/env ruby
# Extracts sender, receiver, and flags from a log file.
# Output format: [SENDER],[RECEIVER],[FLAGS]
# - Sender: phone number or name with country code
# - Receiver: phone number or name with country code
# - Flags: transaction flags used

puts ARGV[0].scan(/\[from:(.*)\] \[to:(.*)\] \[flags:(.*?)\]/).join(",")