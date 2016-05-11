function dreae_git_prompt
  set -l repo_info (command git rev-parse --is-bare-repository --is-inside-work-tree --abbrev-ref HEAD ^/dev/null)
  test -n "$repo_info"; or return

  set -l bare_repo $repo_info[1]
  set -l in_workdir $repo_info[2]
  set -l branch $repo_info[3]

  command git diff --exit-code >/dev/null ^/dev/null
  set -l workdir_dirty "$status"

  command git diff --exit-code --cached >/dev/null ^/dev/null
  set -l uncomitted "$status"

  set_color yellow
  printf 'λ '
  set_color cyan
  printf 'git '
  set_color red
  if test 1 -eq $workdir_dirty
    printf "%s ⚡" "$branch"
  else if test 1 -eq $uncomitted
    printf "%s ←" "$branch"
  else
    printf "%s" "$branch"
  end
  set_color yellow
  printf ' → '
end

function fish_prompt
  set last_status $status
  set_color yellow
  printf 'λ '
  set_color green
  printf '%s' (prompt_pwd)
  set_color yellow
  printf ' → '
  set_color normal
  printf '%s' (dreae_git_prompt)
  set_color normal
end
