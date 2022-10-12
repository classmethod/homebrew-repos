require "language/go"

class Aurl < Formula
  homepage "https://github.com/classmethod/aurl"
  url "https://github.com/classmethod/aurl.git", :tag => "1.1.0", :revision => "e4b54a91b22d6c75bf12d5a3ca66a382b3c7087f"
  version "1.1.0"

  head "https://github.com/classmethod/aurl.git", :branch => "master"

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
;  :   .'   \:  ,      .-./---'    |  ,   /  v1.1.0
|  ,     .-./ `--`----'             ---`-'
 `--`---'

EOF
  end
end
