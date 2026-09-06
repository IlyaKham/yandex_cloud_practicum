# Домашняя работа по теме "Вычислительные мощности. Балансировщики нагрузки" --- Хамуро ИА

### Yandex Cloud

1. Создать бакет Object Storage и разместить в нём файл с картинкой:
      Создать бакет в Object Storage с произвольным именем (например, имя_студента_дата).
      Положить в бакет файл с картинкой.
      Сделать файл доступным из интернета.    
   <img width="1468" height="936" alt="Снимок экрана 2026-09-06 185625" src="https://github.com/user-attachments/assets/fd099895-fdd6-4bb1-8bc8-154db26d244f" />
    <img width="1100" height="280" alt="Снимок экрана 2026-09-06 185229" src="https://github.com/user-attachments/assets/c4a60ea1-a5db-4e63-b864-5cbca79f5d2d" />

    Файл с картинкой доступен из интернета, файл для создания в репозитории - storage.tf

3. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:
      Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать image_id = fd827b91d99psvq5fjit.      
      Для создания стартовой веб-страницы рекомендуется использовать раздел user_data в meta_data.
       Здесь я создавал файл user_data.sh.tpl и прокидывал его в metadata для автоконфигурации
     <img width="521" height="142" alt="image" src="https://github.com/user-attachments/assets/f0b1a7a3-e273-44c6-9d47-7a5eeabbfc8d" />

      Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
      Настроить проверку состояния ВМ.    
   <img width="1822" height="204" alt="Снимок экрана 2026-09-06 185155" src="https://github.com/user-attachments/assets/ffc296f4-0da8-4e1b-9d9f-7571f4442c6d" />
   


5. Подключить группу к сетевому балансировщику:
      Создать сетевой балансировщик.
      Проверить работоспособность, удалив одну или несколько ВМ.
   <img width="1315" height="973" alt="Снимок экрана 2026-09-06 185313" src="https://github.com/user-attachments/assets/91a74e2a-c4a3-4a75-a6ac-36c29c5ecebc" />
   <img width="476" height="103" alt="Снимок экрана 2026-09-06 185142" src="https://github.com/user-attachments/assets/9e419182-9977-4298-acdd-5c7b34d72079" />
   <img width="696" height="729" alt="Снимок экрана 2026-09-06 185213" src="https://github.com/user-attachments/assets/76ace67c-cb1b-470c-8d48-1f5764fff244" />
   <img width="618" height="362" alt="Снимок экрана 2026-09-06 185216" src="https://github.com/user-attachments/assets/1d438f46-f86f-4e20-bce5-a3ec188d409a" />
   <img width="571" height="189" alt="Снимок экрана 2026-09-06 185519" src="https://github.com/user-attachments/assets/5964c615-5220-4b56-9ef8-99749bf4350d" />
   <img width="561" height="885" alt="Снимок экрана 2026-09-06 185402" src="https://github.com/user-attachments/assets/853ee844-8c62-41d0-8233-3c0e1e48a2f7" />
   <img width="555" height="877" alt="Снимок экрана 2026-09-06 185407" src="https://github.com/user-attachments/assets/47a6dd5e-7591-43ec-994c-0ab853f6f84c" />
   <img width="574" height="871" alt="Снимок экрана 2026-09-06 185430" src="https://github.com/user-attachments/assets/bc2c6394-8761-41fc-8bec-f0e6a5797aae" />     







