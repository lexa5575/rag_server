# 🚀 Быстрый запуск RAG системы для Cline

## Запуск системы (3 шага)

### 1. Запустите LLM модели
```bash
# Qwen через LM Studio
# Модель должна быть доступна на http://127.0.0.1:1234

# DeepSeek через Ollama
# Модель должна быть доступна на http://localhost:11434
```

### 2. Запустите RAG сервер
```bash
cd /Users/aleksejcuprynin/PycharmProjects/chanki
source venv/bin/activate
python rag_server.py
```
Сервер запустится на http://localhost:8000

### 3. Настройте Cline (один раз)

Добавьте в настройки Cline:
```json
{
  "rag-assistant": {
    "command": "node",
    "args": ["/Users/aleksejcuprynin/PycharmProjects/chanki/mcp-server/index.js"],
    "env": {}
  }
}
```

## ✅ Проверка работы

В Cline введите:
```
Используй get_stats чтобы показать статистику RAG базы
```

Вы должны увидеть:
- 6,405 документов
- 6 фреймворков (Vue, Laravel, Alpine, Filament, Inertia, Tailwind CSS)

## 📝 Примеры использования

### Вопросы по фреймворкам:
```
Используй ask_rag чтобы узнать как создать компонент в Vue

Спроси у RAG как работает v-model в Vue

Используй ask_rag с framework="laravel" чтобы узнать как создать миграцию

Спроси RAG что такое Eloquent в Laravel
```

### Выбор модели:
```
Используй ask_rag с model="deepseek" чтобы узнать что такое компонент

Спроси у RAG с model="qwen" как создать миграцию в Laravel
```

### Информация о системе:
```
Покажи список фреймворков используя list_frameworks

Используй get_stats для статистики базы данных

Покажи список доступных моделей используя list_models
```

## 🛠️ Устранение проблем

### LLM не отвечает
- Проверьте, что модели запущены:
  - Qwen на порту 1234
  - DeepSeek через Ollama на порту 11434
- Увеличьте timeout в config.yaml до 120 секунд

### RAG сервер не запускается
```bash
# Переустановите зависимости
pip install -r requirements.txt
```

### MCP сервер не работает в Cline
- Перезапустите VS Code
- Проверьте путь к index.js в настройках
- Посмотрите логи в Output → Cline

## 📊 Что у вас есть

- **6,405 документов** из официальной документации
- **6 фреймворков**: Vue.js, Laravel, Alpine.js, Filament, Inertia.js, Tailwind CSS
- **2 LLM модели**: Qwen (через LM Studio) и DeepSeek (через Ollama)
- **Кэширование** для быстрых повторных запросов
- **Автоопределение** фреймворка по контексту вопроса
- **Полная интеграция** с Cline через MCP

Теперь ваша LLM в Cline будет отвечать на вопросы, используя актуальную документацию!
