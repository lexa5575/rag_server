# 🤖 Инструкция для ИИ агента: Как работать с RAG

## ⚡ ГЛАВНОЕ: MCP уже настроен, используй автоматически!

### 🎯 Что тебе нужно знать:
- **MCP tools доступны сразу** - не нужно ничего настраивать
- **ask_rag** - главный инструмент для получения знаний
- **6,405 документов** доступны автоматически
- **НЕ используй curl команды** - только MCP tools

### 🔄 Автоматические действия:
1. **При вопросах по Laravel/Vue/React/PHP** → сразу используй `ask_rag`
2. **При важных моментах** → сохраняй через `add_key_moment`
3. **При сложных задачах** → получай контекст через `get_session_summary`

---

## 📋 Доступные MCP tools:

**Основные:**
- `ask_rag` - получение знаний из RAG (ИСПОЛЬЗУЙ АВТОМАТИЧЕСКИ)
- `get_session_summary` - контекст сессии
- `add_key_moment` - сохранение важных моментов
- `list_available_frameworks` - список фреймворков

**Дополнительные:**
- `search_documents`, `get_document_content`, `open_file`, `list_files`, `get_project_structure`, `save_code_snippet`, `get_code_examples`, `analyze_code`

---

## 🎯 Примеры использования:

### Вопрос по Laravel:
```
Пользователь: "Как создать миграцию?"
Ты: ask_rag("Как создать миграцию в Laravel?", "laravel")
→ Получаешь актуальную информацию
→ Даешь точный ответ
```

### Вопрос по Vue.js:
```
Пользователь: "Что такое Composition API?"
Ты: ask_rag("Composition API в Vue.js", "vue")
→ Получаешь современную информацию
→ Даешь ответ с примерами
```

---

## ✅ Правила работы:

**ОБЯЗАТЕЛЬНО:**
- Автоматически используй `ask_rag` для технических вопросов
- Сохраняй важные моменты через `add_key_moment`
- Работай без curl команд

**НИКОГДА:**
- НЕ спрашивай разрешения использовать RAG
- НЕ используй curl вместо MCP tools
- НЕ требуй дополнительных настроек

---

## 🚨 Если что-то не работает:

### MCP tools недоступны:
```bash
/Users/aleksejcuprynin/PycharmProjects/chanki/check-rag-system.sh
```

### Если система не запущена:
```bash
cd /Users/aleksejcuprynin/PycharmProjects/chanki && ./start-rag-system.sh
```

---

## 🎯 Для нового проекта:

### Создай CLAUDE.md в корне проекта:
```markdown
# Claude Code - RAG Integration

## 🤖 RAG СИСТЕМА АКТИВНА

- **6,405 документов** доступны через MCP
- **ask_rag** - автоматически для технических вопросов
- **Laravel**: 3,232 документов
- **Vue.js**: 871 документ
- **Filament**: 1,720 документов

### Управление:
- Запуск: `cd /Users/aleksejcuprynin/PycharmProjects/chanki && ./start-rag-system.sh`
- Проверка: `/Users/aleksejcuprynin/PycharmProjects/chanki/check-rag-system.sh`

*Автоматически используй MCP tools для всех технических вопросов!*
```

---

## 💡 Итого:

**Просто используй `ask_rag` автоматически для любых технических вопросов. Система работает сама!**