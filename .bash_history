export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
gcloud storage ls gs://$PROJECT_ID
gcloud storage cp -r gs://$PROJECT_ID/* ~/
chmod +x ~/guestbook-frontend/mvnw
chmod +x ~/guestbook-service/mvnw
gcloud services enable pubsub.googleapis.com
gcloud pubsub topics create messages
cd ~/guestbook-service
cd ~/guestbook-frontend
./mvnw spring-boot:run -Dspring.profiles.active=cloud
mvn builf
mvn build
./mvnw spring-boot:run -Dspring.profiles.active=cloud
gcloud pubsub subscriptions create messages-subscription-1   --topic=messages
gcloud pubsub subscriptions pull messages-subscription-1
gcloud pubsub subscriptions pull messages-subscription-1 --auto-ack
cd ~
curl https://start.spring.io/starter.tgz   -d type=maven-project   -d dependencies=web,cloud-gcp-pubsub   -d bootVersion=3.2.2   -d javaVersion=11   -d baseDir=message-processor | tar -xzvf -
ls
git init
git config --global init.defaultBranch WADDAD ELEMHDI
