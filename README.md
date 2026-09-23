# CafeHours

macOS 26 메뉴바 앱. 요일별 스케줄에 따라 화면 덮개를 닫아도 잠들지 않는 "덮개 모드"를 자동으로 켜고 끕니다.

## 설치

```
brew tap rogiry/CafeHours
brew trust --tap rogiry/cafehours
brew install --cask cafehours
xattr -dr com.apple.quarantine /Applications/CafeHours.app  # Gatekeeper 경고 없이 바로 열려면(선택)
```

## 업데이트

```
brew upgrade --cask cafehours
```

## 제거

덮개 모드를 쓰고 있었다면 먼저 CafeHours 메뉴에서 꺼서 `/etc/sudoers.d/cafehours`를 정리한 뒤 지우세요.

```
brew uninstall --zap --cask cafehours
```

## 참고

- 개인 배포용 ad-hoc 서명 앱입니다(Developer ID 서명·공증 없음). 위 `xattr` 줄을 건너뛰었는데 Gatekeeper가 막으면 시스템 설정 > 개인정보 보호 및 보안에서 "그래도 열기"를 눌러주세요.
- macOS 26 이상 필요.
- 덮개 모드를 켜면 관리자 인증과 함께 sudoers 드롭인이 설치됩니다.
