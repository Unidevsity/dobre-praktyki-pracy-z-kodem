describe 'Photo tags' do
  subject { Photo.new(title: 'Some photo') }

  it_behaves_like 'taggable'
end
