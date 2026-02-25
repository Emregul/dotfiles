function yt-transcript --description 'Download YouTube transcript, parse, and copy to clipboard'
    # Check if URL is provided
    if test (count $argv) -eq 0
        echo "Usage: yt-transcript YOUTUBE_URL"
        echo "Example: yt-transcript https://www.youtube.com/watch?v=dQw4w9WgXcQ"
        return 1
    end

    set youtube_url $argv[1]
    set temp_file (mktemp -t transcript).json3

    echo "📥 Downloading transcript from YouTube..."

    # Try manual subtitles first, fallback to auto-generated
    set output_base (string replace '.json3' '' $temp_file)

    # Try manual subtitles (suppress output except errors)
    yt-dlp --write-sub --skip-download --sub-lang en --sub-format json3 --output "$output_base" "$youtube_url" >/dev/null 2>&1

    # Find the downloaded file
    set downloaded_file "$output_base".*.json3

    # If manual subs failed, try auto-generated
    if not test -f $downloaded_file[1]
        yt-dlp --write-auto-sub --skip-download --sub-lang en --sub-format json3 --output "$output_base" "$youtube_url" 2>&1 | grep -v "Deleting original file"
        set downloaded_file "$output_base".*.json3
    end

    if test -f $downloaded_file[1]
        echo "✅ Transcript downloaded"
        echo "🔄 Parsing transcript..."

        # Parse to temp file first, then copy to clipboard
        set parsed_file (mktemp -t parsed_transcript).txt
        python3 -u ~/Workspace/skill-dev/youtube-summarizer/scripts/parse_subs.py $downloaded_file[1] > $parsed_file 2>&1

        if test $status -eq 0 -a -s $parsed_file
            # Successfully parsed, copy to clipboard
            cat $parsed_file | pbcopy

            if test $status -eq 0
                echo "✅ Transcript parsed and copied to clipboard!"
                echo "📋 Paste it anywhere with Cmd+V"
            else
                echo "❌ Failed to copy to clipboard"
                echo "💡 Transcript saved to: $parsed_file"
                return 1
            end
        else
            echo "❌ Failed to parse transcript"
            if test -f $parsed_file
                echo "Error output:"
                cat $parsed_file
            end
            rm -f $parsed_file
            return 1
        end

        # Clean up
        rm -f $downloaded_file[1]
        rm -f $temp_file
        rm -f $parsed_file
    else
        echo ""
        echo "❌ No subtitles available for this video"
        echo ""
        echo "💡 This video doesn't have subtitles. Options:"
        echo "   1. Check if the video has manual captions you can enable"
        echo "   2. Use Whisper to transcribe the audio (slower, downloads full audio)"
        echo "      yt-dlp -x --audio-format mp3 '$youtube_url'"
        echo "      whisper audio.mp3 --model base --output_format txt"
        rm -f $temp_file
        return 1
    end
end
