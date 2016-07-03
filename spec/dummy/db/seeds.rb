user = User.create(email: 'test@test.ru',
                  password: '123')

block = user.blocks.build(title: 'test')
block.save

card = Card.new(original_text: 'house',
                 translated_text: 'Дом',
                 user_id: user.id, block_id: block.id)
  card.save

# doc.xpath('//table/tbody/tr').each do |row|
#   original = row.search('td[2]')[0].content.downcase
#   translated = row.search('td[4]')[0].content.downcase
#   card = Card.new(original_text: original,
#                  translated_text: translated,
#                  user_id: user.id, block_id: block.id)
#   card.save
# end

admin_user = User.create(email: 'admin@test.org',
                        password: 'admin')
