{ pkgs, ... }: {

  programs.git = {
    enable = true;
    signing = {
      signByDefault = true; # requires signing, which requires configuring direnv variables
    };
    ignores = [
      ".idea"
      ".vscode"
      ".devbox"
      ".DS_Store"
      ".envrc"
    ];
    aliases = {
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      s = "status";
      c = "commit -vS";
      p = "add -p";
      co = "checkout";
      br = "branch";
      amend = "commit -vS --amend";
      conflicts = "diff --name-only --diff-filter=U";
      commit = "commit -vS";
      last = "log -1 HEAD";
      pull = "pull --ff-only";
      rebase = "rebase -v";
      staged = "diff --staged";
      supdate = "submodule foreach git pull -f origin master";
      undo = "reset --soft HEAD~";
      unstage = "reset HEAD --";
    };
    extraConfig = {
      core = {
        editor = "nvim";
      };
      credential = {
        helper = "osxkeychain";
      };
      push = {
        default = "simple";
      };
      merge = {
        conflictstyle = "diff3";
      };
      help = {
        autocorrect = true;
      };
      color = {
        ui = true;
        branch = {
          current = "yellow reverse";
          local = "yellow";
          remote = "green";
        };
        diff = {
          meta = "yellow bold";
          frag = "magenta bold";
          old = "red";
          new = "cyan";
        };
        status = {
          added = "yellow";
          changed = "green";
          untracked = "cyan";
        };
      };
    };
    delta = {
      enable = true;
      options = {
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style = "none";
          file-style = "bold yellow ul";
        };
        features = "decorations";
        whitespace-error-style = "22 reverse";
      };
    };
  };
}
