class CursorS < Formula
  desc "Cursor Auth System Client"
  homepage "https://github.com/LeaveC/cursor-auth-system"
  url "https://github.com/LeaveC/cursor-auth-system.git"
  version "1.0.0"

  depends_on "go" => :build

  def install
    # 创建一个简单的启动脚本
    (bin/"cursor-s").write <<~EOS
      #!/bin/bash
      cd #{prefix}/go-client && go run main.go "$@"
    EOS

    # 复制源代码
    prefix.install Dir["*"]
    chmod 0755, bin/"cursor-s"
  end

  test do
    system "#{bin}/cursor-s", "--version"
  end
end 