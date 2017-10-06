#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("high five" "bugs are coming" "feature bug" "mindblown" "somuchwin" "userissue" "shootself" "shoot" "dwightshrutecelebrating" "ace v dancing" "off and on again" "debugging" "table flip forever" "computer says no" "this is fine" "consuela no no" "look away" "bye" "buddyhi5" "hi5 no" "punch self in face" "excited cheer" "murry jump" "rick morty yes" "stewie computer yes" "my brother" "throw mac" "trash computer" "unbelievable chat messages" "Quit")
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
        "this is fine")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/images/this-is-fine-fire.png' | pbcopy | printf 'Copied this is fine to pasteboard.'
            break
            ;;
        "consuela no no")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/images/consuela-no-no.jpg' | pbcopy | printf 'Copied consuela no no to pasteboard.'
            break
            ;;
        "look away")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/ahh-look-away.gif' | pbcopy | printf 'Copied look away to pasteboard.'
            break
            ;;
        "bye")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/images/bye.jpg' | pbcopy | printf 'Copied bye to pasteboard.'
            break
            ;;
        "buddyhi5")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/images/buddy-hi5.gif' | pbcopy | printf 'Copied buddy hi 5 to pasteboard.'
            break
            ;;
        "hi5 no")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/images/hi5-no.gif' | pbcopy | printf 'Copied hi 5 NO to pasteboard.'
            break
            ;;
        "punch self in face")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/images/punchselfinface.gif' | pbcopy | printf 'Copied punch self in face to pasteboard.'
            break
            ;;
        "excited cheer")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/excited-cheer.gif' | pbcopy | printf 'Copied excited cheer no to pasteboard.'
            break
            ;;
        "murry jump")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/murry-jump.gif' | pbcopy | printf 'Copied murry jump no to pasteboard.'
            break
            ;;
        "rick morty yes")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/rickmortyyes.jpg' | pbcopy | printf 'Copied rick morty yes no to pasteboard.'
            break
            ;;
        "stewie computer yes")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/stewie-computer-yes.gif' | pbcopy | printf 'Copied stewie computer yes yes no to pasteboard.'
            break
            ;;
        "my brother")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/my-brother.gif' | pbcopy | printf 'Copied my brother to pasteboard.'
            break
            ;;
        "throw mac")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/throw-mac.gif' | pbcopy | printf 'Copied throw mac to pasteboard.'
            break
            ;;
        "trash computer")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/trash-computer.gif' | pbcopy | printf 'Copied trash computer to pasteboard.'
            break
            ;;
        "unbelievable chat messages")
            echo 'http://s3-ap-southeast-1.amazonaws.com/pixelstack-dev/gifs/unbelievable-chat-text-no.gif' | pbcopy | printf 'Copied unbelievable chat messages to pasteboard.'
            break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
