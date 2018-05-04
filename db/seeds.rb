# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroying base
puts 'Destroying base'
Answer.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('answers')
Questionnaire.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('questionnaires')
Challenge.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('challenges')
Option.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('options')
Question.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('questions')
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
puts 'All base new'

# Categories
puts 'Creating categories...'
Category.create(id: 1, name: 'Water use', min_value: -70, max_value: 270)
Category.create(id: 2, name: 'Food', min_value: 130, max_value: 920)
Category.create(id: 3, name: 'Energy use', min_value: -195, max_value: 710)
Category.create(id: 4, name: 'Transportation', min_value: 0, max_value: 1300)
Category.create(id: 5, name: 'Waste', min_value: -180, max_value: 505)
Category.create(id: 6, name: 'Shelter', min_value: -100, max_value: 650)
Category.create(id: 7, name: 'Clothing', min_value: -65, max_value: 545)
puts 'Categories created'

# Questions
puts 'Creating questions...'
# Water use
puts 'Water use...'

q = Question.create(category_id: 1, question:'My shower (or bath) on a typical day is')
q.options.create(option: 'No shower/bath', value: 0)
q.options.create(option: 'Short shower 3-4 times a week', value: 25)
q.options.create(option: 'Short shower once a day', value: 50)
q.options.create(option: 'Long shower once a day', value: 70)
q.options.create(option: 'More than one shower a day', value: 90)

q = Question.create(category_id: 1, question:'I flush the toilet')
q.options.create(option: 'Every time I use it', value: 40)
q.options.create(option: 'Sometimes', value: 20)

q = Question.create(category_id: 1, question:'When I brush my teeth')
q.options.create(option: 'I let the water run', value: 40)
q.options.create(option: 'I don\'t let the water run', value: 0)

q = Question.create(category_id: 1, question:'We use water-saving toilets')
q.options.create(option: 'Yes', value: -20)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 1, question:'We use low-flow showerheads')
q.options.create(option: 'Yes', value: -20)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 1, question:'I have a dishwasher')
q.options.create(option: 'Yes', value: 100)
q.options.create(option: 'No', value: -50)

puts 'Created for Water use'

# Food
puts 'Food...'

q = Question.create(category_id: 2, question: 'On a typical day, I eat')
q.options.create(option: 'Meat more than once per day', value: 600)
q.options.create(option: 'Meat once per day', value: 400)
q.options.create(option: 'Meat a couple times a week', value: 300)
q.options.create(option: 'Vegetarian', value: 200)
q.options.create(option: 'Vegan', value: 150)
q.options.create(option: 'All', value: 0)

q = Question.create(category_id: 2, question: 'What percentage of your food is grown locally or is organic?')
q.options.create(option: 'About 70%', value: 15)
q.options.create(option: 'About 50%', value: 30)
q.options.create(option: 'About 30%', value: 45)
q.options.create(option: 'Almost none', value: 60)

q = Question.create(category_id: 2, question: 'I compost my fruit/veg. scraps and peels')
q.options.create(option: 'Yes', value: -20)
q.options.create(option: 'No', value: 60)

q = Question.create(category_id: 2, question: 'What percentage of your food is not grown locally or is processed?')
q.options.create(option: 'All', value: 100)
q.options.create(option: 'About 70%', value: 60)
q.options.create(option: 'About 50%', value: 30)
q.options.create(option: 'About 30%', value: 20)
q.options.create(option: 'Almost none', value: 0)

q = Question.create(category_id: 2, question: 'On a typical day, I waste')
q.options.create(option: 'None of my food', value: 0)
q.options.create(option: 'One-Fourth of my food', value: 25)
q.options.create(option: 'One-Third of my food', value: 50)
q.options.create(option: 'Half of my food', value: 100)

puts 'Created for Food'

puts 'Energy...'

q = Question.create(category_id: 3, question: 'How ofter do you use your heater/cooler at home?')
q.options.create(option: 'Never', value: -20)
q.options.create(option: 'Sometimes', value: 50)
q.options.create(option: 'Often', value: 100)
q.options.create(option: 'Always', value: 150)

q = Question.create(category_id: 3, question: 'We dry clothes outdoors or on an indoor rack')
q.options.create(option: 'Always', value: -50)
q.options.create(option: 'Sometimes', value: 20)
q.options.create(option: 'Never', value: 60)

q = Question.create(category_id: 3, question: 'We use an energy-efficient refrigerator')
q.options.create(option: 'Yes', value: -50)
q.options.create(option: 'No', value: 50)

q = Question.create(category_id: 3, question: 'We have a second refrigerator/freezer')
q.options.create(option: 'Yes', value: 100)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 3, question: 'We use 5 or more compact fluorescent or LED light bulbs')
q.options.create(option: 'Yes', value: -50)
q.options.create(option: 'No', value: 100)

q = Question.create(category_id: 3, question: 'I turn off lights, computer, and television when they’re not in use')
q.options.create(option: 'Yes', value: 0)
q.options.create(option: 'No', value: 50)

q = Question.create(category_id: 3, question: 'To cool off, I use')
q.options.create(option: 'Air conditioning: car', value: 50)
q.options.create(option: 'Air conditioning: home', value: 100)
q.options.create(option: 'Electric fan', value: -10)
q.options.create(option: 'Nothing', value: -50)

q = Question.create(category_id: 3, question: 'My clothes washer is')
q.options.create(option: 'Top load', value: 100)
q.options.create(option: 'Front load', value: 50)
q.options.create(option: 'Laundromat', value: 25)

puts 'Created for Energy'

puts 'Transportation...'

q = Question.create(category_id: 4, question: 'On a typical day, I travel to work by')
q.options.create(option: 'Foot or bike', value: 0)
q.options.create(option: 'Public transit', value: 30)
q.options.create(option: 'Private vehicle; carpool', value: 100)
q.options.create(option: 'Private vehicle; alone', value: 200)

q = Question.create(category_id: 4, question: 'The time I spend in vehicles on a typical day is')
q.options.create(option: 'No time ', value: 0)
q.options.create(option: 'Less than half an hour', value: 40)
q.options.create(option: 'Half an hour to an hour', value: 100)
q.options.create(option: 'More than one hour', value: 200)

q = Question.create(category_id: 4, question: 'How big is the car in which I travel on a typical day')
q.options.create(option: 'No car', value: 0)
q.options.create(option: 'Motorcycle', value: 100)
q.options.create(option: 'Small', value: 200)
q.options.create(option: 'Medium', value: 300)
q.options.create(option: 'SUV', value: 400)

q = Question.create(category_id: 4, question: 'Number of National flights I take per year')
q.options.create(option: 'No flights', value: 0)
q.options.create(option: 'One flight', value: 50)
q.options.create(option: 'Two flights ', value: 100)
q.options.create(option: 'More than two flights', value: 200)

q = Question.create(category_id: 4, question: 'Number of international flights I take per year')
q.options.create(option: 'No flights', value: 0)
q.options.create(option: 'One flight', value: 100)
q.options.create(option: 'Two flights ', value: 200)
q.options.create(option: 'More than two flights', value: 300)

puts 'Created for Transportation'

puts 'Waste...'

q = Question.create(category_id: 5, question: 'All my garbage from today could fit into a')
q.options.create(option: 'Shoebox', value: 20)
q.options.create(option: 'Small garbage can', value: 60)
q.options.create(option: 'Kitchen garbage can', value: 200)
q.options.create(option: 'No garbage created today!', value: -50)

q = Question.create(category_id: 5, question: 'From the following categories I recycle: paper, carboard, metal, glass')
q.options.create(option: 'At least one', value: -35)
q.options.create(option: 'Two to three', value: -50)
q.options.create(option: 'All four', value: -80)

q = Question.create(category_id: 5, question: 'I reuse items rather than throw them out')
q.options.create(option: 'Yes', value: -20)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 5, question: 'I repair items rather than throw things out')
q.options.create(option: 'Yes', value: -20)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 5, question: 'I avoid disposable items as often as possible')
q.options.create(option: 'Yes', value: -50)
q.options.create(option: 'No', value: 60)

q = Question.create(category_id: 5, question: 'I use rechargeable batteries whenever I can')
q.options.create(option: 'Yes', value: -30)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 5, question: 'In my home we have X number of electronics: (TV, Stereo, VCR, Blue-ray, Play station, Tablet, Kindle, etc)')
q.options.create(option: '0-5 ', value: 25)
q.options.create(option: '5-10', value: 75)
q.options.create(option: '10-15', value: 100)
q.options.create(option: 'More than 15', value: 200)
q.options.create(option: 'None ', value: 0)

q = Question.create(category_id: 5, question: 'How many of your typical activities are dependent upon electronic devices')
q.options.create(option: 'Very little ', value: 20)
q.options.create(option: 'Some ', value: 60)
q.options.create(option: 'A lot ', value: 80)

puts 'Created for Waste'

puts 'Shelter...'

q = Question.create(category_id: 6, question: 'My home is')
q.options.create(option: 'Single house on large lot (suburbia)', value: 50)
q.options.create(option: 'Single house on small lot (city)', value: 20)
q.options.create(option: 'Townhouse/attached house', value: 0)
q.options.create(option: 'Apartment/building', value: -20)

q = Question.create(category_id: 6, question: 'Divide number of rooms per person, no baths, by the number of people living at home')
q.options.create(option: '1 room per person or less', value: -50)
q.options.create(option: '1-2 rooms per person ', value: 0)
q.options.create(option: '2-3 rooms per person', value: 100)
q.options.create(option: 'More than 3 rooms per person', value: 200)

q = Question.create(category_id: 6, question: 'We own a second, or vacation home that is often empty')
q.options.create(option: 'Yes', value: 400)
q.options.create(option: 'We own/use it with others', value: 200)
q.options.create(option: 'No', value: 0)

puts 'Created for Shelter'

puts 'Clothing...'

q = Question.create(category_id: 7, question: 'I change my outfit every day and put it in the laundry')
q.options.create(option: 'Yes', value: 80)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 7, question: 'I am wearing clothes that have been mended or fixed')
q.options.create(option: 'Yes', value: -20)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 7, question: 'One-fourth of my clothes are handmade or secondhand')
q.options.create(option: 'Yes', value: -20)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 7, question: 'Most of my clothes are purchased new each year')
q.options.create(option: 'Yes', value: 200)
q.options.create(option: 'No', value: 0)

q = Question.create(category_id: 7, question: 'I give the local thrift stores clothes that I no longer wear')
q.options.create(option: 'Yes', value: -50)
q.options.create(option: 'No', value: 100)

q = Question.create(category_id: 7, question: 'I never wear X percent of the clothes in my closet')
q.options.create(option: 'Less than 25%', value: 25)
q.options.create(option: '50%', value: 50)
q.options.create(option: '75%', value: 75)

q = Question.create(category_id: 7, question: 'I buy X new pairs of shoes every year')
q.options.create(option: '0-1', value: 0)
q.options.create(option: '2 to 3', value: 20)
q.options.create(option: '4 to 6 ', value: 60)
q.options.create(option: '7 or more ', value: 90)

puts 'Created for Clothing'

puts 'Questions created'

# Challenges
puts 'Creating challenges...'

Challenge.create(category_id: 1, challenge: "Shower in five minutes or less. Take shorter showers. A typical shower head spits out an average of 2.5 gallons per minute. Reducing your shower time by 4 minutes per day may save 3650 gallons annually if you shower once a day.")
Challenge.create(category_id: 1, challenge: "Shower only six days in a week. Take shorter showers. A typical shower head spits out an average of 2.5 gallons per minute. Reducing your shower time by 4 minutes per day may save 3650 gallons annually if you shower once a day.")
Challenge.create(category_id: 1, challenge: "Turn off the tab everytime you brush your theeth.")
Challenge.create(category_id: 1, challenge: "Bucket challege! Everytime you shower this week, before you let the water to warn-up, stick a bucket under the running tap until you’re ready to get in. Keep the bucket after you shower and use the collected water for other purposes like brushing your teeth or washing the dishes.")
Challenge.create(category_id: 1, challenge: "Collect rainwater! You can do so with common buckets or gutters and also even by creating a rainbarrel yourself")
Challenge.create(category_id: 1, challenge: "Replace your current soap with an eco-friendly soap")
Challenge.create(category_id: 1, challenge: "Create a rain garden on your house or a close friend/family propierty")
Challenge.create(category_id: 1, challenge: "Read about https://learn.eartheasy.com/articles/plastics-by-the-numbers/ and acumulate all plastics that you use for a week and at the end of the week analize which ones are recliclable and which ones are not. Publish the number of non-recyclable vs recliclable objects you consumed during the week on the Slack channel to share with others")
Challenge.create(category_id: 1, challenge: "Pasta Challenge! Next time you’re making a pot of pasta, don’t dump all of that precious water down the drain! Instead, set your colander over another large pot to collect all of that precious H2O. Once the water has cooled, you can use it on your garden or to water your house plants.")
Challenge.create(category_id: 1, challenge: "Vegies Challenge! washing veggies uses water that’s totally re-usable. Place your colander over a large pot to collect the water while you’re washing. You can use your collected water on the garden or for flushing the toilet.")
Challenge.create(category_id: 1, challenge: "Got an almost-empty water glass that’s been sitting out too long to drink? Feed it to a thirsty house plant instead! You can also use unsweet tea on your plants. If the drink that’s been sitting is sweetened, you can pour it on plants in the garden, but don’t use it on house plants unless you like ants!")
Challenge.create(category_id: 1, challenge: "Try to take at least two cold showers per week")
Challenge.create(category_id: 1, challenge: "If you have a bathtube don't use it for the next month")
Challenge.create(category_id: 1, challenge: "If you have a dryer machine, stop using it for at least two weeks")
Challenge.create(category_id: 1, challenge: "Wash your car/motorcycle/bike with buckets of water!")
Challenge.create(category_id: 1, challenge: "Recicle the water that you use on cleaning dishes to clean the bathroom")
Challenge.create(category_id: 1, challenge: "Collect in a bucket the water that you used for washing your hands and use it for watering plants, the toilet or clean the bathroom.")
Challenge.create(category_id: 2, challenge: "Invest at least 30 percent of your budget for food on organic and locally grown foods.")
Challenge.create(category_id: 2, challenge: "Decrease the number of  processed foods you eat this week to 5 meals (If a meal contains at least one processed item it count as processed)")
Challenge.create(category_id: 2, challenge: "Start a garden for your own consumption and have at least two new plants that you will use when cooking")
Challenge.create(category_id: 2, challenge: "Don't eat meat at least one day this week.")
Challenge.create(category_id: 2, challenge: "Don't eat meat at least two days of the week.")
Challenge.create(category_id: 2, challenge: "Don't eat meat at least three days of the week.")
Challenge.create(category_id: 2, challenge: "Monitor what you throw away. Designate a week in which you write down everything you throw out on a regular basis. Tossing half a loaf of bread each week? Maybe it’s time to start freezing half that loaf the moment you buy it so it doesn’t go stale before you’re able to eat it.")
Challenge.create(category_id: 2, challenge: "Take stock. Note upcoming expiration dates on foods you already have at home, and plan meals around the products that are closest to their expiration. On a similar note, keep a list of what’s in the freezer and when each item was frozen. Place this on the freezer door for easy reference and use items before they pass their prime.")
Challenge.create(category_id: 2, challenge: "Groseries with no packaging (zero waste store)")
Challenge.create(category_id: 2, challenge: "Cook at home at least one meal and use it all. When cooking, use every piece of whatever food you’re cooking with, whenever possible. For example, leave the skin on cucumbers and potatoes, sauté broccoli stems along with the florets (they taste good too; we promise!), and so on. Bonus: Skins and stems often have provide additional nutrients for our bodies.")
Challenge.create(category_id: 2, challenge: "Designate one dinner each week as a “use-it-up” meal. Instead of cooking a new meal, look around in the cupboards and fridge for leftovers and other food that might otherwise get overlooked.")
Challenge.create(category_id: 2, challenge: "Practice FIFO. It stands for First In, First Out. When unpacking groceries, move older products to the front of the fridge/freezer/pantry and put new products in the back. This way, you’re more likely to use up the older stuff before it expires.")
Challenge.create(category_id: 2, challenge: "Cook at home at least two meals and use it all. When cooking, use every piece of whatever food you’re cooking with, whenever possible. For example, leave the skin on cucumbers and potatoes, sauté broccoli stems along with the florets (they taste good too; we promise!), and so on. Bonus: Skins and stems often have provide additional nutrients for our bodies.")
Challenge.create(category_id: 2, challenge: "Store better. If you regularly throw away stale chips/cereal/crackers/etc., try storing them in airtight containers — this should help them keep longer (or, of course, just buy fewer of these products).")
Challenge.create(category_id: 2, challenge: "Donate what you won’t use. Never going to eat that can of beans? Donate it to a food kitchen before it expires so it can be consumed by someone who needs it.")
Challenge.create(category_id: 2, challenge: "Organize your fridge! https://insteading.com/blog/minimize-food-waste-by-storing-food-in-your-refrigerator-the-right-way/")
Challenge.create(category_id: 2, challenge: "Pickle it! Go to your fridge and pickle at least one jar ;)")
Challenge.create(category_id: 3, challenge: "Change all light bulbs to compact fluorescents or LEDs")
Challenge.create(category_id: 3, challenge: "This week, unplug computers, TVs and other electronics when not in use. (Unplug your phone from the charger (and the charger from the wall) when your phone is fully charged)")
Challenge.create(category_id: 3, challenge: "This week, wash your clothes in cold or warm (not hot) water.")
Challenge.create(category_id: 3, challenge: "Hang dry your clothes this week. Avoid dryers!")
Challenge.create(category_id: 3, challenge: "Avoid heater and air conditioners for a week.*")
Challenge.create(category_id: 3, challenge: "Add one energy efficient appliance to your house (https://eartheasy.com/)")
Challenge.create(category_id: 3, challenge: "Fill your freezer up. It uses less energy since the frozen food won’t warm up when the door is opened. If the freezer is empty, then all the space will fill up with warm air when the door is opened, which the freezer needs to work hard to cool down when the door is shut again.")
Challenge.create(category_id: 3, challenge: "Wash only full loads of dishes and clothes for a week.")
Challenge.create(category_id: 3, challenge: "Plug home electronics to power strips and turn the strips off when not in use or when leaving the house.")
Challenge.create(category_id: 3, challenge: "Install a programmable thermostate to lowe utility bills")
Challenge.create(category_id: 3, challenge: "Install a timer for your water heater or turn it off when you are not at home or at night")
Challenge.create(category_id: 3, challenge: "Set your computer to sleep or hibernate mode instead of using a screen saver so it uses less electricity during periods of inactivity.")
Challenge.create(category_id: 3, challenge: "Turn lights off when you leave the room. This is one that parents (who tend to pay the energy bills) forever tell their kids. It is definitely worth it, especially if you haven’t made the swap to LED lights (see no.17!)")
Challenge.create(category_id: 3, challenge: "Don’t leave your computer in standby – turn it off at the end of each day")
Challenge.create(category_id: 3, challenge: "Put lids on pots and pans to reduce cooking times.")
Challenge.create(category_id: 4, challenge: "Carpool (+2) or use a bus for the entire week")
Challenge.create(category_id: 4, challenge: "Use bike, walk or work from home at least twice a week")
Challenge.create(category_id: 4, challenge: "Use bike, walk or work from home at least three days a week")
Challenge.create(category_id: 4, challenge: "Did you know that you can reduce the impact of your air travel by choosing direct flights? Jet fuel is a high-carbon energy source, and take-off and landing are the most fuel-intensive parts of a flight, so the more connections you make, the higher your carbon footprint. You can reduce your impact by avoiding connecting flights when you book your flight. Try to arrange a direct flight or more direct flights for your next trip!")
Challenge.create(category_id: 4, challenge: "The heavier an aircraft, the more fuel it consumes. Cargo and baggage constitute a large portion of an aircraft’s weight. Each individual traveler can make a big difference in fuel consumption by packing lightly and the weight reduction means fewer CO2 emissions from the aircraft. In fact, if all passengers packed one less pair of shoes, or roughly 2 lbs/1kg, the aircraft’s fuel savings would be the same as taking 10,500 cars off the road for an entire year. For your next trip pack everything in one bag and try to make it light as possible.")
Challenge.create(category_id: 4, challenge: "Consider going into national vacation as opposed to international vacations next time you consider traveling.")
Challenge.create(category_id: 4, challenge: "Reduce the amount of items that you ship back to your country via cargo. Next time you buy something online ask yourself, would I be able to get this item in my country/region? Do I really need it?")
Challenge.create(category_id: 4, challenge: "Make a list of all of the items you bought in the last year that were shipped from a different country. Can those items be produced nationally? If so, make a list of national producers and buy from  at least 3 items next time you need to buy something similar. Also ask yourself, Am I using them on regular basis (2-3 weeks)? If not consider not to buy those anymore.")
Challenge.create(category_id: 4, challenge: "Carpool (+2) or use a bus at least once a week")
Challenge.create(category_id: 4, challenge: "Carpool (+2) or use a bus at twice a week")
Challenge.create(category_id: 4, challenge: "Carpool (+2) or use a bus at three times a week")
Challenge.create(category_id: 4, challenge: "Use bike, walk or work from home at least four days a week")
Challenge.create(category_id: 4, challenge: "Speeding and unnecessary acceleration reduce mileage by up to 33%, waste gas and money, and increase your carbon footprint. The next two times you need to drive, try keeping a normal and constant speed. If you don't have a car make sure your relatives or the people you usually travel with complete the challenge.")
Challenge.create(category_id: 4, challenge: "Next time you drive, combine errands to make fewer trips. If you don't have a car make sure your relatives or the people you usually travel with complete the challenge.")
Challenge.create(category_id: 4, challenge: "If you have a car, remove excess weight from your car. .If you don't have a car make sure your relatives or the people you usually travel with complete the challenge.")
Challenge.create(category_id: 5, challenge: "This week, take a reusable travel mug to the coffee shop, or make your coffee at home. Use a French press or coffee maker and avoid those single-serving packages used in Keurig-like machines. Try a reusable coffee filter in your coffee maker, too!")
Challenge.create(category_id: 5, challenge: "Don't buy bottled water. If you don’t have access to a good well or spring, it is much better to get a good water filter and drink from the tap. Carry a reusable water bottle. This could be as simple as using a mason jar for the entire week!")
Challenge.create(category_id: 5, challenge: "Collect old wine Corks for at least two months")
Challenge.create(category_id: 5, challenge: "Don’t buy beverages in cans or single serving bottles. For health’s sake, don’t buy soda or juice at all!")
Challenge.create(category_id: 5, challenge: "Clean up! Revise your library and donate at least 5 books")
Challenge.create(category_id: 5, challenge: "Clean up! Revise your kitchen and make a list of the items you haven't use in the last 3 months. Donate at least 2 of them")
Challenge.create(category_id: 5, challenge: "Clean up! Go to your bathroom and make a list of the items and products that you haven't use in the last 3 months. Donate at least 5 of them")
Challenge.create(category_id: 5, challenge: "Refuse promotional items or propaganda for the entire month.")
Challenge.create(category_id: 5, challenge: "Acummulate and re-use any disposable objects you get for the entire week and for the following week use a glass jar or plastic containers to store every to-go meal")
Challenge.create(category_id: 5, challenge: "Don't ask for receipes unless neccesary for a week")
Challenge.create(category_id: 5, challenge: "Keep track of all the paper you use during a week and by the end of the week take a picture and recycle it. Upload the picture on Slack")
Challenge.create(category_id: 5, challenge: "Keep track of all the plastic you use during a week and by the end of the week take a picture and recycle it. Upload the picture on Slack")
Challenge.create(category_id: 5, challenge: "Keep track of all the metal you use during a week and by the end of the week take a picture and recycle it. Upload the picture on Slack")
Challenge.create(category_id: 5, challenge: "Keep track of all the glass that you use during a week and would usually though aways,  and by the end of the week take a picture and recycle it. Upload the picture on Slack")
Challenge.create(category_id: 5, challenge: "Bring lunch to your office at least two times a week on your lunchbox")
Challenge.create(category_id: 5, challenge: "Ask for you services receipts to be sent to you via email instead of in paper")
Challenge.create(category_id: 5, challenge: "Return egg and berry cartons to the vendors at the farmers’ market for reuse.")
Challenge.create(category_id: 5, challenge: "Welcome alternatives to disposables (paper towels, garbage liners, wax paper, aluminum sheets, disposable plates, cups, etc….): Swap paper towels for reusable rags, swap sandwich baggies for kitchen towels or stainless containers, drop garbage liners all together (wet waste is mostly compostable anyways).")
Challenge.create(category_id: 5, challenge: "Don't use a single plastic bad, bring your reusable bag for everything you shop during the week")
Challenge.create(category_id: 7, challenge: "Clean up! Go to your closet and make a list of the items you haven't use in the last 3 months. Donate at least 10 items by the end of the week!")
Challenge.create(category_id: 7, challenge: "Donate a piece of clothing for every object you have bought in the last 6 months.")
Challenge.create(category_id: 7, challenge: "Read the following article: Next time you buy clothing consider buying from detox committed companies https://www.greenpeace.org/archive-international/en/campaigns/detox/fashion/detox-catwalk/?_ga=2.70961168.1209751338.1525456768-1508758839.1525456768")
Challenge.create(category_id: 7, challenge: "Recycle or repurpose at least 4 items of your closet! https://www.craftsy.com/quilting/article/denim-quilt-patterns/, http://www.craftaholicsanonymous.net/t-shirt-pom-poms-tutorial, https://abeautifulmess.com/2014/04/make-your-own-woven-rag-rug.html, https://www.mommypotamus.com/no-sew-t-shirt-tote-bag-tutorial/")
Challenge.create(category_id: 7, challenge: " Swap your old clothes with other people! Swap at least 3 items from your closet")
Challenge.create(category_id: 7, challenge: "Next item you buy, get at least one item from a secondhand store")
Challenge.create(category_id: 7, challenge: "Sell: Make your contribution to the resale and second-hand inventory, list on eBay or at your local consignment shop. Take at least 4 items of your closet ;)")
Challenge.create(category_id: 7, challenge: "Return to vendor: Retailers like PUMA, Patagonia and EILEEN FISHER will take their clothes back and recycle them into new products. Check which brands accept them and take four pieces of your clothing to return them back to vendors.")
Challenge.create(category_id: 7, challenge: "Next time you buy clothing, consider buying from sustainable fashion companies. http://www.thegoodtrade.com/features/affordable-ethical-fashion-brands, https://www.cosmopolitan.com/style-beauty/fashion/g9255699/sustainable-eco-green-clothing-brands/")
Challenge.create(category_id: 7, challenge: "Donate at least one piece of clothing to Dress for success or a similar initiative https://dressforsuccess.org/")
Challenge.create(category_id: 7, challenge: "Read the following article: Next time you buy clothing consider not buying from companies who are at the bottom like: Esprit, Limited Brands (which runs Victoria’s Secret), Li-Ning, and Nike. https://www.greenpeace.org/archive-international/en/campaigns/detox/fashion/detox-catwalk/?_ga=2.70961168.1209751338.1525456768-1508758839.1525456768")
Challenge.create(category_id: 7, challenge: "Next time you see discounts on clothing and want to buy. Stop and think if you really need the item and don't buy more than three pieces of clothing at once.")
Challenge.create(category_id: 7, challenge: "Keep some of your worn-out clothes for rags and label the rest as “rags”.")
Challenge.create(category_id: 7, challenge: "Don’t Scrap It. Turn your unwanted clothing into functional products. Oversized or faded t-shirt? Great for comfy pajamas. Ripped t-shirt? Might be great for household cleaning. Outdated skirt? Could be a great apron.")

puts 'Challenges created'
