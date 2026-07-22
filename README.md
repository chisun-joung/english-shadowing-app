# 영어 쉐도잉 700문장 학습 앱

브라우저에서 설치 없이 실행하는 영어 쉐도잉·받아쓰기 학습 앱입니다.

## 주요 단축키

- `3`: 문제 듣기
- `1`: 정답 확인
- `2`: 다음 문장

## GitHub Pages 배포

### 1. GitHub에서 저장소 만들기

1. GitHub에 로그인합니다.
2. 오른쪽 위 `+` → `New repository`를 선택합니다.
3. 저장소 이름을 예를 들어 `english-shadowing-app`으로 입력합니다.
4. Public을 선택하고 저장소를 만듭니다.

### 2. 이 폴더의 파일 업로드

생성된 저장소에서 `uploading an existing file`을 선택하고 다음 항목을 모두 업로드합니다.

- `index.html`
- `.nojekyll`
- `.github/workflows/pages.yml`
- `README.md`

숨김 폴더 업로드가 불편하면 아래의 Git 명령 방식이나 `deploy.ps1`을 사용하세요.

### 3. GitHub Pages 설정

1. 저장소의 `Settings` → `Pages`로 이동합니다.
2. `Build and deployment`의 Source를 `GitHub Actions`로 선택합니다.
3. `Actions` 탭에서 배포 작업이 완료될 때까지 확인합니다.

배포 주소:

`https://GITHUB_USERNAME.github.io/REPOSITORY_NAME/`

예시:

`https://sun.github.io/english-shadowing-app/`

## PowerShell로 업로드

Git이 설치되어 있고 GitHub 저장소를 먼저 만든 상태에서 실행합니다.

```powershell
powershell -ExecutionPolicy Bypass -File .\deploy.ps1 `
  -GitHubUser "사용자명" `
  -Repository "english-shadowing-app"
```

GitHub 비밀번호 대신 Personal Access Token 또는 Git Credential Manager 로그인이 필요할 수 있습니다.
