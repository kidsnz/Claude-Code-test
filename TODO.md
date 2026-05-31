# TODO - Claude Code Pong

このプロジェクトのタスク管理。**作業開始時に必ず確認すること。**

## 現在地（2026-05-31）

- **Step 1 完了**: `cc-pong.asm` スケルトン（黒画面、262行NTSC、TIM64Tタイマー）が動作確認済み
- **次回**: STEP_PLAN.md の **Step 2（センターネット）** から開始

## 進行中

- [ ] Step 2: センターネット（BALL レジスタ + VDELBL でダッシュパターン）

## 次にやる（優先順）

1. [ ] Step 2: センターネット
2. [ ] Step 3: 静的スコア "0-0"
3. [ ] Step 4: 静的パドル
4. [ ] Step 5: 静的ボール
5. [ ] Step 6 以降は `STEP_PLAN.md` 参照

## 完了

- [x] 02.asm / 02.bin をルートから削除（archive/terminal_02と重複）
- [x] archive/ を terminal_01 / terminal_02 / claude.ai_ver に整理
- [x] docs/, docs_reference/ を docs_atari/, docs_pong/ にリネーム
- [x] グローバル CLAUDE.md に「整理整頓と標準化の重視」を追記
- [x] STEP_PLAN.md 作成（10コア+2仕上げ）
- [x] Git初期化 & GitHub接続（main をデフォルトブランチ化、参考資料はローカルのみ）
- [x] **Step 1: スケルトン** (2026-05-31, Opus 4.7)

## 制作ワークフロー（毎ステップ繰り返し）

1. `cc-pong.asm` を編集
2. `cd "/Users/shinji/Documents/2D/260304_Claude-Code-Pong" && dasm cc-pong.asm -f3 -occ-pong.bin`
3. Stella で動作確認（Claude が自動起動＋スクショ可能、ユーザーも確認）
4. OK なら `git commit && git push`

## アイデア・保留事項

- サウンドは Video Olympics の効果音をできれば録音参考にしたい
- 完成後 Stella で他人にも遊んでもらいたい

## 参考資料へのリンク

- `STEP_PLAN.md` - **全ステップの設計図（必読）**
- `docs_pong/AtariAge/APongJuly02.bin` - 再現ターゲットROM
- `docs_pong/AtariAge/APONG09302005.asm` - 参考ソース
- `docs_atari/` - Atari 2600 全般リファレンス
- メモリ（自動読込）: project_goal_video_olympics, project_pong_status, feedback_pong_implementation, reference_build_env 他
