// USAGE
// place the script in Jenkins' init.groovy.d/
// additional information about init.groovy.d usage https://wiki.jenkins.io/display/JENKINS/Post-initialization+script 

// DESCRIPTION:
// This configured thes autorize-project plugin this is needed to run the seed job created by JCasC as an admin.
// The Seed job needs administrative privlidges to run because it uses groovy files to create jobs and the sandbox is STUPID.

// SOURCES:
// Script shamelessly stolen from
// shamelessly borrowed from https://stackoverflow.com/questions/46796161/jenkins-add-project-default-build-authorization-programmatically

import jenkins.*
import jenkins.model.*
import hudson.model.*
import jenkins.model.Jenkins
import org.jenkinsci.plugins.authorizeproject.*
import org.jenkinsci.plugins.authorizeproject.strategy.*
import jenkins.security.QueueItemAuthenticatorConfiguration

def instance = Jenkins.getInstance()

// Define which strategies you want to allow to be set per project
def strategyMap = [
  (instance.getDescriptor(SpecificUsersAuthorizationStrategy.class).getId()): true,
  // (instance.getDescriptor(AnonymousAuthorizationStrategy.class).getId()): true, 
  // (instance.getDescriptor(TriggeringUsersAuthorizationStrategy.class).getId()): true,
  // (instance.getDescriptor(SystemAuthorizationStrategy.class).getId()): false
]

def authenticators = QueueItemAuthenticatorConfiguration.get().getAuthenticators()
def configureProjectAuthenticator = true
for(authenticator in authenticators) {
  if(authenticator instanceof ProjectQueueItemAuthenticator) {
    // only add if it does not already exist
    configureProjectAuthenticator = false
  }
}

if(configureProjectAuthenticator) {
  authenticators.add(new ProjectQueueItemAuthenticator(strategyMap))
}

instance.save()
