describe 'Photo tags' do
  describe 'creating photo with tags' do
    it 'creates photo with tags' do
      tags = [
        Tag.new(name: 'culture'),
        Tag.new(name: 'politics'),
        Tag.new(name: 'economy')
      ]

      photo = Photo.new(title: 'Photo title', tags: tags)
      photo.save!

      expect(photo.reload.tags).to eq(tags)
    end
  end

  describe 'adding new tags to existing photo' do
    it 'adds new tags to existing photo' do
      photo = Photo.create!(title: 'Photo title')

      tags = [
        Tag.create!(name: 'culture'),
        Tag.create!(name: 'politics'),
        Tag.create!(name: 'economy')
      ]

      photo.tags << tags

      expect(photo.reload.tags).to eq(tags)
    end
  end

  describe 'removing tag from photo' do
    it 'removes tag from photo' do
      photo = Photo.create!(title: 'Photo title')

      tags = [
        Tag.create!(name: 'culture'),
        Tag.create!(name: 'politics'),
        Tag.create!(name: 'economy')
      ]

      photo.tags << tags

      photo.tags.delete(tags.first)

      expect(photo.reload.tags).to eq(tags[1..2])
    end
  end
end
