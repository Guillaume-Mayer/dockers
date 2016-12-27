docker run \
    --name corfo \
    -p 8081:8081 -p 8161:8161 -p 8787:8787 -p 9990:9990 \
    -v /escritorio_empresa/runtime/jboss-fuse/standalone/configuration:/escritorio_empresa/runtime/jboss-fuse/standalone/configuration \
    -v /escritorio_empresa/runtime/jboss-fuse/standalone/deployments:/escritorio_empresa/runtime/jboss-fuse/standalone/deployments \
    -v /escritorio_empresa/runtime/config:/escritorio_empresa/runtime/config \
    -d corfo