podTemplate(label: 'master', containers: [
	      containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat')
	    ],
volumes: [
  hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock'),
]) {
  node('master') {
    try {
      def repo = checkout scm
      def commit = repo.GIT_COMMIT
      def commitId = "${commit[0..8]}"

      bitbucketStatusNotify(buildState: 'INPROGRESS')

      stage('Build') {
	container('docker') {
	  sh "cd foo && docker build -t risla8/foo:${commitId} ."
	}
      }

      stage('Push') {
	container('docker') {
	  withCredentials([[$class: 'UsernamePasswordMultiBinding',
			    credentialsId: 'dockerhub',
			    usernameVariable: 'DOCKER_HUB_USER',
			    passwordVariable: 'DOCKER_HUB_PASSWORD'
			   ]] {
			    sh "docker push risla8/foo:${commitId}"
			  })
	}

      }

    } catch(Exception e) {
      bitbucketStatusNotify(buildState: 'FAILED')
    }

    bitbucketStatusNotify(buildState: 'SUCCESSFUL')

  }
}