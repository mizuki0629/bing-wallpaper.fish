set temp (mktemp -d)
cd $temp

@echo "Test bing-wallpaper"
@test "no args" (bing-wallpaper 2> /dev/null) -f bing-wallpaper.jpg

@echo "Test bing-wallpaper --output"
@test "output" (bing-wallpaper --output output.jpg 2> /dev/null) -f output.jpg
@test "o" (bing-wallpaper --o o.jpg 2> /dev/null) -f o.jpg

@echo "Test bing-wallpaper --index"
@test "index 0" (bing-wallpaper --index 0 -o index-0.jpg 2> /dev/null) -f index-0.jpg
@test "index 1" (bing-wallpaper --index 1 -o index-1.jpg 2> /dev/null) -f index-1.jpg
@test "index 2" (bing-wallpaper --index 2 -o index-2.jpg 2> /dev/null) -f index-2.jpg
@test "index 3" (bing-wallpaper --index 3 -o index-3.jpg 2> /dev/null) -f index-3.jpg
@test "index 4" (bing-wallpaper --index 4 -o index-4.jpg 2> /dev/null) -f index-4.jpg
@test "index 5" (bing-wallpaper --index 5 -o index-5.jpg 2> /dev/null) -f index-5.jpg
@test "index 6" (bing-wallpaper --index 6 -o index-6.jpg 2> /dev/null) -f index-6.jpg
@test "index 7" (bing-wallpaper --index 7 -o index-7.jpg 2> /dev/null) -f index-7.jpg
@test "index 8" (bing-wallpaper --index 8 -o index-8.jpg 2>&1) = "Error: index must be between 0 and 7."
@test "index -1" (bing-wallpaper --index -1 -o index--1.jpg 2>&1) = "Error: index must be between 0 and 7."
@test "index 7.1" (bing-wallpaper --index 7.1 -o index-7.1.jpg 2>&1) = "Error: index must be between 0 and 7."
@test "index a" (bing-wallpaper --index a -o index-a.jpg 2>&1) = "Error: index must be between 0 and 7."

@echo "Test bing-wallpaper --mkt"
@test "mkt ja-JP" (bing-wallpaper --mkt ja-JP -o mkt-ja-JP.jpg 2> /dev/null) -f mkt-ja-JP.jpg
@test "mkt en-US" (bing-wallpaper --mkt en-US -o mkt-en-US.jpg 2> /dev/null) -f mkt-en-US.jpg
@test "mkt zh-CN" (bing-wallpaper --mkt zh-CN -o mkt-zh-CN.jpg 2> /dev/null) -f mkt-zh-CN.jpg
@test "mkt en-AU" (bing-wallpaper --mkt en-AU -o mkt-en-AU.jpg 2> /dev/null) -f mkt-en-AU.jpg
@test "mkt en-GB" (bing-wallpaper --mkt en-GB -o mkt-en-GB.jpg 2> /dev/null) -f mkt-en-GB.jpg
@test "mkt de-DE" (bing-wallpaper --mkt de-DE -o mkt-de-DE.jpg 2> /dev/null) -f mkt-de-DE.jpg
@test "mkt en-NZ" (bing-wallpaper --mkt en-NZ -o mkt-en-NZ.jpg 2> /dev/null) -f mkt-en-NZ.jpg
@test "mkt en-CA" (bing-wallpaper --mkt en-CA -o mkt-en-CA.jpg 2> /dev/null) -f mkt-en-CA.jpg
@test "mkt ko-KR" (bing-wallpaper --mkt ko-KR -o mkt-ko-KR.jpg 2>&1) = "Error: mkt must be zh-CN, en-US, ja-JP, en-AU, en-GB, de-DE, en-NZ or en-CA."

@echo "Test bing-wallpaper --resolution"
@test "resolution 1920" (bing-wallpaper --resolution 1920 -o resolution-1920.jpg 2> /dev/null) -f resolution-1920.jpg
@test "resolution 1366" (bing-wallpaper --resolution 1366 -o resolution-1366.jpg 2> /dev/null) -f resolution-1366.jpg
@test "resolution 3840" (bing-wallpaper --resolution 3840 -o resolution-3840.jpg 2> /dev/null) -f resolution-3840.jpg
@test "resolution 1000" (bing-wallpaper --resolution 1000 -o resolution-1000.jpg 2>&1) = "Error: resolution must be 1920, 1366 or 3840."
@test "resolution abcd" (bing-wallpaper --resolution abcd -o resolution-abcd.jpg 2>&1) = "Error: resolution must be 1920, 1366 or 3840."


rm -rf $temp
