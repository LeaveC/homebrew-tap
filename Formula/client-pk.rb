class ClientPk < Formula
    include Language::Python::Virtualenv
    
    desc "Cursor Auth System Client"
    homepage "https://github.com/LeaveC/client-pk"
    url "https://github.com/LeaveC/client-pk/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "385c8ec92eee999ab7ee95793952dba873c29d94c5b88771e9b78d9b501ef5f6"
    license "MIT"
  
    depends_on "python@3.11"
    
    resource "pyside6" do
      url "https://pypi.org/packages/cp38/P/PySide6/PySide6-6.6.1-cp38-abi3-macosx_11_0_universal2.whl"
      sha256 "3c348948fe3957b18164c9c7b8942fe065bdb39648b326f212bc114326679fa9"
    end
  
    resource "requests" do
      url "https://files.pythonhosted.org/packages/source/r/requests/requests-2.31.0.tar.gz"
      sha256 "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
    end
  
    resource "python-dotenv" do
      url "https://files.pythonhosted.org/packages/source/p/python-dotenv/python-dotenv-1.0.0.tar.gz"
      sha256 "a8df96034aae6d2d50a4ebe8216326c61c3eb64836776504fcca410e5937a3ba"
    end
  
    def install
      virtualenv_install_with_resources
      
      # 创建可执行文件
      (bin/"client-pk").write <<~EOS
        #!/bin/bash
        exec "#{libexec}/bin/python" "#{libexec}/main.py" "$@"
      EOS
    end
  
    test do
      system "#{bin}/client-pk", "--version"
    end
  end