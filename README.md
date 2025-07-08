# Universal RAG System

Универсальная система RAG (Retrieval-Augmented Generation) для обучения модели на пользовательской документации с поддержкой IDE интеграции.

## Возможности

- 🚀 **Универсальная архитектура** - единая система для всех фреймворков
- 📚 **Поддержка множественных фреймворков** - Laravel, Vue.js и другие
- 🧠 **IDE интеграция** - автоопределение фреймворка и быстрые ответы
- ⚡ **Кэширование** - ускорение повторных запросов
- 🎯 **Конфигурация через YAML** - простое добавление новых фреймворков
- 🔍 **ChromaDB** - эффективный векторный поиск

## Архитектура

```
chanki/
├── config.yaml          # Главная конфигурация
├── docs_manager.py      # Универсальный парсер документации
├── rag_server.py        # FastAPI сервер с IDE поддержкой
├── test_system.py       # Комплексное тестирование
├── chroma_db/           # База векторных данных
└── docs/               # Документация фреймворков
```

## 🚀 Быстрый старт

### 🤖 СУПЕР-АВТОМАТИЗАЦИЯ: одна команда для ВСЕГО!

```bash
# 🔥 МАГИЧЕСКАЯ КОМАНДА - делает ВСЁ автоматически:
python easy_add.py --auto

# ✨ ЧТО ПРОИСХОДИТ АВТОМАТИЧЕСКИ:
# 1. 🔍 Сканирует все папки в проекте
# 2. 🎯 Находит документацию (даже с 1 .md файлом!)
# 3. 🧠 Определяет типы фреймворков автоматически
# 4. ➕ Добавляет ВСЕ новые фреймворки БЕЗ ВОПРОСОВ
# 5. 🔄 Обновляет существующие (новые файлы)
# 6. 📊 Показывает детальную статистику:
#    - Сколько новых папок найдено
#    - Сколько чанков создано из каждой папки  
#    - Общее количество чанков в базе
# 7. 🌐 Автоматически запускает сервер
# 8. 🎉 Готово к использованию!
```

### 🎯 ИДЕАЛЬНЫЙ WORKFLOW ДЛЯ ВАС:

```bash
# Добавляете любые новые папки с документацией в проект:
# - /Users/aleksejcuprynin/PycharmProjects/chanki/filament_docs/
# - /Users/aleksejcuprynin/PycharmProjects/chanki/react_docs/
# - /Users/aleksejcuprynin/PycharmProjects/chanki/любая_документация/

# Одна команда - и ВСЁ работает:
python easy_add.py --auto

# Результат в терминале:
# 🔍 Сканируем папки...
# ✅ filament_docs - найдено файлов документации: 15
# ✅ react_docs - найдено файлов документации: 42
# 🆕 Новых папок найдено: 2
# 📦 Чанков добавлено: 156
# 📚 Общее количество чанков в базе: 4724
# 🌐 Запускаем сервер на http://localhost:8000...
```

### Другие супер-команды автоматизации

```bash
python easy_add.py --scan-all        # Сканирует и показывает найденную документацию
python easy_add.py --smart-sync      # Умная синхронизация: новые + обновления  
python easy_add.py --update-all      # Обновить все существующие фреймворки
```

### Классические команды (всё ещё работают)

```bash
# Добавить конкретную папку
python easy_add.py folder_name

# Примеры:
python easy_add.py inertia_docs      # Добавить Inertia.js
python easy_add.py react_docs        # Добавить React  
python easy_add.py my_framework      # Добавить свой фреймворк
```

### Интерактивный режим

```bash
# Интерактивное добавление с подсказками
python easy_add.py

# Будет спрашивать:
# 📁 Путь к папке с документацией: inertia_docs
# 🔍 Автоопределение: Inertia.js
# ✅ Всё правильно? [Y/n]: 
# 🌐 Запустить сервер? [y/N]: y
```

### Управление фреймворками

```bash
python easy_add.py list               # Список всех фреймворков
python easy_add.py remove vue         # Удалить фреймворк
python easy_add.py stats              # Статистика базы данных
python easy_add.py server             # Запустить сервер
```

### Классический способ (если нужен)

<details>
<summary>Ручная настройка через config.yaml</summary>

### 1. Настройка документации

Добавьте документацию в `docs/` и обновите `config.yaml`:

```yaml
frameworks:
  laravel:
    name: "Laravel Framework"
    enabled: true
    path: "docs/laravel"
    type: "markdown"
    description: "PHP framework for web artisans"
  vue:
    name: "Vue.js"
    enabled: true
    path: "docs/vue"
    type: "markdown"
    description: "Progressive JavaScript framework"
```

### 2. Обработка документации

```bash
python docs_manager.py add
```

### 3. Запуск сервера

```bash
python rag_server.py
```

### 4. Тестирование

```bash
python test_system.py
```

</details>

## API Endpoints

### Основные запросы

**POST /ask** - Обычные вопросы
```json
{
  "question": "Как создать модель в Laravel?",
  "framework": "laravel",
  "max_results": 5
}
```

**POST /ide/ask** - IDE интеграция
```json
{
  "question": "Как добавить reactive ref?",
  "file_path": "/src/components/MyComponent.vue",
  "file_content": "<template><div>{{count}}</div></template>",
  "quick_mode": true
}
```

### Информационные

- **GET /** - Статус API и доступные фреймворки
- **GET /frameworks** - Список поддерживаемых фреймворков
- **GET /stats** - Статистика базы данных
- **DELETE /cache** - Очистка кэша

## Конфигурация

Все настройки находятся в `config.yaml`:

```yaml
# Настройки базы данных
database:
  path: "./chroma_db"
  collection_name: "universal_docs"

# Модель эмбеддингов
embeddings:
  model: "all-MiniLM-L6-v2"

# LM Studio настройки
llm:
  api_url: "http://localhost:1234/v1/completions"
  model_name: "qwen/qwen3-14b"
  max_tokens: 800
  temperature: 0.3

# Кэширование
cache:
  enabled: true
  ttl: 3600
  max_size: 1000

# Сервер
server:
  host: "localhost"
  port: 8000
  cors_origins: ["*"]
```

## Добавление нового фреймворка

1. Добавьте документацию в `docs/framework_name/`
2. Обновите `config.yaml`:

```yaml
frameworks:
  react:
    name: "React"
    enabled: true
    path: "docs/react"
    type: "markdown"
    description: "JavaScript library for building user interfaces"
```

3. Запустите обработку:

```bash
python docs_manager.py
```

## IDE интеграция

Система автоматически определяет фреймворк по:

- **Расширению файла** - `.vue`, `.php`, `.js`
- **Пути к файлу** - `/laravel/`, `/vue/`
- **Содержимому файла** - ключевые слова и синтаксис

Пример использования в IDE:

```python
import requests

response = requests.post("http://localhost:8000/ide/ask", json={
    "question": "Как использовать props?",
    "file_path": "/src/components/UserCard.vue",
    "quick_mode": True
})
```

## Требования

- Python 3.8+
- ChromaDB
- FastAPI
- SentenceTransformers
- LM Studio с моделью qwen/qwen3-14b

## Установка зависимостей

```bash
pip install chromadb fastapi uvicorn sentence-transformers pyyaml requests
```

## Примеры использования

### Новый супер-простой workflow

```bash
# Вариант 1: ПОЛНАЯ АВТОМАТИЗАЦИЯ
# Просто скачайте фреймворки в папки и запустите:
python easy_add.py --auto
# ✨ Система сама найдёт ВСЁ, добавит и запустит сервер!

# Вариант 2: Пошаговая автоматизация
python easy_add.py --scan-all        # Посмотреть что найдено
python easy_add.py --smart-sync      # Добавить новые + обновить старые
python easy_add.py server            # Запустить сервер

# Вариант 3: Классический (как раньше)
git clone https://github.com/inertiajs/inertia.git inertia_docs
python easy_add.py inertia_docs
# 🎉 Автоматически определится Inertia.js, добавится в базу
```

### Пример реального использования

```bash
# У вас в папке проекта лежат:
# - laravel_docs/
# - vue_docs/  
# - inertia_docs/
# - react_docs/

# Одна команда добавляет ВСЁ:
python easy_add.py --auto

# Результат:
# ✅ Найдено 4 фреймворка
# ✅ Добавлено в базу данных  
# ✅ Сервер запущен на http://localhost:8000
# 🎉 RAG система готова к работе с ЛЮБЫМИ вопросами по всем фреймворкам!
```

### Что поддерживается автоматически

| Фреймворк | Автоопределение | Типы документации |
|-----------|----------------|-------------------|
| **Vue.js** | ✅ по файлам .vue, package.json | VitePress, Markdown |
| **React** | ✅ по .jsx/.tsx, React dependencies | Docusaurus, Markdown |
| **Laravel** | ✅ по composer.json, artisan | Markdown |
| **Inertia.js** | ✅ по содержимому README | Markdown |
| **Angular** | ✅ по angular.json | Markdown |
| **Svelte** | ✅ по .svelte, svelte.config.js | Markdown |
| **Django** | ✅ по manage.py | Sphinx, Markdown |

### Работа с разными типами документации

```bash
python easy_add.py vuepress_docs      # VitePress (автоопределение)
python easy_add.py docusaurus_site    # Docusaurus (автоопределение)  
python easy_add.py sphinx_docs        # Sphinx (автоопределение)
python easy_add.py markdown_folder    # Обычный Markdown
```

## Советы по использованию

- **Кэширование** - Повторные запросы выполняются мгновенно
- **Quick mode** - Используйте для автодополнения в IDE (timeout 2s)
- **Фильтрация** - Указывайте фреймворк для более точных ответов
- **Контекст** - Добавляйте дополнительную информацию для лучших результатов
- **Автоопределение** - Система умная, но если ошиблась - исправьте в интерактивном режиме

## Структура данных

Каждый документ в векторной базе содержит:

```json
{
  "content": "Текст документации",
  "metadata": {
    "framework": "laravel",
    "source": "eloquent.md",
    "heading": "Creating Models",
    "path": "docs/laravel/eloquent.md"
  }
}
```

## Поддержка

Система протестирована и готова к использованию. Для расширения функциональности редактируйте соответствующие файлы и перезапускайте систему.