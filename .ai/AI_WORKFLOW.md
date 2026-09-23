# AI Workflow (Quy trình làm việc cho AI)

Chào AI (Cursor, Copilot, Gemini, Claude, v.v.) 👋. Khi được giao một task trong dự án này, mày PHẢI tuân thủ các bước sau đây một cách nghiêm ngặt:

## Bước 0: Đọc Context & Bộ Nhớ Dự Án

1. Đọc **`.ai/PROJECT_CONTEXT.md`** để hiểu domain, tech stack, database schema, và cấu trúc hiện tại.
2. Đọc **`.ai/LESSONS_LEARNED.md`** để nắm các bẫy kỹ thuật và bài học từ các task trước.
3. Nếu chưa nắm rules → đọc **`AGENTS.md`** (source of truth cho code conventions).
4. Tìm kiếm trong codebase xem có components/services/modules liên quan không (`Ctrl+Shift+F` hoặc tool search).
5. Nếu yêu cầu mơ hồ → hỏi lại user **đúng 1 câu**, không hỏi dồn nhiều.

## Bước 1: Phân Tích & Kế Hoạch (Planning)

1. Xác định rõ: cần tạo file mới nào, sửa file nào, xóa file nào.
2. Kiểm tra xem đã có logic/module tương tự chưa để tái sử dụng.
3. Lên plan ngắn gọn (3-5 bullets) hoặc tạo file markdown plan trước khi code nếu logic phức tạp.

## Bước 2: Viết Code (Implementation)

1. Tuân thủ **Tech Stack** và **AGENTS.md** về conventions.
2. Áp dụng pattern phù hợp (VD: Service Layer, MVC, Clean Architecture) tùy theo convention mà hệ thống (hoặc thư viện) đang dùng.
3. Nếu project có áp dụng TDD (Test-Driven Development), hãy viết file test trước khi implement.

## Bước 3: Verify & Self-Correction

1. Chạy các lệnh kiểm tra lỗi (compile, linter, type-check, tests) nếu được cấp quyền terminal.
2. Tự sửa lỗi nếu có — KHÔNG báo cáo khi còn syntax/compile error chưa fix.

## Bước 4: Cập Nhật Bộ Nhớ AI (Self-Learning & Context Update)

> ⚠️ **BẮT BUỘC:** Trước khi hoàn thành task, AI phải thực hiện cập nhật bộ nhớ dự án:

1. **Cập nhật `.ai/PROJECT_CONTEXT.md`**: Thêm các module, API endpoints mới, DB models mới, hoặc Screens/Pages mới vừa tạo.
2. **Cập nhật `.ai/LESSONS_LEARNED.md`** (chỉ khi cần):
   - Nếu gặp bug lạ / bẫy thư viện mà AI không thể biết từ code → Ghi vào *Bẫy Kỹ Thuật*.
   - Nếu được User sửa lưng / uốn nắn quy tắc mới → Ghi vào *Quy Tắc User Đã Chốt*.
   - **Consolidate**: Nếu file dài quá → gộp entries liên quan, xóa entries đã outdated.

## Bước 5: Báo Cáo Kết Quả

Trả lời ngắn gọn (< 5 bullets):
- ✅ Đã làm gì (tóm tắt).
- 🧠 Đã cập nhật bộ nhớ AI (`PROJECT_CONTEXT.md` & `LESSONS_LEARNED.md`).
- 💡 **Góc nhìn BA:** Phản biện / Đề xuất cải thiện nghiệp vụ hoặc kiến trúc.
- ⚠️ Điểm nào cần user review/chạy thủ công (nếu có).
