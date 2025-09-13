# Cryptomentor (Flutter) – GitHub Pack
Steps:
1) Push all files to a new GitHub repo.
2) Open Actions → wait for workflow → download APK in Artifacts.
Local build:
  flutter create cryptomentor
  cp -r lib cryptomentor/
  cp pubspec.yaml cryptomentor/
  cd cryptomentor && flutter pub get && flutter build apk --release
