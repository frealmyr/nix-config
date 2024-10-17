{ pkgs, ... }: {
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };
  programs.gh-dash = {
    enable = true;
    settings = {
      prSections = [{
        title = "My Pull Requests";
        filters = "is:open author:@me";
      }];
    };
  };
}
