{ ... }: {
  programs.git = {
    enable = true;
    config = {
      commit = {
        gpgSign = true;
        verbose = true;
      };
      core = {
        excludesfile = "~/.gitignore";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      fetch = {
        all = true;
        prune = true;
        pruneTags = true;
      };
      help = {
        autocorrect = "prompt";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
        default = "simple";
        followTags = true;
      };
      tag = {
        gpgSign = true;
        sort = "version:refname";
      };
      user = {
        email = "liamfennemanbusiness@gmail.com";
        name = "LiamFenneman";
      };
    };
    lfs = {
      enable = true;
    };
  };
}
