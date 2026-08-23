# blog-skills — 내 학습 일지 블로그를 위한 스킬 세트

Marcus의 학습 일지 블로그에
회고 글을 올릴 때 **매번 AI에게 똑같이 설명하던 일**을 스킬로 굳혔다.

## 무슨 불편이 있었나

글 한 편을 올릴 때마다 AI에게 이걸 매번 다시 설명하고 있었다.

- "내 블로그는 이런 은유형 제목을 쓰고, 도입부는 전날 글이랑 이어져야 해."
- "용어는 **정의 / 비유 / 예시** 3단으로 정리해줘."
- "front matter는 Chirpy 형식이고 카테고리는 `[일지, 개발]`, 날짜는 `+0900`…"
- "어려운 말은 계산대 옆 바구니처럼 일상 비유로 풀어줘."
- "마지막은 'AI가 한 일 vs 내가 판단한 일'로 닫고 다음 글 예고로 끝내줘."
- "말투는 자랑하지 말고 담담하게, '알고 가기' 느낌으로."

**같은 설명의 반복.** 글은 쌓이는데 설명하는 수고는 줄지 않았다.

## 스킬이 그걸 어떻게 없앴나

반복하던 설명을 10개의 스킬로 나눠, 이제는 **노트만 던지면** 블로그 양식 그대로 나온다.

| 스킬 | 언제 쓰나 |
|------|-----------|
| [`lms-safe`](.claude/skills/lms-safe/SKILL.md) | LMS 노드 내용을 블로그로 옮길 때 저작권·게시 규칙 준수 (원문 복붙·조기 공개 방지, 자체 소화 재작성) — **가장 먼저 적용** |
| [`blog-retro`](.claude/skills/blog-retro/SKILL.md) | 노트 → 회고 일지 한 편으로 변환 (핵심) |
| [`term-card`](.claude/skills/term-card/SKILL.md) | 용어 → 정의/비유/예시 카드 |
| [`jekyll-frontmatter`](.claude/skills/jekyll-frontmatter/SKILL.md) | 파일명 + front matter 자동 생성 |
| [`analogy-maker`](.claude/skills/analogy-maker/SKILL.md) | 기술 개념 → 일상 비유 |
| [`my-role`](.claude/skills/my-role/SKILL.md) | 'AI가 한 일 vs 내 판단' 마무리 |
| [`concept-bridge`](.claude/skills/concept-bridge/SKILL.md) | 실습 글에 실제로 적용한 개념 글을 "관련 개념" 링크로 연결 |
| [`tone-keeper`](.claude/skills/tone-keeper/SKILL.md) | 초안을 내 말투로 교정 |
| [`readme-standard-check`](.claude/skills/readme-standard-check/SKILL.md) | README 가 정석 구성인지 점검하고, 실제 코드/폴더와 어긋난 낡은 문구를 찾아 고침 |
| [`draft-to-post`](.claude/skills/draft-to-post/SKILL.md) | 위 스킬을 엮는 원스톱 파이프라인 |

`draft-to-post`가 나머지를 순서대로 호출하는 오케스트레이터라, **노트 한 뭉치 → 발행 완료 글**까지 한 번에 간다.

> **알아둘 점** — `jekyll-frontmatter`는 발행 시각을 **실제 현재보다 과거로** 잡는다.
> Jekyll이 미래 날짜의 글을 빌드에서 제외해 사이트에 404가 나던 문제를 막기 위해서다.
> (직접 겪고 고쳐서 스킬에 규칙으로 박아 둔 것 — 같은 실수가 반복되지 않게.)
>
> **알아둘 점 2** — `tone-keeper`는 2026-08-21 부터 **정식 용어를 쉬운 말로 바꿔치지 않는다.**
> 「PR」을 「검토 요청」, 「머지」를 「합치기」로 풀어쓰면 글쓴이가 그 말을 못 쓰는 것처럼
> 읽힌다. 용어는 그대로 두고 비유를 **옆에** 붙인다. 블로그 글 4편 이상에서 직접 쓴
> 어휘 목록을 스킬에 넣어 뒀고, 갱신 방법도 함께 적어 뒀다.
>
> **저작권 가드** — `lms-safe`는 LMS(강의) 노드 내용을 그대로 옮기지 않게 막는다.
> 원문 복붙·6어절 이상 연속 동일 표현·코드 그대로 게시·조기 공개를 걸러 내고, **자체 소화한 내용**으로만 쓰게 한다.
> `blog-retro`·`term-card`·`draft-to-post`가 이 가드를 먼저 거치도록 연결돼 있다.
>
> **개념↔실습 다리** — `concept-bridge`는 배운 개념이 실전에서 어떻게 쓰였는지를 글 구조에 남긴다.
> 실습 글에 그 실습이 실제로 적용한 개념 글을 짧은 링크 박스로 연결해서, "그때 배운 게 여기서 이렇게 쓰였다"가 나중에 다시 봐도 한눈에 보이게 한다.

## 쓰는 법 (Claude Code 기준)

이 저장소의 `.claude/skills/`가 스킬 경로다. 저장소 안에서 Claude Code를 열고 한마디면 발동한다.

- "오늘 배운 거 회고로 정리해줘" → `blog-retro`
- "이 용어들 용어정리 카드로" → `term-card`
- "이 노트 발행까지 완성해줘" → `draft-to-post`

## 왜 하나가 아니라 세트인가

블로그 글 한 편에는 **여러 반복이 겹쳐** 있었다.
각 반복을 작은 스킬로 쪼개니 따로도 쓰고(용어만 정리, 말투만 교정),
`draft-to-post`로 묶어 통째로도 쓸 수 있게 됐다 — 재사용성이 올라갔다.
