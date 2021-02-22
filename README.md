# ft_services
The aim of this project is to manage a Kubernetes cluster.
This project consists of setting up an infrastructure of different services. To do this, we use Kubernetes.  
You will need to set up a multi-service cluster.

### Requirements:
- Each service will run in a dedicated container.
- Each container must bear the same name as the service concerned and for perfomance reasons, containers have to be built with Alpine Linux.  
- Every service needs a `Dockerfile`, which will be called in the `setup.sh`.
- You will have to build the images yourself, it is forbidden to use already existing images or use services like DockerHub.
- You will also have to set up:
  - The Kubernetes web dashboard. This will help you manage your cluster.  
  - The Load Balancer which manages the external access of your services. It will be the only entrypoint to the cluster.  
    The Load Balancer will have a single IP.
  - A WordPress website, which will work with a MySQL database. Both services have to run in separate containers.  
    The Wordpress website will have several users and an administrator. WordPress needs its own NginX server.  
    The Load Balancer should be able to redirect directly to this service.  
  - PhpMyAdmin, linked with the MySQL database. PhpMyAdmin needs its own NginX server.  
    The Load Balancer should be able to redirect directly to this service.  
  - A container with an NginX server listening on ports 80 and 443.  
    Port 80 will be http, and should be a systematic redirection of type 301 to 443, which will be https.  
    This container will allow access to a /wordpress route that makes a 307 redirect to IP:WP_PORT.  
    It will also allow access to a /phpmyadmin route with a reverse proxy to IP:PMA_PORT.
    You also must be able to access the NginX container with SSH.
  - A FTPS server listening on port 21.
  - A Grafana platform, listening on port 3000, linked with an InfluxDB database.  
    Grafana will be monitoring all containers. You must create one dashboard per service. InfluxDB and Grafana will be in different containers.
  - In case of a crash or stop of a database container, you will have to make sure the data persists.
  - All your containers must restart in case of a crash or stop of one of its components.
