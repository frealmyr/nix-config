{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;

    history = {
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 1000000;
      size = 1000000;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    oh-my-zsh = {
      enable = true;
      # theme = "powerlevel10k";
      plugins = [
        "direnv"
        "docker"
        "extract"
        "git"
        "golang"
        "gpg-agent"
        "helm"
        "history-substring-search"
        "history"
        "kubectl"
        "kubectl"
        "kubectx"
        "man"
        "terraform"
        "tmux"
        "you-should-use"
      ];
    };

    shellAliases = {
      nixup = "pushd ~/SCM/Github/frealmyr/nix-config; nix flake update; nixswitch; popd";
      bat = "bat --theme=$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo Coldark-Dark || echo Coldark-Cold) --color='always'";
      ls = "ls --color=auto";
      ll = "ls -lahrts";
      l = "ls -l";
      vi = "nvim";
      python = "python3";
      k = "kubectl $kns";
      tmux = "TERM=screen-256color-bce tmux";
      docker-clean = "docker rmi $(docker images -f 'dangling=true' -q)";
    };

    initExtraFirst = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';

    initExtra = ''
      #################
      ## Environment ##
      #################

      export DIRENV_LOG_FORMAT="" # Silence direnv activation stdout
      export EDITOR=vi
      export LC_ALL=en_US.UTF-8
      export LANG=en_US.UTF-8
      export TERM=xterm-256color

      ##############
      ## Sourcing ##
      ##############

      source ~/.p10k.zsh

      ###############
      ## Functions ##
      ###############

      function flushdns() {
        if [[ $(uname -a) == *"Darwin"* ]]; then
          sudo dscacheutil -flushcache
          sudo killall -HUP mDNSResponder
        fi
      }

      function kns() {
        if [[ -z $argv[1] ]]; then
          unset kns
        else
          kns=--namespace=$argv[1]
        fi
      }

      function kwatch() {
      : ''${1?"kwatch SECONDS whatever after here tbh"}
        watch -t -n $argv[1] -c -x zsh -c "kubectl $kns $argv[2] $argv[3] $argv[4] $argv[5] $argv[6]"
      }

      function kgenocide() {
      : ''${1?"kgenocide k8s_resource_type text_to_grep"}
        TYPE=$argv[1]
        NAME=$argv[2]

        printf "\nTargets: \e[1;35m$TYPE\e[0m \e[1;33m$NAME\e[0m\n"
        read "EXCECUTE_EXCECUTION?Do ye wish to kill all $TYPE with this name? [y/N] "
        if [[ "$EXCECUTE_EXCECUTION" =~ ^[Yy]$ ]]
        then
          printf "\n\e[0;32mᕕ( ᐛ ) ᕗ Commencing genocide! \e[0m\n"
          kubectl $kns delete $TYPE $(k $kns get $TYPE | grep $NAME | awk '{print $1}')
        fi
      }

      function kresize() {
      : ''${1?"kresize k8s_resource_type text_to_grep num_pods"}
        TYPE=$argv[1]
        NAME=$argv[2]
        NUM_PODS=$argv[3]

        printf "\nScale targets: \e[1;35m$TYPE\e[0m \e[1;33m$NAME\e[0m \e[1;36m$NUM_PODS\e[0m \n"
        read "EXCECUTE_EXCECUTION?Do ye wish to scale all $TYPE with this name? [y/N] "
        if [[ "$EXCECUTE_EXCECUTION" =~ ^[Yy]$ ]]
        then
          printf "\n\e[0;32mᕕ( ᐛ ) ᕗ Righto, scaling stuff! \e[0m\n"
          kubectl $kns scale --replicas=$NUM_PODS $TYPE $(k $kns get $TYPE | grep $NAME | awk '{print $1}')
        fi
      }
      '';
  };
}
