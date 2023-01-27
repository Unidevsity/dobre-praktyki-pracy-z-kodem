describe 'Post tags' do

  describe 'creating post with tags' do
    it 'creates post with tags' do
      tags = [
        Tag.new(name: 'culture'),
        Tag.new(name: 'politics'),
        Tag.new(name: 'economy')
      ]

      post = Post.new(title: 'Post title', tags: tags)
      post.save!

      expect(post.reload.tags).to eq(tags)
    end
  end

  describe 'adding new tags to existing post' do
    it 'adds new tags to existing post' do
      post = Post.create!(title: 'Post title')

      tags = [
        Tag.create!(name: 'culture'),
        Tag.create!(name: 'politics'),
        Tag.create!(name: 'economy')
      ]

      post.tags << tags

      expect(post.reload.tags).to eq(tags)
    end
  end

  describe 'removing tag from post' do
    it 'removes tag from post' do
      post = Post.create!(title: 'Post title')

      tags = [
        Tag.create!(name: 'culture'),
        Tag.create!(name: 'politics'),
        Tag.create!(name: 'economy')
      ]

      post.tags << tags

      post.tags.delete(tags.first)

      expect(post.reload.tags).to eq(tags[1..2])
    end

  end

end
