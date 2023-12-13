# bing-wallpaper.fish
fish plugin to fetch daily wallpaper from bing.com 
using [TimothyYe/bing-wallpaper](https://github.com/TimothyYe/bing-wallpaper)

## Install
```fish
fisher install mizuki0629/bing-wallpaper.fish
```

## Usage
```
Usage: bing-wallpaper [options]
Download bing wallpaper.

Options:
      --index       Index, default is 0.
                    Available options are 0 <= index <= 7(days ago).
                    0 means today, 1 means yesterday, 2 means the day before yesterday,
                    and so on.
      --resolution  Resolution, default is 1920.
                    Available options are 1920, 1366 and 3840.
      --mkt         Bing Market, default is en-US. Available options are zh-CN, en-US, ja-JP,
                    en-AU, en-GB, de-DE, en-NZ and en-CA.
  -o, --output      Output filename
  -h, --help        Show this message.\
```

download todays wallpaper to ~/Pictures
```fish
bing-wallpaper -o ~/Pictures/bing-wallpaper.jpg
```

download yeasterdays wallpaper(4K) to ~/Pictures
```fish
bing-wallpaper --index 1 --resolution 3480 -o ~/Pictures/yeasterday.jpg
```
