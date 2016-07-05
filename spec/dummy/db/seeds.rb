user = User.create(email: 'test@test.ru',
                   password: '123'
                  )

block = user.blocks.build(title: 'test')
block.save

card = Card.new(
                original_text: 'house',
                translated_text: 'Дом',
                user_id: user.id,
                block_id: block.id
               )
card.save

admin_user = User.create(
                         email: 'admin@test.org',
                         password: 'admin'
                        )
