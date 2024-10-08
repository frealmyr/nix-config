{ pkgs, ... }: {

  programs.git = {
    enable = true;
    signing = {
      signByDefault = true; # requires signing, which requires configuring direnv variables
    };
    ignores = [
      ".idea",
      ".vscode",
      ".devbox",
      ".DS_Store",
      ".envrc"
    ];
    aliases = {
        lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit;
        s = status;
        c = commit -v;
        p = add -p;
        co = checkout;
        br = branch;
        amend = commit -vS --amend;
        conflicts = diff --name-only --diff-filter=U;
        commit = commit -v;
        last = log -1 HEAD;
        pull = pull --ff-only;
        rebase = rebase -v;
        staged = diff --staged;
        supdate = submodule foreach git pull -f origin master;
        undo = reset --soft HEAD~;
        unstage = reset HEAD --;
        url =! "open -u https://bitbucket.org/$(git remote show origin -n | grep h.URL | sed 's/.*://;s/.git$//') ";
        url-pr =! "open -u https://bitbucket.org/$(git remote show origin -n | grep h.URL | sed 's/.*://;s/.git$//')/pull-requests/new";
        feature = 'git fetch; git checkout -b $1 ${2:-"origin/master"}';
        publish = "git push -u origin $(git rev-parse --abbrev-ref HEAD) 2>&1 >/dev/null | awk '/pull request/{getline; print \\$2; fflush()}' | xargs open";
        unpublish = "!sh -c 'git push --delete origin $(git rev-parse --abbrev-ref HEAD --)' -";
        whois = "!sh -c 'git log -i -1 --pretty=\"format:%an <%ae>\n\" --author=\"$1\"' -";
    };
    extraConfig = {
      core = {
        trustctime = true;
        autocrlf = false; #true
        editor = "nvim";
      };
      credential = {
        helper = osxkeychain;
      };
      push = {
        default = simple;
      };
      merge = {
        conflictstyle = diff3;
      };
      help = {
        autocorrect = true;
      };
      color = {
        ui = true;
        branch = auto;
        diff = auto;
        status = auto;
        branch = {
          current = yellow reverse;
          local = yellow;
          remote = green;
        };
        diff = {
          meta = yellow bold;
          frag = magenta bold;
          old = red;
          new = cyan;
        };
        status = {
          added = yellow;
          changed = green;
          untracked = cyan;
        };
      };
    };
    delta = {
      enable = true;
      theme = "Dracula";
    };
  };
}
