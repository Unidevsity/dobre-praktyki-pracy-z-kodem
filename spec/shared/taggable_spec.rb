shared_examples 'taggable' do
  describe 'creating model with tags' do
    it 'creates model with tags' do
      tags = [
        Tag.new(name: 'culture'),
        Tag.new(name: 'politics'),
        Tag.new(name: 'economy')
      ]

      subject.tags = tags
      subject.save!

      expect(subject.reload.tags).to eq(tags)
    end
  end

  describe 'adding new tags to existing model' do
    it 'adds new tags to existing model' do
      subject.save!

      tags = [
        Tag.create!(name: 'culture'),
        Tag.create!(name: 'politics'),
        Tag.create!(name: 'economy')
      ]

      subject.tags << tags

      expect(subject.reload.tags).to eq(tags)
    end
  end

  describe 'removing tag from model' do
    it 'removes tag from model' do
      subject.save!

      tags = [
        Tag.create!(name: 'culture'),
        Tag.create!(name: 'politics'),
        Tag.create!(name: 'economy')
      ]

      subject.tags << tags

      subject.tags.delete(tags.first)

      expect(subject.reload.tags).to eq(tags[1..2])
    end
  end
end
