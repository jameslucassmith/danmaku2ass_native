<link href="http://vjs.zencdn.net/5.0/video-js.min.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/5.0/video.min.js"></script>#!/bin/sh
./danmaku2ass_native -in=../tests/testdata.xml -out=./test.out -w=1280 -h=720 -font="Heiti SC" -fontsize=25 -alpha=0.8 -dm=5 -ds=5
$HOME/lcov/usr/bin/lcov --gcov-tool "gcov-4.8" --directory . --capture --output-file coverage.info
$HOME/lcov/usr/bin/lcov --gcov-tool "gcov-4.8" --remove coverage.info 'tests/*' '/usr/*' 'rapid*' --output-file coverage.info
$HOME/lcov/usr/bin/lcov --gcov-tool "gcov-4.8" --list coverage.info
coveralls-lcov --repo-token $COVERALLS_TOKEN coverage.info
