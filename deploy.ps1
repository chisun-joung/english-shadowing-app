param(
    [Parameter(Mandatory=$true)][string]$GitHubUser,
    [Parameter(Mandatory=$true)][string]$Repository
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git이 설치되어 있지 않습니다. https://git-scm.com/ 에서 Git을 설치하세요."
}

Set-Location $PSScriptRoot

if (-not (Test-Path ".git")) {
    git init
}

git branch -M main
git add .

$hasCommit = git rev-parse --verify HEAD 2>$null
if ($LASTEXITCODE -ne 0) {
    git commit -m "Deploy English shadowing app"
} else {
    $changes = git status --porcelain
    if ($changes) {
        git commit -m "Update English shadowing app"
    }
}

$remoteUrl = "https://github.com/$GitHubUser/$Repository.git"
$existingRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
    git remote set-url origin $remoteUrl
} else {
    git remote add origin $remoteUrl
}

git push -u origin main

Write-Host "업로드 완료. GitHub 저장소의 Settings > Pages에서 Source를 GitHub Actions로 선택하세요."
Write-Host "예상 주소: https://$GitHubUser.github.io/$Repository/"
