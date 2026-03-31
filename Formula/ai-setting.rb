class AiSetting < Formula
  desc "Bootstrap Claude Code, Codex, Cursor, Gemini CLI, and Copilot project settings"
  homepage "https://github.com/Jaewon94/ai-setting"
  url "https://github.com/Jaewon94/ai-setting/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "242e051465eede71b5fffbfc35bcd117d18e55c04dea4d55f67bcaa84266284c"
  license "MIT"

  depends_on "jq" => :recommended

  def install
    libexec.install Dir["*"]
    chmod 0555, libexec/"bin/ai-setting.js"
    bin.install_symlink libexec/"bin/ai-setting.js" => "ai-setting"
  end

  test do
    tmpdir = testpath/"test-project"
    tmpdir.mkpath
    system bin/"ai-setting", "--skip-ai", "--dry-run", tmpdir
  end
end
