#!/usr/bin/env bash
# ALL-SKILLS.md 재생성 — 스킬 원본을 고친 뒤 이걸 돌린다.
#   사용: bash tools/build-all.sh
# 왜 필요한가: Claude 홈(웹·데스크톱 앱)은 로컬 스킬 파일을 못 읽는다.
#   저장소를 통째로 주면 파일 10개를 각각 열어야 하고, 일부만 읽고
#   「확인했다」고 할 수 있다. 한 파일로 합쳐 두면 한 번에 다 읽힌다.
set -euo pipefail
cd "$(dirname "$0")/.."
SRC=.claude/skills
OUT=ALL-SKILLS.md

{
  echo "# 블로그 스킬 전문 (합본)"
  echo
  echo "> **이 파일은 자동 생성됩니다. 직접 고치지 마세요.**"
  echo "> 원본은 \`.claude/skills/<이름>/SKILL.md\` 이고,"
  echo "> 고친 뒤 \`bash tools/build-all.sh\` 를 돌리면 이 파일이 갱신됩니다."
  echo
  echo "생성: $(date "+%Y-%m-%d %H:%M") · 스킬 $(ls -1 $SRC | wc -l)개"
  echo
  echo "## AI 에게"
  echo
  echo "블로그 글 작업이면 아래 스킬들을 **전부 읽고** 그 규칙대로 진행합니다."
  echo "순서는 \`draft-to-post\` 파이프라인을 따릅니다."
  echo "\`lms-safe\` 는 LMS 강의 내용을 옮길 때 **가장 먼저** 적용합니다."
  echo "기업 연계 과제 내용은 **대외비** 이므로 회사명·실명·분야 용어·코드를"
  echo "적지 않고 방법론만 남깁니다."
  echo
  echo "## 목차"
  echo
  for d in $(ls -1 $SRC); do echo "- [\`$d\`](#$d)"; done
  echo
  for d in $(ls -1 $SRC); do
    echo
    echo "---"
    echo
    echo "<a id=\"$d\"></a>"
    echo
    echo "# 스킬: $d"
    echo
    cat "$SRC/$d/SKILL.md"
    echo
  done
} > $OUT

echo "생성 완료: $OUT · $(wc -l < $OUT)줄 · $(du -h $OUT | cut -f1)"
