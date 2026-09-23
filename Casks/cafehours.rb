cask "cafehours" do
  version "0.1.0"
  sha256 "REPLACE_WITH_SHA256_FROM_scripts/release.sh"

  url "https://github.com/rogiry/homebrew-CafeHours/releases/download/v#{version}/CafeHours-#{version}.zip"
  name "CafeHours"
  desc "메뉴바에서 전원 관리·덮개 모드 스케줄을 제어하는 macOS 앱"
  homepage "https://github.com/rogiry/homebrew-CafeHours"

  depends_on macos: ">= 26.0"

  app "CafeHours.app"

  postflight do
    # brew는 curl로 받아서 보통 quarantine이 안 붙지만, 혹시 붙어 있으면 Gatekeeper 경고를 피하려고 제거
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/CafeHours.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/CafeHours",
  ]

  caveats <<~EOS
    CafeHours는 개인 배포용 ad-hoc 서명 앱입니다(Developer ID 서명·공증 없음).

    "덮개 모드"를 켜면 관리자 인증과 함께 /etc/sudoers.d/cafehours가 설치됩니다.
    앱을 완전히 지우기 전에 먼저 CafeHours 메뉴에서 덮개 모드를 끄세요
    (sudoers 파일이 자동 제거됩니다). 그러지 않고 지웠다면 직접 제거하세요:
      sudo rm -f /etc/sudoers.d/cafehours

    로그인 시 자동 실행 항목은 앱을 지운 뒤에도 시스템 설정 > 일반 > 로그인 항목에
    남아 있을 수 있습니다. 필요하면 거기서 직접 제거하세요.
  EOS
end
