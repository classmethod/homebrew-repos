require "language/go"

class Aurl < Formula
  homepage "https://github.com/classmethod/aurl"
  url "https://github.com/classmethod/aurl.git", :tag => "1.0.1", :revision => "f9df44f23bfe997f8b1ebd15f5d0ffe00456898d"

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
;  :   .'   \:  ,      .-./---'    |  ,   /  v1.0.1
|  ,     .-./ `--`----'             ---`-'
 `--`---'

EOF
  end
end
