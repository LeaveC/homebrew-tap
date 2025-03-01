class CursorS < Formula
  desc "Cursor Auth System Client"
  homepage "https://github.com/LeaveC/cursor-auth-system"
  version "1.0.0"
  
  if OS.mac?
    url "https://github.com/LeaveC/cursor-auth-system/releases/download/v1.0.0/cursor-s-darwin-amd64.tar.gz"
    sha256 "YOUR_DARWIN_SHA256"
  elsif OS.linux?
    url "https://github.com/LeaveC/cursor-auth-system/releases/download/v1.0.0/cursor-s-linux-amd64.tar.gz"
    sha256 "YOUR_LINUX_SHA256"
  end

  depends_on "go" => :build

  def install
    cd "cursor-auth-system/go-client" do
      system "go", "build", "-o", "cursor-s"
      bin.install "cursor-s"
      prefix.install "go.mod"
      prefix.install "go.sum"
      prefix.install ".env"
      prefix.install "Icon.png"
      prefix.install Dir["cursor_auth"]
      prefix.install "main.go"
    end
  end

  test do
    system "#{bin}/cursor-s", "--version"
  end
end 