describe 'Post tags' do
  subject { Post.new(title: 'New post') }

  it_behaves_like 'taggable'
end
