cask "tool4d" do
  version "21.0.100301"

  if Hardware::CPU.arm?
    url "https://product-download.4d.com/release/21.x/21.0/100301/mac/tool4d_arm64.tar.xz"
    sha256 "e15500e59ead66abab6f8c592643bd2e648429aaa0df5b700bd898e2f6043b8b"
  else
    url "https://product-download.4d.com/release/21.x/21.0/100301/mac/tool4d_x86_64.tar.xz"
    sha256 "acdd68536ea2dbf36ff8fca82ea449118b29638837e727bc3ccd63c6799c4666"
  end

  name "tool4d"
  desc "tool4d cli for 4D"
  homepage "https://developer.4d.com/docs/Admin/cli#tool4d"

  # Si ton .tar.gz contient directement le .app à la racine :
  artifact "tool4d.app", target: "/Applications/tool4d.app"

  # Crée un symlink dans /opt/homebrew/bin (ou /usr/local/bin) vers l’exécutable interne
  binary "#{appdir}/tool4d.app/Contents/MacOS/tool4d", target: "tool4d"

  livecheck do
    url :url
    strategy :header_match
  end

  uninstall delete: "/Applications/tool4d.app"
end
