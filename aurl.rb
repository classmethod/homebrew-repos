require "language/go"

class Aurl < Formula
  homepage "https://github.com/classmethod/aurl"
  url "https://github.com/classmethod/aurl.git", :branch => "develop", :revision => "ccfc067cf6e9e8b161368ca8888a7a2138abc008"
  version "1.1.0-SNAPSHOT-ccfc067"

  head "https://github.com/classmethod/aurl.git", :branch => "develop"

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/classmethod/aurl"
    dir.install Dir["*"]
    cd dir do
      system "go", "build", "-o", bin/"aurl"
    end
  end

  test do
    ENV["LC_ALL"] = "en_US.UTF-8"
    system "#{bin}/aurl", "-V"
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
;  :   .'   \:  ,      .-./---'    |  ,   /  v1.1.0-SNAPSHOT
|  ,     .-./ `--`----'             ---`-'
 `--`---'

EOF
  end
end
