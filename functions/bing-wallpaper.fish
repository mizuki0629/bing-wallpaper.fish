function bing-wallpaper
    argparse --name="bing-wallpaper-download" \
        index= \
        resolution= \
        mkt= \
        o/output= \
        h/help \
        -- $argv

    if set -ql _flag_help
        echo "\
Usage: bing-wallpaper-download
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
"

        return 0
    end

    if set -ql _flag_mkt
        if not test $_flag_mkt = "zh-CN" -o \
                    $_flag_mkt = "en-US" -o \
                    $_flag_mkt = "ja-JP" -o \
                    $_flag_mkt = "en-AU" -o \
                    $_flag_mkt = "en-GB" -o \
                    $_flag_mkt = "de-DE" -o \
                    $_flag_mkt = "en-NZ" -o \
                    $_flag_mkt = "en-CA" -o 2> /dev/null
            echo "Error: mkt must be zh-CN, en-US, ja-JP, en-AU, en-GB, de-DE, en-NZ or en-CA." >&2
            return 1
        end
    else
        set _flag_mkt "en-US"
    end

    if set -ql _flag_resolution
        if not test $_flag_resolution -eq 1920 -o \
                $_flag_resolution -eq 1366 -o \
                $_flag_resolution -eq 3840 2> /dev/null
            echo "Error: resolution must be 1920, 1366 or 3840." >&2
            return 1
        end
    else
        set _flag_resolution "1920"
    end

    if not set -ql _flag_output
        set _flag_output "bing-wallpaper.jpg"
    end

    set -l restapi "https://bing.biturl.top/?format=image&resolution=$_flag_resolution&mkt=$_flag_mkt"
    if set -ql _flag_index
        if not test $_flag_index -ge 0 -a $_flag_index -le 7 2> /dev/null
            echo "Error: index must be between 0 and 7." >&2
            return 1
        end
    else
        set _flag_index 0
    end
    curl -L "$restapi&index=$_flag_index" -o "$_flag_output"
end
