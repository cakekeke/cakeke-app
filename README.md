# cakeke

## git 규칙

## branch

main : 릴리즈 단위로 최종 작업물을 PR하는 브랜치, push를 직접적으로 제한하며 꼼꼼한 검토 후 merge\
|-- develop : 하위 branch를 merge하여 커밋을 모으는 branch, 하위 branch는 항상 작업전 develop branch를 merge한 후 작업한다\
|----- feat/\* : 기능 개발할때 사용\
|----- refact/\* : 리팩토링할 때 사용\
|----- docs/\* : docs 작업할때 사용

### commit message

- git commitizen의 규칙을 따른다. 아래의 사이트 참고\
  https://blog.dnd.ac/github-commitzen-template
