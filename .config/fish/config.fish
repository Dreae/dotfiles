set fish_greeting ""

function sudo
    if test "$argv" = "!!"
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# Git commands
function gst
  git status $argv
end
function ga
  git add $argv
end
function gca
  git commit -a $argv
end
function gco
  git checkout $argv
end
function gcm
  git checkout master $argv
end
function gd
  git diff $argv
end
function gp
  git push $argv
end
function gl
  git pull $argv
end
