docker run \
    --name jenkins \
    -d -p 8080:8080 \
    -v `pwd`/volume:/home/jenkins/.jenkins \
    jenkins-rhel