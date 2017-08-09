require "language/go"

class Aurl < Formula
  homepage "https://github.com/classmethod/aurl"
  url "https://github.com/classmethod/aurl.git", :tag => "1.0", :revision => "f5bc6d2a4c3df3b40f5f172d89388db903aeacb2"

  head "https://github.com/classmethod/aurl.git", :branch => "develop"

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    dir = buildpath/"src/github.com/classmethod/aurl"
    dir.install Dir["*"]
    cd dir do
      system "glide", "install"
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
;  :   .'   \:  ,      .-./---'    |  ,   /  v1.0
|  ,     .-./ `--`----'             ---`-'
 `--`---'

EOF
  end
end
