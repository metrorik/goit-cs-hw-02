#!/bin/bash

# Масив с URL вебсайтів
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# файл логів
log_file="website_status.log"

# Очищення файлу логів перед записом нових даних
> "$log_file"

# Перевірка доступності кожного веб-сайту
for website in "${websites[@]}"; do
    # Надсилання HTTP GET запиту за допомогою curl та отримання статусу
    status_code=$(curl -o /dev/null -s -w "%{http_code}\n" -L "$website")
    
    # Перевірка статусу та запис результату у файл логів
    if [ "$status_code" -eq 200 ]; then
        echo "$website is UP" >> "$log_file"
    else
        echo "$website is DOWN" >> "$log_file"
    fi

    # налагоджувальна інформація
    # echo "Проверка сайта: $website"
    # echo "Статус-код: $status_code"
    # curl -I "$website"  # виведення відповідей

done

# повідомлення про завершення роботи скрипту
echo "Результати записані у файл логів: $log_file"
