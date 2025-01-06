# Use the official Jupyter PySpark notebook image as the base image
FROM jupyter/pyspark-notebook:latest

# Switch to root user to install dependencies
USER root

# Step 1: Install system dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \
    libmysqlclient-dev 
    

# Step 2: Set the working directory in the container
WORKDIR /home/jovyan/work

# Step 3: Copy the current directory contents into the container at /home/jovyan/work
COPY . /home/jovyan/work

# Step 4: Install any additional Python libraries you need (e.g., pandas, dvc, etc.)
RUN pip install -r requirements.txt

# Step 5: Expose the port the app will run on (Jupyter Notebook uses port 8888 by default)
EXPOSE 8888

# Step 6: Start Jupyter notebook
CMD ["start-notebook.sh"]
