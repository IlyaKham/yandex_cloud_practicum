#!/bin/bash
# Установка веб-сервера
apt-get update
apt-get install -y apache2

# Создаём веб-страницу с отображением имени ВМ и IP
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Картинка из Object Storage</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 40px;
            background: #f0f2f5;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            display: inline-block;
        }
        img {
            max-width: 600px;
            border-radius: 8px;
            margin: 20px 0;
        }
        .info {
            color: #555;
            font-size: 14px;
            margin-top: 20px;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Картинка из Object Storage</h1>
        <img src="${image_url}" alt="Картинка">
        <div class="info">
            <p><strong>Имя ВМ:</strong> $(hostname)</p>
            <p><strong>IP-адрес:</strong> $(hostname -I | awk '{print \$1}')</p>
            <p><strong>Время ответа:</strong> $(date)</p>
        </div>
    </div>
</body>
</html>
EOF

# Запускаем веб-сервер
systemctl restart apache2