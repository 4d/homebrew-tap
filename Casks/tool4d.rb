cask "tool4d" do
  version "21.0.100301"
  sha256 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"  # sha256 du .tar.gz entier

  if Hardware::CPU.arm?
    url "https://product-download.4d.com/release/21.x/21.0/100301/mac/tool4d_arm64.tar.xz"
  else
    url "https://product-download.4d.com/release/21.x/21.0/100301/mac/tool4d_x86_64.tar.xz"
  end

  name "tool4d"
  desc "tool4d cli for 4D"
  homepage "https://developer.4d.com/docs/Admin/cli#tool4d"

  # Si ton .tar.gz contient directement le .app à la racine :
  artifact "tool4d.app", target: "/Applications/tool4d.app"

  # Crée un symlink dans /opt/homebrew/bin (ou /usr/local/bin) vers l’exécutable interne
  binary "#{appdir}/tool4d.app/Contents/MacOS/tool4d", target: "tool4d"

  livecheck do
    # Si tu veux que brew upgrade --cask détecte les nouvelles versions automatiquement
    url :url
    strategy :header_match
  end

  # Optionnel : si tu veux nettoyer en désinstallation
  uninstall delete: "/Applications/tool4d.app"
end
