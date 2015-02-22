require "formula"

class Aurl < Formula
  homepage "https://github.com/classmethod-aws/aurl"
  version '0.2'
  url "https://github.com/classmethod-aws/aurl/releases/download/0.2/aurl_0.2_darwin_amd64.zip"
  sha1 "d1e25b788d58fcbc6b9295940652692cb3722292"

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
