---
name: jekyll-frontmatter
description: 조경호 블로그(GitHub Pages / Chirpy) 새 글의 파일명과 YAML front matter를 규칙대로 자동 생성할 때 사용. 제목·카테고리·태그·날짜·설명 필드를 형식에 맞춰 만든다.
---

# Jekyll Front matter 생성 (jekyll-frontmatter)

Chirpy 테마 규칙에 맞춰 새 글의 **파일명 + front matter**를 만든다.
값을 지어내기보다 입력에서 뽑아내되, 빠진 필드는 규칙대로 채운다.

## 파일명
```
_posts/YYYY-MM-DD-slug.md
```
- 날짜는 발행일(KST 기준).
- `slug`은 영어 kebab-case, 소문자. (예: `server-remembers`, `terms-database`)
- 용어정리 글은 `terms-주제`, 프로젝트 글은 내용 기반 slug.

## Front matter 형식
```yaml
---
title: "은유형 제목 — 한 줄 부제"
date: YYYY-MM-DD HH:MM:SS +0900
categories: [상위, 하위]
tags: [태그1, 태그2, 태그3]
description: 글 미리보기 1~3문장. 무엇을 한/배운 날인지, 가능하면 전날 글과 잇는 한마디.
---
```

## 필드 규칙
- **title**: `"핵심 은유 — 부제"` 형태. em대시 `—`로 제목과 부제를 나눈다.
  - 예: `"마지막 문을 연 날 — 터널로 세상과 잇고, 나만 들어가게"`
- **date**: 반드시 `+0900`(KST) 포함. 시:분:초까지.
- **categories**: 항상 **2단계** `[상위, 하위]`.
  - 개발 개념·구현 회고 → `[일지, 개발]`
  - 용어 모음 → `[일지, 용어정리]`
  - 프로젝트 통짜 회고 → `[프로젝트]`
- **tags**: 한글·영어 혼합 허용. 그 글에 등장한 기술/키워드를 그대로.
  자주 쓰는 것: `배포, 보안, 회고, 로드맵, 데이터베이스, Docker, 백엔드`.
- **description**: 검색·목록에 노출되는 미리보기. 전날 예고를 이어받으면 시리즈 느낌이 산다.

## 출력
파일명 한 줄 + `---`로 감싼 front matter 블록. 애매한 필드는 후보를 제시하고 확인을 받는다.
