podTemplate(label: 'master', containers: [
    containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat')
],
volumes: [
hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock'),
]) {
  node('master') {
    bitbucketStatusNotify(buildState: 'INPROGRESS')
    try {

      stage('checkout') {
        checkout scm
      }

      stage('build') {
        container('docker') {
          sh "docker info"
        }
      }

    } catch(Exception e) {
		bitbucketStatusNotify(buildState: 'FAILED')
    }

	bitbucketStatusNotify(buildState: 'SUCCESSFUL')
  }
}
