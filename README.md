# webapp
A Simple Python Flask Web application including connection pooling and a Basic API.

Intially I tested the application on my local by setting up Python and Postgre Database for Web Application and connection pooling.
By using following making up a directory 

# mkdir my-web-app
# cd my-web-app

Create a Virtual Environment and Activate it:

# python3 -m venv venv
# source venv/bin/activate

Install Flask and Necessary Dependencies:

# pip install flask psycopg2 sqlalchemy


Create a app.py file and requirement.txt and add own PostgreSQL database connection URI.

Run it locally by using the command :

# python app.py 

Able to access the web app by putting below URL:

# http://127.0.0.1:5000/
# http://127.0.0.1:5000/healthz
# http://127.0.0.1:5000/api

These is the complete setup I have done to check the app locally. Next Step to  Make the app in a containerized form by using Dockerfile and Docker-compose and make it more efficient.

Create a Dockerfile of a simple web application, So by taking dockerfile we can easily create images and from that images we can create a container from it , The command is mention below to create and run a container by using dockerfile.

# docker build -it image_name .

Note --> . is going to specify where is the location of Dockerfile, So . represent it is in current folder.

After creating Dockerfile , We have another option to the app containerized by using docker feature called docker compose . it is very convenient light and fast. Make  the application more robust and easily scalable and configurable.

Just by using

# sudo docker-compose up --build 

Note: --build is used to make the build first and we can put down the application by using  --> sudo docker-compose down

After running the above command application is running successful and can access web page by entering below links:

# http://127.0.0.1:5000/
# http://127.0.0.1:5000/healthz
# http://127.0.0.1:5000/api

But their is one problem with Image sizing because it make the image of size more than a GB so I opt for the Multistage build feature of Dockerfile and use them in my dockerfile so it reduces the size upto 90% and make it more fast and convenient by using multi stage build.
The First Stage install the Python dependencies using the requirement.txt and saves them in the user's home directory. Second stage runtime image copies all the installed dependencies from the builder stage and sets the working directory . It also add the user base bianry path to make the installed dependencies accesible.

After achieving both steps A is set up Web Application and then  B Dockerizing the application is also done now moving ahead make deployable on Kubernetes by using helm chart.

First helm in our local then create helm directory by using below command:

# helm create webapp

it will a proper pre equiped directory structure where configuring many templates to achieve the following 
Recover from broken states by automatically restarting pods. 
Route the traffic to the healthy pods only.
Automatically scale based on CPU usage.
Using configmaps to read the required environment variables. Having declarative resources limits (CPU, RAM).
Make sure the database is up and running before the application.

after taking above thing into the consideration then jump into the scripting part where script is written to deploy the webapp in a very conveneint manner.




