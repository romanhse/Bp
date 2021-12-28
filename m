import sys
import argparse
import os
import datetime
parser = argparse.ArgumentParser()
parser.add_argument("-f", "--file", help="input file")
parser.add_argument("-s", "--size", help="output Size of files in MB", action="store_true")
parser.add_argument("-m", "--mtime", help="modification time", action="store_true")
parser.add_argument("-r", "--rename", help="rename")
parser.add_argument("-l", "--ls", help="list all files in directory", action="store_true")
args = parser.parse_args()
print("selected filename: ", args.file)
stats = os.stat(args.file)

if args.mtime:
    timestamp_str = datetime.datetime.fromtimestamp(stats.st_mtime).strftime('%Y-%m-%d-%H:%M')
    print("modificated time: ", timestamp_str)

if args.size:
    print("size in megabytes: ", stats.st_size/1048576)

if args.rename:
    os.rename(args.file, args.rename)
    print("new file name is: ", args.rename)

if args.ls:
    rez = os.listdir(args.file)
    for n, item in enumerate(rez):
        print(n+1, item)

