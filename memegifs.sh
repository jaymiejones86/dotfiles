#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("high five" "bugs are coming" "feature bug" "mindblown" "somuchwin" "userissue" "shootself" "shoot" "dwightshrutecelebrating" "ace v dancing" "off and on again" "debugging" "table flip forever" "computer says no" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "high five")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/highestfive.gif' | pbcopy | printf 'Copied highest of fives to pasteboard.'
            break
            ;;
        "bugs are coming")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/the-bugs-are-comming-you-shall-not-pass-thumb.jpg' | pbcopy | printf 'Copied bugs are coming to pasteboard.'
            break
            ;;
        "feature bug")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/feature-bug.jpg' | pbcopy | printf 'Copied feature bugs to pasteboard.'
            break
            ;;
        "mindblown")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/mindblown.gif' | pbcopy | printf 'Copied mind blown to pasteboard.'
            break
            ;;
        "somuchwin")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/somuchwin.jpg' | pbcopy | printf 'Copied so much win to pasteboard.'
            break
            ;;
        "userissue")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/seeusers.gif' | pbcopy | printf 'Copied user issue to pasteboard.'
            break
            ;;
        "shootself")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/shootself.gif' | pbcopy | printf 'Copied user issue to pasteboard.'
            break
            ;;
        "dwightshrutecelebrating")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/dwightshrutecelebrating.gif' | pbcopy | printf 'Copied user issue to pasteboard.'
            break
            ;;
        "shoot")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/shoot.gif' | pbcopy | printf 'Copied user issue to pasteboard.'
            break
            ;;
        "ace v dancing")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/ace-ventura-dancing.gif' | pbcopy | printf 'Copied user issue to pasteboard.'
            break
            ;;
        "off and on again")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/offandon.gif' | pbcopy | printf 'Copied tried turning it off and on again to pasteboard.'
            break
            ;;
        "debugging")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/debugging.gif' | pbcopy | printf 'Copied tried debugging to pasteboard.'
            break
            ;;
        "table flip forever")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/table-flip-forever.gif' | pbcopy | printf 'Copied table flip forever to pasteboard.'
            break
            ;;
        "computer says no")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/computer-says-no.png' | pbcopy | printf 'Copied computer says no to pasteboard.'
            break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
