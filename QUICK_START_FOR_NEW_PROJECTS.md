# ⚡ Быстрый старт RAG для нового проекта

## 🎯 Цель: За 30 секунд настроить RAG для любого проекта

### 🚀 Один скрипт для всех проектов:

```bash
# Переходим в папку с RAG системой
cd /Users/aleksejcuprynin/PycharmProjects/chanki

# Настраиваем новый проект (замените путь на свой)
./setup-new-project.sh /Users/aleksejcuprynin/PhpstormProjects/NewProject
```

### 📋 Что произойдет:
1. ✅ Проверка существования папки проекта
2. ✅ Проверка работы RAG системы
3. ✅ Создание `CLAUDE.md` с инструкциями
4. ✅ Создание быстрых команд (`start-rag.sh`, `check-rag.sh`)
5. ✅ Готовность к работе!

### 🔄 Алгоритм работы с новым проектом:

#### Шаг 1: Настройка (разовая)
```bash
cd /Users/aleksejcuprynin/PycharmProjects/chanki
./setup-new-project.sh /path/to/your/new/project
```

#### Шаг 2: Запуск RAG
```bash
cd /path/to/your/new/project
./start-rag.sh
```

#### Шаг 3: Открытие Claude Code
- Откройте Claude Code в папке нового проекта
- Claude автоматически найдет `CLAUDE.md` и поймет что делать
- Задавайте вопросы - RAG работает автоматически!

## 🎭 Альтернативные способы:

### Способ 1: Ручное копирование
```bash
# Копируем шаблон CLAUDE.md
cp /Users/aleksejcuprynin/PycharmProjects/chanki/CLAUDE_MD_TEMPLATE.md /path/to/project/CLAUDE.md
```

### Способ 2: Создание алиаса
```bash
# Добавьте в ~/.zshrc или ~/.bashrc
alias setup-rag='cd /Users/aleksejcuprynin/PycharmProjects/chanki && ./setup-new-project.sh'

# Теперь можно использовать из любой папки:
setup-rag /path/to/new/project
```

### Способ 3: Глобальная установка
```bash
# Сделать скрипт доступным глобально
sudo ln -s /Users/aleksejcuprynin/PycharmProjects/chanki/setup-new-project.sh /usr/local/bin/setup-rag-project

# Теперь из любой папки:
setup-rag-project /path/to/new/project
```

## 💡 Примеры использования:

```bash
# Для Laravel проекта
./setup-new-project.sh ~/PhpstormProjects/MyLaravelApp

# Для React проекта  
./setup-new-project.sh ~/WebstormProjects/MyReactApp

# Для любого проекта
./setup-new-project.sh /Users/aleksejcuprynin/Projects/AnyProject
```

## 🔍 Проверка работы:

После настройки в новом проекте будут файлы:
- `CLAUDE.md` - инструкции для Claude
- `start-rag.sh` - быстрый запуск RAG
- `check-rag.sh` - проверка статуса

## ⚠️ Важные моменты:

1. **RAG система должна быть запущена** перед открытием Claude Code
2. **Claude Desktop должен быть перезапущен** после первоначальной настройки MCP
3. **Файл CLAUDE.md должен быть в корне** проекта
4. **MCP сервер работает глобально** - настройка нужна только один раз

## 🎉 Результат:

После выполнения этих шагов в любом проекте:
- Claude автоматически понимает что использовать RAG
- Никаких curl команд не нужно
- Доступ к 6,405 документам происходит прозрачно
- Сохраняется контекст сессии
- Все работает как в текущем проекте HeaterTeam!

---
*Универсальное решение для всех проектов готово! 🚀*