cask "cafehours" do
  version "0.2.0"
  sha256 "99e1a05daebbdc8295e97ec3f89f95d2bab4784ddd003e74e9a25aaa004c4cad"

  url "https://github.com/rogiry/homebrew-CafeHours/releases/download/v#{version}/CafeHours-#{version}.zip"
  name "CafeHours"
  desc "메뉴바에서 전원 관리·덮개 모드 스케줄을 제어하는 macOS 앱"
  homepage "https://github.com/rogiry/homebrew-CafeHours"

  depends_on macos: :tahoe

  app "CafeHours.app"
  # 명령줄 도구. Contents/MacOS/cafehours는 대소문자를 무시하는 APFS에서 앱 실행 파일과 같은 파일이라 Helpers에 있다
  binary "#{appdir}/CafeHours.app/Contents/Helpers/cafehours"

  zap trash: [
    "~/Library/Application Support/CafeHours",
  ]

  caveats <<~EOS
    CafeHours는 개인 배포용 ad-hoc 서명 앱입니다(Developer ID 서명·공증 없음).

    "덮개 모드"를 켜면 관리자 인증과 함께 /etc/sudoers.d/cafehours가 설치됩니다.
    앱을 완전히 지우기 전에 먼저 CafeHours 메뉴에서 덮개 모드를 끄세요
    (sudoers 파일이 자동 제거됩니다). 그러지 않고 지웠다면 직접 제거하세요:
      sudo rm -f /etc/sudoers.d/cafehours

    명령줄 도구 `cafehours`가 PATH에 연결됩니다(`cafehours doctor`로 확인).
    Claude Code 훅을 설치했다면(`cafehours hooks install` 또는 설정 탭) 앱을 지우기 전에
    `cafehours hooks uninstall`로 제거하세요. 지운 뒤에도 훅은 아무것도 하지 않고 조용히 끝납니다.

    로그인 시 자동 실행 항목은 앱을 지운 뒤에도 시스템 설정 > 일반 > 로그인 항목에
    남아 있을 수 있습니다. 필요하면 거기서 직접 제거하세요.
  EOS
end
