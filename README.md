# AI-First App Template (Agnostic Stack)

Welcome to the **AI-First App Template**! This template is completely tech-stack agnostic and is designed as a "vibe coding" foundation. It does not contain any boilerplate code (no Next.js, no Python, no Flutter). Instead, it contains the "AI brain" (`.ai/` directory) and strict instructions (`AGENTS.md`) to guide LLMs (Cursor, Copilot, Gemini, Claude) in building your project correctly from scratch.

## 🚀 How to use this template

### 1. Define your Tech Stack
Open `.ai/PROJECT_CONTEXT.md` and fill in the details:
- What language/framework are you using? (e.g., Python/FastAPI, TypeScript/Next.js, Dart/Flutter)
- What is the goal of the app?
- What are the core models/entities?

### 2. Initialize the project with AI
Open your IDE (Cursor, VS Code with Copilot) or ask your AI agent to initialize the project based on the context. 

**Prompt example:**
> "Hãy đọc .ai/PROJECT_CONTEXT.md và khởi tạo project boilerplate theo đúng tech stack đã mô tả. Nhớ tuân thủ các quy tắc trong AGENTS.md."

### 3. Vibe Code!
From now on, whenever you ask the AI to build a feature, it will automatically:
- Read your context.
- Follow the TDD workflow in `.ai/AI_WORKFLOW.md`.
- Ensure high-quality architecture and design via `.ai/TASTESKILL.md`.
- Keep the project knowledge base updated automatically.

## 📂 Directory Structure

```text
├── .ai/                          # "Não bộ" của AI
│   ├── PROJECT_CONTEXT.md        # File chứa Tech Stack & Business Logic (Bạn điền file này)
│   ├── LESSONS_LEARNED.md        # Bộ nhớ tích lũy lỗi và conventions
│   ├── AI_WORKFLOW.md            # Quy trình code step-by-step cho AI
│   ├── TASTESKILL.md             # Quy tắc thiết kế UI/UX & Architecture
│   └── TEMPLATE_SPEC.md          # Mẫu viết prompt yêu cầu tính năng
├── AGENTS.md                     # Source of Truth cho các quy tắc code (AI luôn đọc)
├── CLAUDE.md                     # Trỏ Claude đọc AGENTS.md
├── .cursorrules                  # Trỏ Cursor đọc thư mục .ai/
└── README.md
```

## Sync skills to downstream projects

```powershell
.\scripts\sync-skills.ps1 -DryRun              # preview
.\scripts\sync-skills.ps1 -Commit -Push        # copy + commit + push
.\scripts\sync-skills.ps1 -Projects MyApp     # custom target(s)
```
Default targets are listed in the -Projects param of the script. Project-specific skills are never deleted.

