# Project Context

> 📌 **Dành cho AI:** Đọc file này đầu tiên trước khi bắt đầu bất kỳ task nào. File này mô tả domain, cấu trúc, tech stack và state hiện tại của project để mày không cần "khám phá" lại codebase từ đầu mỗi lần.
>
> 📌 **Dành cho User:** Điền thông tin vào các section bên dưới khi bắt đầu dùng template cho project mới. Càng chi tiết, AI càng làm đúng hơn và nhanh hơn.

---

## 1. Thông Tin Project

```
Tên project   : [Điền tên project]
Mô tả ngắn   : [1-2 câu mô tả project làm gì]
Target users  : [Ai sẽ dùng app này?]
Tech stage    : [MVP / Beta / Production]
```

---

## 2. Tech Stack

> 📌 Định nghĩa rõ ngôn ngữ, framework, và thư viện chủ chốt tại đây để AI setup và code đúng chuẩn.

```
Nền tảng đích (Platform): [Web / Mobile / Desktop / CLI / Backend-only]
Ngôn ngữ                : [Ví dụ: TypeScript, Python, Go, Rust, Dart, v.v.]
Framework chính         : [Ví dụ: Next.js, FastAPI, Gin, Flutter, React Native, v.v.]
Database & ORM          : [Ví dụ: PostgreSQL + Prisma, MongoDB + Mongoose, SQLite + GORM, v.v.]
State Management        : [Ví dụ: Redux, Zustand, Bloc, Riverpod, Vuex, v.v.]
Styling / UI Component  : [Ví dụ: TailwindCSS, MaterialUI, Cupertino, v.v.]
```

---

## 3. Database Schema (Tóm Tắt)

> Liệt kê các model/collections chính. AI cần biết tên bảng/collection và relations để generate code đúng.

```
[Điền tóm tắt các model chính]
```

**Ví dụ:**
```
User          - id, name, email, role(ADMIN/MEMBER)
Project       - id, name, description, ownerId
Task          - id, title, status(TODO/IN_PROGRESS/DONE), projectId
```

---

## 4. API Routes / Architecture Components Hiện Có

> Liệt kê các API endpoints hoặc UI routes/screens đã implement.

```
[Điền danh sách routes / endpoints]
```

**Ví dụ (nếu là Backend):**
```
GET    /api/users            → Lấy danh sách users
POST   /api/tasks            → Tạo task mới
```

**Ví dụ (nếu là Frontend/Mobile):**
```
/login               → Màn hình đăng nhập
/dashboard           → Trang chủ sau đăng nhập
```

---

## 5. Services / Modules Đã Có

> Liệt kê services/modules đã tạo. AI sẽ tái sử dụng thay vì tạo duplicate.

```
[Điền danh sách services/modules đã có]
```

---

## 6. Business Rules Quan Trọng

> Các rule domain-specific mà AI cần biết để không generate code sai logic.

```
[Điền các business rules]
```

**Ví dụ:**
```
- Chỉ ADMIN mới có quyền xóa dữ liệu.
- User free chỉ tạo tối đa 3 projects.
```

---

## 7. Ghi Chú Kỹ Thuật Đặc Biệt (Quirks)

> Những quirks, workarounds, hoặc quyết định kỹ thuật đặc biệt mà AI cần biết để không "fix" lại những gì đã được cố tình làm vậy.

```
[Điền nếu có]
```

---

*File này nên được cập nhật liên tục mỗi khi có thêm model, API route, screen, hoặc module mới.*
