Recipe.destroy_all
User.destroy_all

user = User.create(email: 'user@mail.com', password: 'password', name: 'User_1')
second_user = User.create(email: 'user_2@mail.com', password: 'password', name: 'User_2')
thomas = User.create(email: 'thomas@craftacademy.se', password: 'password', name: 'Thomas')
sverrir = User.create(email: 'sverrir@mail.com', password: 'password', name: 'Sverrir')
clarissa = User.create(email: 'clarissa@mail.com', password: 'password', name: 'Clarissa')
yasmine = User.create(email: 'yasmine@mail.com', password: 'password', name: 'Yasmine')
oliver = User.create(email: 'oliver@mail.com', password: 'password', name: 'Oliver')

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
  user_id: thomas.id
)

file = URI.open('https://www.corriecooks.com/wp-content/uploads/2018/09/Instant-Pot-Bigos.jpg')

bigos.image.attach(io: file, filename: 'bigos.jpg')

cccookies = Recipe.create(
  title: 'Chocolate Chip Brownie Cookies',
  description: 'Chocolate Chip Brownie Cookies-soft and chewy chocolate chip cookies with fudgy brownie chunks inside!',
  ingredients: '3 cups all-purpose flour
  1 1/2 teaspoons baking powder
  1 teaspoon baking soda
  1 teaspoon sea salt
  1 cup unsalted butter at room temperature
  1/2 cup granulated sugar
  1 1/2 cups light brown sugar
  2 large eggs
  2 teaspoons vanilla extract
  1 1/2 cups brownie chunks
  1 1/2 cups chocolate chips
  Extra sea salt for sprinkling on cookies if desired',
  directions: '
    1. Preheat oven to 350 degrees F. Line a large baking sheet with a Silpat baking mat or parchment paper and set aside.

    2. In a medium bowl, whisk together flour, baking powder, baking soda, and salt. Set aside.

    3. Using a stand mixer, cream butter and sugars together for about 3 minutes. Add in the eggs and vanilla and mix until combined. With the mixer on low, slowly add in the dry ingredients. Stir in the brownie chunks and chocolate chips.

    4. Form the cookie dough into balls, about 2 tablespoons of dough per cookie. Place on prepared baking sheet, about 2 inches apart. Sprinkle with sea salt, if desired. Bake cookies fhttps://images.pexels.com/photos/2161638/pexels-photo-2161638.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260or 10-12 minutes or until the edges are slightly golden brown. Remove from oven and let cookies cool on the baking sheet for 2-3 minutes. Transfer to a wire cooling rack and cool completely.

    5. After the brownies cool, chop them into small chunks for the cookies. You can also keep the brownies in the freezer. Defrost brownies before using in the cookies. The cookies will keep in an airtight container for 3-4 days. You can also freeze the cookies!',
  user_id: yasmine.id
)

file2 = URI.open('https://images.pexels.com/photos/2377477/pexels-photo-2377477.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260')

cccookies.image.attach(io: file2, filename: 'cccookie.jpeg')


gcsandwich = Recipe.create(
  title: 'The Classic Grilled Cheese',
  description: 'The amazing combination of cheese, butter, bread, and a hot pan. So simple, so glorious!',
  ingredients: '
  2 slices of french bread
  ½ cup of shredded cheddar cheese
  butter',
  directions: '
    1. Get a pan on medium heat.

    2. Butter each side of your bread.

    3. Place cheese on the bottom slice and form sandwich.

    4. Place in pan and fry until golden brown on each side.',
    user_id: clarissa.id
)

file3 = URI.open('https://image.businessinsider.com/5ad50664146e712b008b4ac2?width=1100&format=jpeg&auto=webp')

gcsandwich.image.attach(io: file3, filename: 'gcsandwich.jpeg')

roastturkey = Recipe.create(
  title: 'Roast Turkey',
  description: 'The biggest myth in all of American cookery is the belief that a juicy, perfectly cooked turkey is difficult for the novice cook to achieve. One of the secrets to a moist, delicious, and beautiful turkey is spreading butter under the skin. You can season the butter any way you want; the possibilities are endless.',
  ingredients: '
    2 tablespoons kosher salt
    1 tablespoon ground black pepper
    1 tablespoon poultry seasoning
    1 (12 pound) whole turkey, neck and giblets reserved
    2 onions, coarsely chopped
    3 ribs celery, coarsely chopped
    2 carrots, coarsely chopped
    3 sprigs fresh rosemary
    1/2 bunch fresh sage
    1/2 cup butter1 bay leaf
    6 cups water
    2 tablespoons turkey fat
    1 tablespoon butter
    1/4 cup all-purpose flour
    3 cups turkey pan drippings
    1/4 teaspoon balsamic vinegar (optional)
    1 tablespoon chopped fresh sage
    salt and ground black pepper to taste',
  directions: '
    1. Preheat oven to 325 degrees F (165 degrees C).

    2. Mix 2 tablespoons salt, and 1 tablespoon pepper, and poultry seasoning in a small bowl. Tuck turkey wings under the bird, and season cavity with about 1 tablespoon of the poultry seasoning mixture. Reserve remaining poultry seasoning mix.
    
    3. Toss the onion, celery, and carrots together in a bowl. Stuff about 1/2 cup of the vegetable mixture, rosemary sprigs, and 1/2 bunch sage into the cavity of the turkey. Tie legs together with kitchen string. Loosen the skin on top of the turkey breast using fingers or a small spatula. Place about 2 tablespoons butter under the skin and spread evenly. Spread the remaining butter (about 2 tablespoons) all over the outside of the skin. Sprinkle the outside of the turkey with the remaining poultry seasoning mix.
    
    4. Spread the remaining onion, celery, and carrots into a large roasting pan. Place the turkey on top of the vegetables. Fill the pan with about 1/2 inch of water. Arrange a sheet of aluminum foil over the breast of the turkey.
    
    5. Roast the turkey in the preheated oven until no longer pink at the bone and the juices run clear, about 3 1/2 hours. An instant-read thermometer inserted into the thickest part of the thigh, near the bone should read 165 degrees F (75 degrees C). Remove the foil during the last hour of cooking. Baste the turkey with the pan juices.
    
    6. While the turkey is roasting, make stock: place neck, heart, and gizzards in a saucepan with the bay leaf and water. Simmer over medium heat for 2 hours. Strain the turkey giblets from the stock, and discard giblets. There should be at least 4 cups of stock. 
    
    7. Remove the turkey from the oven, cover with a doubled sheet of aluminum foil, and allow to rest in a warm area for 10 to 15 minutes before slicing. Pour the pan juices, about 3 cups, into a saucepan and set aside. Skim off the turkey fat from the pan juices, reserving about 2 tablespoons.
    
    8. Heat 2 tablespoons of the turkey fat and 1 tablespoon butter in a saucepan over medium heat. Transfer the onion from the roasting pan into the skillet. Cook and stir until the onion is browned, about 5 minutes, then stir in the flour. Continue to cook and stir for about 5 minutes more; whisk in 4 cups of the skimmed turkey stock and the reserved pan juices until smooth; skim off any foam. Stir in the balsamic vinegar. Simmer until the gravy is thickened, whisking constantly, about 10 minutes. Stir in 1 tablespoon of chopped sage, and season to taste with salt and black pepper.',
    user_id: yasmine.id
)

file4 = URI.open('https://images.pexels.com/photos/2673353/pexels-photo-2673353.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

roastturkey.image.attach(io: file4, filename: 'roastturkey.jpeg')

pumpkinwaffles = Recipe.create(
  title: 'Pumpkin Waffles with Apple Cider Syrup',
  description: 'A fall, winter and special occasion family favorite, these are fairly easy to make and delicious! They are sure to please even picky eaters.',
  ingredients: '
    2 1/2 cups all-purpose flour
    4 teaspoons baking powder
    2 teaspoons ground cinnamon
    1 teaspoon ground allspice
    1 teaspoon ground ginger
    1/2 teaspoon salt
    1/4 cup packed brown sugar
    1 cup canned pumpkin
    2 cups milk
    4 eggs, separated
    1/4 cup butter, melted
    
    APPLE CIDER SYRUP
    1/2 cup white sugar
    1 tablespoon cornstarch
    1 teaspoon ground cinnamon
    1 cup apple cider
    1 tablespoon lemon juice
    2 tablespoons butter',
  directions: '
    1. Preheat a waffle iron according to manufacturer\'s instructions.

    2. Combine the flour, baking powder, cinnamon, allspice, ginger, salt, and brown sugar in a mixing bowl. In a separate bowl, stir together the pumpkin, milk, and egg yolks. Whip the egg whites in a clean dry bowl until soft peaks form.

    3. Stir the flour mixture and 1/4 cup melted butter to the pumpkin mixture, stirring just to combine. Use a whisk or rubber spatula to fold 1/3 of the egg whites into the batter, stirring gently until incorporated. Fold in the remaining egg whites. Cook waffles according to manufacturer\'s instructions.

    4. To make the syrup, stir together the sugar, cornstarch, and cinnamon in a saucepan. Stir in the apple cider and lemon juice. Cook over medium heat until mixture begins to boil; boil until the syrup thickens. Remove from heat and stir in the 2 tablespoons of butter until melted. Serve warm.',
    user_id: sverrir.id
)

file5 = URI.open('https://images.pexels.com/photos/2074108/pexels-photo-2074108.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

pumpkinwaffles.image.attach(io: file5, filename: 'pumpkinwaffles.jpeg')

pigeon = Recipe.create(
  title: 'Slow-cooked pigeon',
  description: 'This is one of Luis Gallego\'s favourite pigeon recipes.',
  ingredients: '
    2 small onions
    2 carrots
    2 cloves of garlic
    4 pigeons
    4 sprigs of fresh flat-leaf parsley
    8 tablespoons olive oil
    2 tablespoons plain flour
    250 ml dry white wine
    750 ml organic chicken stock',
  directions: '
    1. Peel and chop the onions, carrots and garlic, halve the pigeons, then pick and finely chop the parsley.

    2. Heat the oil in a casserole dish over a medium heat, then sauté the onion, carrot and garlic until softened. Add the pigeon and brown for 3 to 5 minutes. Sprinkle the flour in and stir well.

    3. Add the wine and stock, season generously, then increase the heat and bring to the boil. Lower the heat, stir in the parsley, then simmer with the lid on for 4 hours. Check on it now and again, adding an extra splash of water, if needed.

    4. When the pigeon is nearly ready, use a fork to shred the meat off the bone - it should fall off easily. Serve with potatoes or crusty bread - be careful of the bones!',
    user_id: clarissa.id
)

file6 = URI.open('https://images.pexels.com/photos/2532442/pexels-photo-2532442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

pigeon.image.attach(io: file6, filename: 'pigeon.jpeg')

carbonara = Recipe.create(
  title: 'Carbonara',
  description: 'Carbonara is an Italian pasta dish from Rome',
  ingredients: '
    egg
    hard cheese
    guanciale
    and black pepper',
  directions: '
    1. The pasta is cooked in moderately salted boiling water. 

    2. The guanciale is briefly fried in a pan in its own fat. A mixture of raw eggs (or yolks) grated Pecorino (or a mixture with Parmesan) and a good amount of ground black pepper is combined with the hot pasta either in the pasta pot or in a serving dish but away from direct heat to avoid curdling the egg. 

    3. The fried guanciale is then added and the mixture is tossed creating a rich creamy sauce with bits of meat spread throughout.
    
    4. Although various shapes of pasta can be used the raw egg can only cook properly with a shape that has a sufficiently large ratio of surface area to volume such as the long thin types fettucine linguine or spaghetti.',
    user_id: yasmine.id
)

file7 = URI.open('https://images.pexels.com/photos/1435898/pexels-photo-1435898.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

carbonara.image.attach(io: file7, filename: 'carbonara.jpeg')

suya = Recipe.create(
  title: 'Suya Goat Kebabs',
  description: 'Suya is a popular West African streetfood snack known in Ghana as chichinga! Cool name, right? Suya can be described as both a groundnut spice rub (tankora) and a style of cooking grilled skewered meat - put simply, it is Ghanaian shish kebab.',
  ingredients: '
    450 g higher-welfare boneless leg of kid goat , diced
    1 large red onion
    1-2 red, green or yellow peppers (mixed colours if possible)
    groundnut or vegetable oil
    a few sprigs of fresh coriander
    SPICE RUB
    125 g roasted peanuts
    3 cloves of garlic
    5cm piece of ginger
    1 teaspoon cayenne pepper or red chilli flakes (for extra heat)
    1 teaspoon smoked paprika
    2 tablespoons groundnut or vegetable oil',
  directions: '
    1. Use a pestle and mortar to grind the peanuts, keeping them fairly coarse. Reserving a small handful to serve, place the nuts in a large bowl.

    2. Peel and grate in the garlic and ginger (keep the ginger skin on if organic), then stir in the remaining spice rub ingredients along with 1 pinch of sea salt and 1 teaspoon of coarse black pepper.

    3. Add the diced goat and massage the rub thoroughly into the meat. Peel and quarter the red onion, then deseed and cut the peppers into chunks.

    4. Thread the onion, peppers and goat onto your skewers. As ever, the longer you can leave your meat to marinate the better it will be, so if you have time, leave the skewers in the fridge for at least 1 to 2 hours, or preferably overnight.

    5. Take the skewers out of the fridge and sit at room temperature for a few minutes while you get the grill or griddle pan hot.

    6. Baste the meat with a little oil, sea salt and black pepper before putting it under the grill or on the griddle - it should sizzle but do not move it! Turn only every 2 minutes, until each side is seared through (for medium-rare) or every 3 minutes on each side for well done.

    7. Allow to rest for 2 minutes, then scatter over the reserved peanuts and a small pinch of chilli powder. Tear over the coriander leaves, then serve with a fresh seasonal salad. Boom! Summer spice in your mouth!',
    user_id: sverrir.id
)

file8 = URI.open('https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

suya.image.attach(io: file8, filename: 'suya.jpeg')

fruitcake = Recipe.create(
  title: 'Passion Fruit Cake',
  description: 'A fruity and fresh cake perfect for celebrations',
  ingredients: '
    15 digestive cookies
    1 decilitre of sugar
    50 grams of melted butter
    1 teaspoon of cinnamon
    4 eggs
    400 grams of smooth cheese
    1 lemon
    3 passionfruits250 grams of blueberries
    150 grams of raspberries',
  directions: '
    1. Preheat oven to 250 degrees celcius 
    
    2. Crush the cookies and mix with the melted butter
    
    3. Mix the rest of the ingredients and pour onto the crushed cookies 
    
    4. Cook for 20 minutes 
    
    5. Decorate with berries, best eaten cooled down',
    user_id: clarissa.id
)

file9 = URI.open('https://images.pexels.com/photos/221068/pexels-photo-221068.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

fruitcake.image.attach(io: file9, filename: 'fruitcake.jpeg')

mash = Recipe.create(
  title: 'Perfect Mashed Potatoes',
  description: 'This recipe will hopefully give you the proper techniques to turn out perfect mashed potatoes every time; always light, fluffy and lump-free.',
  ingredients: '
    3 large russet potatoes, peeled and cut in half lengthwise
    1/4 cup butter
    1/2 cup whole milk
    salt and ground black pepper to taste',
  directions: '
    1. Preheat oven to 325 degrees F (165 degrees C).

    2. Place the potatoes into a large pot, and cover with salted water. Bring to a boil, reduce heat to medium-low, cover, and simmer until tender, 20 to 25 minutes. Drain, and return the potatoes to the pot. Turn heat to high, and allow the potatoes to dry for about 30 seconds. Turn off the heat.

    3. Mash the potatoes with a potato masher twice around the pot, then add the butter and milk. Continue to mash until smooth and fluffy. Whisk in the salt and black pepper until evenly distributed, about 15 seconds.',
    user_id: sverrir.id
)

file10 = URI.open('https://images.pexels.com/photos/221068/pexels-photo-221068.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

mash.image.attach(io: file10, filename: 'mash.jpeg')

spicy = Recipe.create(
  title: 'Spicy Chicken',
  description: 'Mix it up in a pot, make spicy!',
  ingredients: '
    4 skinless chicken breasts, cut into bite-sized pieces
    1 tbsp Cajun seasoning
    1 tbsp Ghostpepper sauce
    100g quinoa
    600ml hot chicken stock
    100g dried apricots, sliced
    ½ x 250g pouch ready-to-use Puy lentils
    1 tbsp olive oil
    2 red onions, cut into thin wedges
    1 bunch spring onions, chopped
    small bunch coriander, chopped',
  directions: '
    1. Heat oven to 200C/180C fan/gas 6. Toss the chicken with the Cajun spice and sauce, arrange in a single layer in a roasting tin. Bake for 20 mins until the chicken is cooked. Set aside.
    
    2. Meanwhile, cook the quinoa in the chicken stock for 15 mins until tender, adding the apricots and lentils for the final 5 mins. Drain and place into a large bowl with the chicken, toss together.
    
    3. While the quinoa is cooking, heat the oil in a large frying pan and soften the onions for 10-15 mins. Toss the onions into the quinoa with the coriander and some seasoning, then mix well.',
    user_id: clarissa.id
)

file11 = URI.open('https://images.pexels.com/photos/221068/pexels-photo-221068.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

spicy.image.attach(io: file11, filename: 'mash.jpeg')

milkshake = Recipe.create(
  title: 'Summer strawberry milkshake',
  description: 'This amazing smoothie recipe was given to me from my best friend Sophia!',
  ingredients: '
    250 grams of strawberries
    1 decilitre of whole fat milk
    1 scoop of whole cream iced cream',
  directions: '
   1. Mix all ingredients together in your mixer
   
   2. Add some brown sugar or extra ice cream for extra yumminess!',
   user_id: clarissa.id
)

file12 = URI.open('https://images.pexels.com/photos/845552/pexels-photo-845552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

milkshake.image.attach(io: file12, filename: 'milkshake.jpeg')

daiquiri = Recipe.create(
  title: 'Dry passion fruit daiquiri',
  description: 'It is good',
  ingredients: '
    caster sugar
    50 ml Bacardi Superior rum
    1 lime
    10 ml Campari
    1 passion fruit , plus extra to serve',
  directions: '
    1. Make a simple sugar syrup, by heating 1 part sugar to 2 parts water in a pan over a medium heat. 
    
    2. Allow the sugar to dissolve.
    
    3. Place 20ml of the syrup into a cocktail shaker with the rum, 20ml of lime juice, the Campari and the pulp from 1 passion fruit.
    
    4. Shake hard and strain into a martini glass.
    
    5. Garnish with a slice of passion fruit and serve.',
    user_id: yasmine.id
)

file13 = URI.open('https://images.pexels.com/photos/1337824/pexels-photo-1337824.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

daiquiri.image.attach(io: file13, filename: 'daiquiri.jpeg')