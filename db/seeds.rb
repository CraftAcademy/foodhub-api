
User.delete_all


user = User.create(email: 'user@mail.com', password: 'password', name: 'User_1')
second_user = User.create(email: 'user_2@mail.com', password: 'password', name: 'User_2')
thomas = User.create(email: 'thomas@craftacademy.se', password: 'password', name: 'Thomas')

bigos = Recipe.create(
  title: 'Polish Bigos',
  description: 'The national Polish dish Bigos is also Known as Hunter\'s Stew. There are so many recipes for bigos, it is hard to know what is best. Some bigos recipes add tomato paste, some do not. Some have mushrooms, others don\'t.
  
  One thing is certain: all bigos recipes will have naturally fermented cabbage with just water and sea salt (sauerkraut) and some form of meat--pork, beef, sausage, venison, bacon, or veal. 
  ',
  directions: '
  1.  CARAMELIZE ONIONS & MUSHROOMS WITH BACON.  Place chopped onions in large stock pot with chopped raw bacon on medium heat. COVER. Mix occasionally until the onions start to brown.  Add mushrooms and cook until soft. Do not make the bacon crispy.
  
  2.  ADD MEAT. Add sausage and all meat, mixing and browning.  If you need more fat, add olive oil. You do not want to over cook the meat, just brown on the outside.  If you use good smoked Polish sausage, you do not need to brown very long.
  
  4.  ADD REST OF INGREDIENTS. Put all ingredients together in your large pot, but not the prunes. If there is not enough room, add the cabbage first to reduce it a little. 
  
  5.  SAUTÉ FOR 2 TO 3 HOURS ON LOW.  Cook until you reduce the liquid and it becomes more of a thick stew. Mix every 20 minutes or so and make sure it is not dry. You can add more red wine or broth if needed. Bigos should always be juicy. Taste, but it will not have the flavor until the next day.  But, you can add more paprika or pepper. 
  
  6.  ADD PRUNES.  Mix thoroughly and heat with prunes for another 10 minutes--until soft.  Enjoy with Rye bread (if you can\'t wait), or store in fridge.  Really good with Potato Cheese pierogi too--and Cabbage, Mushroom, and Kraut.',
  ingredients: '4 slices of hickory smoked bacon
  2 yellow onions, chopped
  1 lb Polish Sausage, quartered
  1 lb beef or pork stew meat
  2 cups mushrooms, sliced 
  4-5 large garlic cloves
  3-4 medium carrots, diced
  1.5 lb. drained sauerkraut 
  5 cups cabbage, shredded
  1.5 teaspoons dried marjoram
  1 teaspoon allspice
  1 large bay leaf
  2 tablespoons sweet paprika
  1 teaspoon caraway seeds, crushed
  salt & pepper to taste
  1 cup dry red wine
  4 cups beef stock
  1 cup chopped prunes',
  user: thomas
)

file = URI.open('https://www.corriecooks.com/wp-content/uploads/2018/09/Instant-Pot-Bigos.jpg')

bigos.image.attach(io: file, filename: 'bigos.jpg')