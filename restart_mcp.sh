#!/bin/bash
# Скрипт для перезапуска HTTP-MCP сервера

echo "🔄 Перезапуск HTTP-MCP сервера..."

# Находим и убиваем процесс на порту 8200
PID=$(lsof -ti:8200)
if [ ! -z "$PID" ]; then
    echo "⏹️ Останавливаем текущий сервер (PID: $PID)..."
    kill $PID
    sleep 2
fi

# Запускаем новый сервер
echo "🚀 Запускаем HTTP-MCP сервер..."
cd mcp-server && npm run start:http &

echo "✅ Сервер перезапущен!"
echo "📊 Проверьте логи в консоли"
