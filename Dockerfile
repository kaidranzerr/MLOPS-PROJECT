# use an official Python 3.10 image from docker hub
FROM python:3.10-slim-buster 

# set the working directory 
WORKDIR /app 

# copy your application code 
RUN pip install -r requirements.txt 

# Expose the port FASTAPI will run on 
EXPOSE 5000 

# command to run FastAPI app 
CMD ["python3" , "app.py"]
