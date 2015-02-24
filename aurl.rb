require "formula"

class Aurl < Formula
  homepage "https://github.com/classmethod-aws/aurl"
  version '0.2.1'
  if Hardware.is_64_bit?
    url "https://github.com/classmethod-aws/aurl/releases/download/0.2.1/aurl_0.2.1_darwin_amd64.zip"
    sha1 "244f245b8a67ae744906c7ce9cb9d13647618085"
  else
    url "https://github.com/classmethod-aws/aurl/releases/download/0.2.1/aurl_0.2.1_darwin_386.zip"
    sha1 "bc0643897b6807b42474381a0b882f8a665b6a1e"
  end

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
