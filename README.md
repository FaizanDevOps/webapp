# webapp
A Simple Python Flask Web application including connection pooling and a Basic API.

Intially I tested the application on my local by setting up Python and Postgre Database for Web Application and connection pooling.
By using following making up a directory 

mkdir my-web-app
cd my-web-app

Create a Virtual Environment and Activate it:

python3 -m venv venv
source venv/bin/activate

Install Flask and Necessary Dependencies:

pip install flask psycopg2 sqlalchemy


Create a app.py file and requirement.txt and add own PostgreSQL database connection URI.

Run it locally by using the command :

python app.py 

Able to access the web app by putting below URL:

http://127.0.0.1:5000/
http://127.0.0.1:5000/healthz
http://127.0.0.1:5000/api

These is the complete setup I have done to check the app locally moving Make the app in a containerized form by using Dockerfile and Docker-compose 

