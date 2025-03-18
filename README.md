Репозиторий для обучения написания REST API сервера на питоне.
В рамках курса обучения DevOps

Запуск сервера
uvicorn simple_python_app.app:app --reload

Импорт библиотек:

FastAPI — фреймворк для создания API.
psycopg2 — библиотека для работы с PostgreSQL.
os — модуль для работы с переменными окружения.

Настройки базы данных:
Переменные окружения (os.getenv()) используются для задания параметров подключения.

Если переменные окружения не заданы, используются значения по умолчанию:
localhost:5432
База данных: api
Пользователь: apiuser
Пароль: apipass
Формируется DATABASE_URL, который используется для подключения.

Создается подключение к PostgreSQL.
conn = psycopg2.connect(DATABASE_URL)

Открывается курсор для выполнения SQL-запросов.
cursor = conn.cursor()

Запуск docker
docker build -t my-fastapi-app .
docker run -p 8000:8000 my-fastapi-app

Запуск compose.yaml
docker compose up -d

Просмотр логов
docker compose logs --follow web

Просмотр событий
docker compose events

Остановка проекта
docker compose down -v