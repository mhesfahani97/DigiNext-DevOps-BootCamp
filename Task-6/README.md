1. **Create a DigitalOcean Droplet**
    - at least two CPU + 2G RAM + 2G swap.

2. **Buy a Domain**
    - my domain is mhesfahani97.beauty.
    - and my dns record for this task is gitlab.mhesfahani97.beauty.

2. **GitLab Installation**
    - install just commercial eddition it means use `ce` and not `ee`.

3. **Clone the Project**
    - clone the [project](https://github.com/docker/getting-started-app/tree/main) to your own gitlab.
    - tag 1.0.0 to this project.  
      `git tag -a 1.0.0 -m "version 1.0.0"`

4. **Image Management**
    - login to your gitlab  
      `docker login gitlab.mhesfahani97.beauty:5050`
    - build the image  
      `docker build -t gitlab.mhesfahani97.beauty:5050/root/task-6:1.0.0 .`
    - push the image to container registry  
      `docker push gitlab.mhesfahani97.beauty:5050/root/task-6:1.0.0`

