# Cloudq Client

(In Development Mode)

## What is it?

Cloudq is a job queue system that allows you to publish or subscribe to queues
anywhere in the cloud.  

Cloudq_Client is a ruby implementation of the cloudq protocol that makes publishing jobs
and consuming jobs in ruby, very easy.

For more information on the cloudq protocol see [http://cloudq.heroku.com](http://cloudq.heroku.com)

## Requirements

You need a cloudq job server, if you do not have a cloudq job server to connect to, then you 
need to set one up.  If you do have a cloudq server, then for this client to work you need the
following:

* Ruby 1.9
* RubyGems

And the Cloudq Gem depends on the rest-client gem, but it should install when you install the gem.

## Install

    gem install cloudq_client

## How do I publish a job?

    require 'cloudq'
    
    Cloudq::Connection.url = 'http://your.cloudq.server'
    
    # Publish Job to a queue called - awesome
    
    Cloudq::Publish(:awesome).job 'Awesome', :type => 'Sauce'
    


## How do I create a worker?

    require 'cloudq'
    
    Cloudq::Connection.url = 'http://your.cloudq.server'

    # Check Q every 5 seconds
    Cloudq::Worker.new(:awesome).run do
      print '.'
      sleep 5
    end
      

