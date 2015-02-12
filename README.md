This is a test setup to send messages to an external RabbitMQ server

Build Messenger Image

	`docker build -t jrlangford/messenger .`
	
To test follow these steps:

Start the rabbitmq server container in the background

	`docker run -d --name jserver jrlangford/rabbitmq`

Wait for a couple of seconds until the server is fully initialised

Start a linked messenger container running a shell

	`docker run -it --name jmessenger --link jserver:jserver jrlangford/messenger bash`

Send a test message from the messenger container
	
	ruby /tmp/send.rb

Verify the broker received the message
	
	From the docker host, access the rabbitmq server container

		`docker exec -it jserver bash`
	
	Get the latest message from the broker

		rabbitmqadmin get queue=hello requeue=false
