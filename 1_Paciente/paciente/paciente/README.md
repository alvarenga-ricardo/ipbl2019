# API DJANGO

### BEFORE FIRST RUN
```sh
cd 1_Paciente/paciente/paciente

if it runs in docker:
    sudo docker-compose up --build -d
    sudo docker exec -ti paciente bash
    python3 manage.py makemigrations api
    python3 manage.py migrate
else:
    # start mysql
    sudo apt install python3-dev python3-pip
    sudo pip3 install -r requirements.txt
    python3 manage.py makemigrations api
    python3 manage.py migrate
    
```

### TO RUN (after first)
```sh
python3 manage.py runserver
OR
sudo docker-compose up -d
```

### Documentation & API
```sh
http://127.0.0.1:8000/api/paciente
```

### GUI
```sh
http://127.0.0.1:8000/paciente
```