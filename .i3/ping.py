#!/usr/bin/python3
import subprocess

url = "5.1.93.100"
url2 = "8.8.8.8"

raw = subprocess.run(['ping', '-c', '1', url2], stdout=subprocess.PIPE)
raw_str = raw.stdout.decode('utf-8')

return_arr = raw_str.split(' ')
print(return_arr[12][5:10] + return_arr[13][:2])
