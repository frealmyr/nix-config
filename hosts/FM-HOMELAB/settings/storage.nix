{ ... }: {

  fileSystems."/".options = [ "noatime" "discard" ];

  fileSystems."/media/storage" =
    { device = "/dev/disk/by-uuid/cfa79390-be40-4637-a73c-967d6d6c00a3";
      fsType = "ext4";
      options = [ "noatime" "discard" ];
    };
}
