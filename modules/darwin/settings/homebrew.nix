# Not using anymore
{ pkgs, ... }: {
  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
    # caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    global = {
      brewfile = true;
      # lockfiles = true;
    };
    casks = [ 
      "firefox"
      "visual-studio-code"
      "font-sf-mono-nerd-font"
      "obs"
      "signal"
      "steam"
    ];
    taps = [
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "d12frosted/emacs-plus"
      # "xorpse/formulae"
      "cmacrae/formulae"
    ];
    # brews = [ "trippy" ];

    extraConfig = ''
      brew "d12frosted/emacs-plus/emacs-plus@28", args: ["with-elrumo2-icon", "with-native-comp", "with-xwidgets", "without-imagemagick"]
      brew "cmacrae/formulae/spacebar"
    '';
  };
}
