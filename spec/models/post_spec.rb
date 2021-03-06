require 'rails_helper'

RSpec.describe Post, type: :model do
  
  xit 'identifies image correctly' do
    client = Aws::Rekognition::Client.new(stub_responses: true)
    client.stub_responses(:detect_labels)
    post = Post.new()
    p post.identify_image('unknown.jpg', client)
    expect(post.identify_image('unknown.jpg', client)).to include "Frog"
  end

  xit 'populates the hashtags correctly' do
    post = Post.new()
    post.populate_hashtags(["Toy", "Wildlife", "Animal", "Frog", "Amphibian"])
    hashtag = Hashtag.first
    expect(hashtag.name).to eq 'Toy'
  end
end

