#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("high five" "bugs are coming" "feature bug" "mindblown" "somuchwin" "userissue" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "high five")
            echo 'https://p.gr-assets.com/540x540/fit/hostedimages/1380393870/758402.gif' | pbcopy | printf 'Copied highest of fives to pasteboard.'
            break
            ;;
        "bugs are coming")
            echo 'http://www.troll.me/images/gandolf/the-bugs-are-comming-you-shall-not-pass-thumb.jpg' | pbcopy | printf 'Copied bugs are coming to pasteboard.'
            break
            ;;
        "feature bug")
            echo 'http://cdn.memegenerator.net/instances/250x250/33018175.jpg' | pbcopy | printf 'Copied feature bugs to pasteboard.'
            break
            ;;
        "mindblown")
            echo 'http://img.photobucket.com/albums/v201/foolishtook/HIMYM/mindblown.gif' | pbcopy | printf 'Copied mind blown to pasteboard.'
            break
            ;;
        "somuchwin")
            echo 'http://www.quickmeme.com/img/0f/0ff49113f737f6725161e579f345863f0a8b6d82d260aca7a3726c18b760b024.jpg' | pbcopy | printf 'Copied so much win to pasteboard.'
            break
            ;;
        "userissue")
            echo 'http://s3-ap-southeast-1.amazonaws.com/jaymiejones86-settings/images/seeusers.gif' | pbcopy | printf 'Copied user issue to pasteboard.'
            break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
