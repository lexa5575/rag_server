# 🧠 Система памяти RAG сервера

Руководство по использованию системы управления сессиями с sliding window и ключевыми моментами, аналогичной Cursor/Cline.

## 🎯 Возможности

- **Sliding Window**: Последние 200 сообщений с автоматическим сжатием
- **Ключевые моменты**: Автоматическое обнаружение и сохранение важных событий
- **Сжатая история**: Умное сжатие старых сообщений с сохранением контекста
- **Контекст проекта**: Поддержание контекста работы над проектом
- **Автоматическая очистка**: Управление жизненным циклом сессий

## 📋 Архитектура

### Основные компоненты

1. **Session** - Сессия работы с проектом
2. **Message** - Отдельное сообщение в диалоге
3. **KeyMoment** - Важное событие с типом и важностью
4. **CompressedPeriod** - Сжатая история старых сообщений
5. **SessionManager** - Основной класс управления

### Типы ключевых моментов

| Тип | Важность | Описание |
|-----|----------|----------|
| `breakthrough` | 9 | Прорывы и озарения |
| `error_solved` | 8 | Решение ошибок |
| `deployment` | 8 | Развертывание |
| `feature_completed` | 7 | Завершение функций |
| `important_decision` | 7 | Важные решения |
| `config_changed` | 6 | Изменения конфигурации |
| `refactoring` | 6 | Рефакторинг |
| `file_created` | 5 | Создание файлов |

## 🚀 Использование

### Основные запросы с памятью

```python
import requests

# Создание новой сессии
response = requests.post("http://localhost:8000/sessions/create", 
                        params={"project_name": "my_project"})
session_id = response.json()["session_id"]

# Запрос с использованием памяти
response = requests.post("http://localhost:8000/ask", json={
    "question": "Как создать модель в Laravel?",
    "framework": "laravel",
    "project_name": "my_project",
    "session_id": session_id,
    "use_memory": True
})
```

### IDE интеграция

```python
# Запрос от IDE с автоматическим определением проекта
response = requests.post("http://localhost:8000/ide/ask", json={
    "question": "Как добавить валидацию?",
    "file_path": "/path/to/my_project/src/models/User.php",
    "file_content": "<?php class User extends Model { ... }",
    "use_memory": True
})
```

### Работа с ключевыми моментами

```python
# Добавление ключевого момента
response = requests.post(f"http://localhost:8000/sessions/{session_id}/key-moment", json={
    "moment_type": "error_solved",
    "title": "Исправлена ошибка валидации",
    "summary": "Решена проблема с валидацией email адресов",
    "importance": 8,
    "files": ["app/Models/User.php"],
    "context": "Пользователь жаловался на ошибки при регистрации"
})

# Получение информации о сессии
response = requests.get(f"http://localhost:8000/sessions/{session_id}")
session_info = response.json()
```

## 📊 Управление сессиями

### Получение сессий проекта

```python
# Все сессии проекта
response = requests.get("http://localhost:8000/sessions/project/my_project")
sessions = response.json()["sessions"]

# Статистика сессий
response = requests.get("http://localhost:8000/sessions/stats")
stats = response.json()
```

### Архивирование и очистка

```python
# Архивирование сессии
response = requests.post(f"http://localhost:8000/sessions/{session_id}/archive")

# Очистка старых сессий (старше 30 дней)
response = requests.post("http://localhost:8000/sessions/cleanup", 
                        params={"days_threshold": 30})
```

## 🔧 Настройка

### Конфигурация в config.yaml

```yaml
# Настройки системы памяти
memory:
  max_messages: 200          # Максимум сообщений в sliding window
  compression_threshold: 50  # Количество сообщений для сжатия
  cleanup_days: 30          # Дни до архивирования

# База данных сессий
session_storage:
  db_path: "./session_storage.db"
  backup_enabled: true
  backup_interval: 24  # часов
```

### Инициализация в коде

```python
from session_manager import SessionManager

# Инициализация с настройками
session_manager = SessionManager(
    db_path="custom_sessions.db",
    max_messages=300,  # Больше сообщений в памяти
    compression_threshold=75
)
```

## 🧪 Тестирование

Запуск тестов системы памяти:

```bash
# Запуск всех тестов
python test_session_manager.py

# Тесты отдельных компонентов
python -m unittest test_session_manager.TestSessionManager
python -m unittest test_session_manager.TestAutoDetectKeyMoments
python -m unittest test_session_manager.TestDataModels
```

## 📈 Примеры использования

### Сценарий 1: Разработка функции

```python
# Создаем сессию для проекта
session_id = session_manager.create_session("ecommerce_site")

# Добавляем сообщения о работе
session_manager.add_message(session_id, "user", 
    "Нужно создать систему корзины покупок")
session_manager.add_message(session_id, "assistant", 
    "Создам модель Cart и контроллер CartController")

# Автоматически обнаруженный ключевой момент
session_manager.add_key_moment(session_id, 
    KeyMomentType.FEATURE_COMPLETED,
    "Корзина покупок",
    "Реализована базовая функциональность корзины",
    files=["app/Models/Cart.php", "app/Controllers/CartController.php"]
)
```

### Сценарий 2: Отладка проблемы

```python
# Сообщения об ошибке
session_manager.add_message(session_id, "user", 
    "Получаю ошибку 500 при добавлении товара в корзину")

# Процесс решения
session_manager.add_message(session_id, "assistant", 
    "Проверим логи и исправим проблему с валидацией")

# Ключевой момент решения
session_manager.add_key_moment(session_id,
    KeyMomentType.ERROR_SOLVED,
    "Исправлена ошибка 500",
    "Проблема была в неправильной валидации quantity",
    importance=8,
    files=["app/Controllers/CartController.php"]
)
```

### Сценарий 3: Просмотр истории проекта

```python
# Получаем полный контекст сессии
context = session_manager.get_session_context(session_id)

print(f"Проект: {context['project_name']}")
print(f"Ключевые моменты: {len(context['key_moments'])}")
print(f"Последние сообщения: {len(context['recent_messages'])}")

# Просматриваем топ ключевых моментов
for moment in context['key_moments'][:5]:
    print(f"- {moment['title']} (важность: {moment['importance']})")
```

## 🔄 Автоматическое обнаружение

Система автоматически обнаруживает ключевые моменты по контенту:

```python
# Эти фразы автоматически создают ключевые моменты
messages = [
    "Fixed the authentication bug",           # -> error_solved
    "Created new user service",               # -> file_created  
    "Successfully implemented payment",       # -> feature_completed
    "Updated database configuration",         # -> config_changed
]
```

## 🎯 Лучшие практики

1. **Используйте осмысленные имена проектов** - это поможет в организации сессий
2. **Добавляйте контекст к ключевым моментам** - это улучшит понимание истории
3. **Регулярно очищайте старые сессии** - это поддержит производительность
4. **Проверяйте автоматически обнаруженные моменты** - при необходимости корректируйте
5. **Используйте правильные типы моментов** - это влияет на приоритизацию

## 🔍 Мониторинг и отладка

```python
# Получение статистики
stats = session_manager.get_stats()
print(f"Всего сессий: {stats['total_sessions']}")
print(f"Уникальных проектов: {stats['unique_projects']}")

# Проверка конкретной сессии
session = session_manager.get_session(session_id)
print(f"Сообщений: {len(session.messages)}")
print(f"Ключевых моментов: {len(session.key_moments)}")
print(f"Сжатых периодов: {len(session.compressed_history)}")
```

## 🚨 Устранение проблем

### Проблема: Сессия не найдена
```python
# Проверьте, существует ли сессия
session = session_manager.get_session(session_id)
if not session:
    print("Сессия не найдена, создаем новую")
    session_id = session_manager.create_session(project_name)
```

### Проблема: Слишком много сообщений
```python
# Система автоматически сжимает, но можно проверить
session = session_manager.get_session(session_id)
if len(session.messages) > 180:
    print("Скоро произойдет сжатие")
```

### Проблема: Медленная работа
```python
# Очистите старые сессии
archived, deleted = session_manager.cleanup_old_sessions(days_threshold=15)
print(f"Очищено: {archived} архивированных, {deleted} удаленных")
```

## 🔗 Интеграция с существующими системами

### Интеграция с IDE
```python
# Пример плагина для VS Code
def on_file_save(file_path, content):
    session_id = get_current_session()
    session_manager.add_message(session_id, "system", 
        f"Файл сохранен: {file_path}",
        actions=["file_save"],
        files=[file_path]
    )
```

### Интеграция с CI/CD
```python
# Пример webhook для деплоя
def on_deploy_success(commit_hash, environment):
    session_id = get_deployment_session()
    session_manager.add_key_moment(session_id,
        KeyMomentType.DEPLOYMENT,
        f"Деплой в {environment}",
        f"Успешный деплой коммита {commit_hash}",
        importance=8
    )
```

Система памяти RAG сервера предоставляет мощный инструмент для поддержания контекста и истории работы над проектами, значительно улучшая качество ответов и пользовательский опыт! 🚀