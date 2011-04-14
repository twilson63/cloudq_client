# Cloudq Client

This is the Cloudq Client Gem, it has both the consumer and publisher
modules.

## The Job

The Job is the JSON message that is published to the queue server to be
consumed by a worker.  The queue server can have one to many queues and
you can create one to many workers.  With Cloudq you can have these
workers all over the internet.  The Cloudq server is a rack application
so you can do awesome things with rack middleware to add authentication,
encryption, logging, etc.  All using Rack Middleware.

The job message is simple: (It is a json object )

    { 'job': { 'klass': 'Archive', 'args': [1] }}

Args can be a hash or array.

## The Consumer

The consumer will reserve a job from the queue then perform the job and
delete it from the queue.

### Sample Consumer Worker

    require 'cloudq/consume'
    # You must require the files that have the Job you need to perform

    require 'donut/job'

    Cloudq::Connection.url = 'http://donuts.com'

    loop do
      Cloudq::Consume.job(:make_the_donuts)
      sleep 5
    end 

## The Publisher

The publisher will create a job on the queue, the great thing about the
publisher, is that it does not have to know the klass or the job that
you want your worker to perform.  It just published the job on the
queue.

### Sample Publisher

    require 'cloudq/publish'

    Cloudq::Connection.url = 'http://donuts.com'

    Cloudq::Publish.job(:make_donuts, 
      :job => {
        :klass => 'Bake', 
        :args => { :type => 'glazed' } 
      }
    )


