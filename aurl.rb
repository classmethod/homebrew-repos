require "formula"

class Aurl < Formula
  homepage "https://github.com/classmethod-aws/aurl"
  version '0.1'
  url "http://repo.classmethod.info/dist/aurl/0.1/aurl_0.1_darwin_amd64.zip"
  sha1 "997854442f9ae0d114acd34d403b9185d33ea7f5"

  depends_on :arch => :intel

  def install
    bin.install 'aurl'
  end

  def caveats
    msg = <<-'EOF'
                                     ,--,
                                   ,--.'|
                      ,--,  __  ,-.|  | :
                    ,'_ /|,' ,'/ /|:  : '
   ,--.--.     .--. |  | :'  | |' ||  ' |
  /       \  ,'_ /| :  . ||  |   ,''  | |
 .--.  .-. | |  ' | |  . .'  :  /  |  | :
  \__\/: . . |  | ' |  | ||  | '   '  : |__
  ," .--.; | :  | : ;  ; |;  : |   |  | '.'|
 /  /  ,.  | '  :  `--'   \  , ;   ;  :    ;
;  :   .'   \:  ,      .-./---'    |  ,   /
|  ,     .-./ `--`----'             ---`-'
 `--`---'

EOF
  end
end
