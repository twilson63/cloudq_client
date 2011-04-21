$:.unshift File.join(File.dirname(__FILE__), '..','lib')

require 'cloudq'

# gem install faker

require 'faker'
Cloudq::Connection.url = 'http://cloudq.heroku.com'

20.times do
Cloudq::Publish.new(:archive).job 'Archive',
  :customer => {
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :address => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.us_state_abbr,
    :zip_code => Faker::Address.zip_code,
    :details => {
      :one => Faker::Lorem.paragraphs(3),
      :two => Faker::Lorem.paragraphs(5)
    },
    :details2 => {
      :one => Faker::Lorem.paragraphs(3),
      :two => Faker::Lorem.paragraphs(5)
    },
    :details3 => {
      :one => Faker::Lorem.paragraphs(3),
      :two => Faker::Lorem.paragraphs(5)
    },
    :details4 => {
      :one => Faker::Lorem.paragraphs(3),
      :two => Faker::Lorem.paragraphs(5)
    },
    :details5 => {
      :one => Faker::Lorem.paragraphs(3),
      :two => Faker::Lorem.paragraphs(5)
    }




  }
  puts "Sent Item"
end

