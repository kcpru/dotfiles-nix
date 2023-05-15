self: super: {
  spotify-custom = super.spotify.overrideAttrs
    (oldAttrs: rec{
      pname = "spotify-custom";
      postInstall = oldAttrs.postInstall + "
      chmod -R u+w $out/share/spotify/Apps
      ${super.spicetify-cli}/bin/spicetify-cli apply -n -c $out/share/spotify/Apps
    ";
    });
}
