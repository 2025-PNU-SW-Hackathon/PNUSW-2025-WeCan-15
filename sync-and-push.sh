#!/bin/bash

# 색상 출력용 함수
function echo_info {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

function echo_error {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
}

echo_info "📥 1. 원격 브랜치 최신 상태로 pull (rebase)"
git pull origin main --rebase || { echo_error "pull 실패"; exit 1; }

echo_info "🔄 2. 서브모듈 업데이트"
git submodule update --init --recursive || { echo_error "submodule 업데이트 실패"; exit 1; }

echo_info "📤 3. 변경사항 커밋 준비"
git add .

read -p "📝 커밋 메시지를 입력하세요: " commitMsg

if [ -z "$commitMsg" ]; then
  echo_error "커밋 메시지가 비어있습니다. 종료합니다."
  exit 1
fi

git commit -m "$commitMsg"

echo_info "🚀 4. push to origin/main"
git push origin main || { echo_error "push 실패"; exit 1; }

echo_info "✅ 모든 작업 완료!"
