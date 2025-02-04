/**
 *
 * This is an example of a working container build using kaniko, 
 * suitable for running as a jenkins pipeline build in a containerised
 * jenkins agent. 
 * 
 * The kaniko build is run with the following flags for simplicity:
 * - force, this as kaniko thinks it is being run run outside of a container on k3s/containerd.
 * - insecure, this is to get around HTTPS/SSL security checks on local hosted container registries.
 * - skip-tls-verify, same as above, allows us to push to insecure local hosted container registries.
 * 
 * Please do not run with these settings in production. You have been warned.
 * 
 * https://github.com/GoogleContainerTools/kaniko
 *
 */

podTemplate(yaml: '''
  kind: Pod
  spec:
    containers:
    - name: kaniko
      image: gcr.io/kaniko-project/executor:v1.8.0-debug
      imagePullPolicy: Always
      command:
      - sleep
      args:
      - 99d
'''
  ) {
  node(POD_LABEL) {
    stage('Build with Kaniko') {
      git 'https://github.com/labberdotio/kaniko-test'
      container('kaniko') {
        sh '/kaniko/executor -f `pwd`/Dockerfile -c `pwd` --force --insecure --skip-tls-verify --cache=true --destination=myregistry.mydomain/myorg/kaniko-test'
      }
    }
  }
}

