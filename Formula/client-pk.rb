class ClientPk < Formula
    include Language::Python::Virtualenv
    
    desc "Cursor Auth System Client"
    homepage "https://github.com/LeaveC/client-pk"
    url "https://github.com/LeaveC/client-pk/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "385c8ec92eee999ab7ee95793952dba873c29d94c5b88771e9b78d9b501ef5f6"
    license "MIT"
  
    depends_on "python@3.11"
    
    resource "pyside6" do
      url "https://files.pythonhosted.org/packages/PySide6-6.6.1.tar.gz"
      sha256 "YOUR_PYSIDE6_SHA256"
    end
  
    resource "requests" do
      url "https://files.pythonhosted.org/packages/requests-2.31.0.tar.gz"
      sha256 "YOUR_REQUESTS_SHA256"
    end
  
    resource "python-dotenv" do
      url "https://files.pythonhosted.org/packages/python-dotenv-1.0.0.tar.gz"
      sha256 "YOUR_DOTENV_SHA256"
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