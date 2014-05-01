# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:setup command.
# rake db:setup
	
	User.create(:name => "weds4u", :password => "w", :password_confirmation => "w", :role => 'admin')
	User.create(:name => "Afsheen",  :password => "a", :password_confirmation => "a", :role => '')

 	Country.create(:city => "London")
	Country.create(:city => "Newcastle")
	Country.create(:city => "Manchester")
	Country.create(:city => "Bournemouth")	
	Country.create(:city => "Nottingham")
	
	Region.create(:region => "North England")
	Region.create(:region => "South England")
	Region.create(:region => "East England")
	Region.create(:region => "West England")

	Product.create(:title => "Chiswick Hotel",:description => "Chiswick Hotel is a beautiful privately owned 3 star hotel located
	on Chiswick High Road. We boast 64 individually decorated bedrooms and 1 to 3 bedroom apartments, which makes us perfect for
	families and group bookings. Ideally situated between two tube stations for easy access into central London." , 
	:img_url => 'Chiswick.jpg'  , :price => "5000", :capacity => "500", :contact => "Dorian Charlton", :telephone => "0208 9941712",
	:website => "www.chiswickhotel.co.uk",:address => "626 Chiswick High Road, London, W4 5RY", :country_id => "1", :region_id => "2")
	
	
	Product.create(:title => "The Waldorf Hilton",:description => "Choose the historic Waldorf Hilton London hotel for your wedding
	or special event, and recreate the glamour and grandeur of twenties jazz-era grand balls, with a luxurious banquet in the historic Palm Court, 
	or the adjacent Adelphi Suite, an extraordinary venue for up to 380 guests, which features exquisitely restored architectural detailing. 
	Enjoy flawless service, fine wine and sparking champagne.", 
	:img_url => 'Waldorf.jpg'  , :price => "6000", :capacity => "600", :contact => "Alexander Smith", :telephone => "0208 9876565",  
	:website => "www.thewaldorfhilton.co.uk",:address => "London, Aldwych, London, West Central London, WC2B 4DD", :country_id => "1", :region_id => "1")
	
	
	Product.create(:title => "Wentworth Club",:description => "Wentworth, a Club famous for its Championship golf & beautiful castellated 
	clubhouse plays host to bespoke weddings for members & non-members alike, ensuring your wedding reflects your individual personality 
	& style. One of our experienced event managers will work together with you to ensure that your wedding day is planned to perfection,
	stress-free & unforgettable.
	At Wentworth there is a room for every occasion, from the grand Ballroom with its gabled ceiling, elegant chandeliers and beautiful 
	paintings, to the more intimate Ryder Cup and Curtis Cup rooms." , 
	:img_url => 'Wentworth.jpg'  , :price => "7000", :capacity => "550", :contact => "Abbey Edward", :telephone => "01344 846334",  
	:website => "http://www.wentworthclub.com/",:address => "Wentworth Club, Wentworth Drive, Virginia Water, Surrey, GU25 4LS", :country_id => "1", :region_id => "1")
	
	
	Product.create(:title => "Kew Gardens", :description => "Kew Gardens, a World Heritage Site, has a variety of stunning wedding venues set within 300 acres of world
	renowned botanical gardens. Cambridge Cottage can seat 80 people for a civil ceremony and dining, and up to 150 guests for the after dinner party. 
	You may be interested in our multiple venue hire package, which includes the Nash Conservatory for your civil ceremony, Princess 
	of Wales Conservatory for your drinks reception and the Orangery for your dinner dance venue which all accommodate up to 200 guests.", 
    :img_url => 'Kew_Gardens.jpg'  , :price => "1000", :capacity => "600", :contact => "Aaron McDaid", :telephone => "0161 9918954", 
	:website => "www.kewgardens.co.uk",:address => "Kew Gardens, Kew, West London, London, Greater London, TW9 3AB", :country_id => "1", :region_id => "2")
	
	
	Product.create(:title => "Pembroke Lodge",:description => "A beautiful Listed Georgian mansion in Richmond Park,
	set in eleven acres of beautifully landscaped grounds with stunning views to the West. Our highly experienced 
	wedding team will be available to assist you in the planning of your special day, from your first enquiry right
	through to departure of the last guest. We are completely flexible with the arrangements, ranging from just a simple 
	marriage ceremony with a few guests to a marriage ceremony, seated reception and evening dancing with up to 140 guests. 
	The best endorsements of all are from previous guests." , 
    :img_url => 'Pembroke.jpg' , :price => "4500", :capacity => "500", :contact => "Emie Banks", :telephone => "0208 940 8207",  
	:website => "http://www.pembroke-lodge.co.uk",:address => "Pembroke Lodge, Richmond Park, Richmond, Surrey, TW10 5HX", :country_id => "1", :region_id => "2")
	
	
	Product.create(:title => "Mercure Hotel",:description => "Mercure Nottingham is licensed to perform Civil Ceremonies and Partnerships.
	It would be our privilege to share this with you. We aim to create a tailor made package for every wedding reception 
	and we are only too happy to offer ideas and suggestions. With 76 beautifully furnished ensuite bedrooms, remarkable
	chandeliers, bespoke glass wall panelling and a beautiful grand entrance Mercure Nottingham will put everyone in the 
	right frame of mind to get the best out of their time with us." , 
	:img_url => 'Mercure.jpg'  , :price => "4000", :capacity => "500", :contact => "Joan Didion", :telephone => "0115 959 9777",  
	:website => "http://www.mercurenottingham.com",:address => "Mercure Hotel Nottingham City Centre, George Street, Lace Market, Nottingham, Nottinghamshire, NG1 3BP", :country_id => "1", :region_id => "2")
	
	
	Product.create(:title => "Palace Hotel",:description => "The Palace Hotel with its inimitable style and elegance is an ideal wedding venue in 
	Manchester for your special day. With a beautiful interior - ideal for photographs and spectacular reception areas, The Palace Hotel is a stunning 
	backdrop for any wedding and you can rest assured that you and your guests will cherish your special day. Up to 800 guests - making it perfect 
	room for large weddings; The Whitworth Suite for more intimate wedding reception for up to 180 guests and Buckingham Suite for up to 200 guests. ", 
	:img_url => 'Palace_Hotel.jpg'  , :price => "1000", :capacity => "1000", :contact => "Ann-Marie Bell", :telephone => "0161 9898998", 
	:website => "www.palacehotel.co.uk",:address => "Palace Hotel, Oxford Street, Manchester, Greater Manchester, M60 7HA", :country_id => "1", :region_id => "3")
	
	
	Product.create(:title => "Davyhulme Park Golf Club",:description => "Davyhulme Park Golf Club is set within over 99 acres of spectacular parkland. 
	The Clubhouse overlooks beautiful landscaped greens and well maintained gardens which provides an attractive facility regardless of season.
	Outside we have on-site parking for over 90 vehicles with security barrier entry and coded exit. We have a 
	large and comfortable bar on the ground floor, with the capacity to seat 120 guests for a sit down meal and up to 150 for a more informal evening event. ", 
    :img_url => 'Davyhulme.jpg'  , :price => "1000", :capacity => "7000", :contact => "Leon Morton", :telephone => "0161 9772718",  
	:website => "www.davyhulmeparkgolfclub.co.uk",:address => "Davyhulme Park Golf Club, Gleneagles Road, Urmston, Greater Manchester, M41 8SA", :country_id => "1", :region_id => "3")
	
	
	Product.create(:title => "Mercure Bolton Georgian House Hotel", :description => "Set in the heart of the Lancashire countryside with spectacular views 
	across the West Pennine Moors, this hotel is an ideal location for your wedding or event. The hotel holds a civil wedding licence offering you the convenience 
	of enjoying your big day all under one roof. With a choice of 3 air-conditioned event rooms, you'll find something to suit you whatever your requirements. 
	What's more all 3 Suites boast their own private bar area.", 
    :img_url => 'Mercure_Bolton.jpg'  , :price => "1000", :capacity => "5500", :contact => "Kieron Folwell", :telephone => "0161 9969785", 
	:website => "www.mercureboltongeorgianhousehotel.co.uk",:address => "Mercure Bolton Georgian House Hotel, Manchester Road, Blackrod, Bolton, Greater Manchester, BL6 5RU", :country_id => "2", :region_id => "3")
    
	
	Product.create(:title => "Highcliffe Castle",:description => "Highcliffe Castle is a spectacular Grade 1 listed cliff top castle, with access to a beautiful sandy beach, 
	completed in the early 19th century and licensed for civil wedding ceremonies.  The 11am and 1pm slots are designed for couples wishing to hold their reception elsewhere and the 3.30pm slot gives 
	couples the opportunity after their ceremony for further celebrations at the castle.
	Weddings can be held any day of the week throughout the year and although Saturday is still the favourite day, Friday and Sunday weddings are popular." , 
	:img_url => 'High_Cliff.jpg'  , :price => "4500", :capacity => "800", :contact => "Alex Yiannakis", :telephone => "0161 9962456", :website => "www.cliffecastle.co.uk",
	:address => "Highcliffe Castle, Rothesay Drive, Highclifffe, Dorset, BH23 4LE", :country_id => "2", :region_id => "4")
	
	
	Product.create(:title => "The Italian Villa",:description => "Awarded Dorset best Wedding Venue 2013.
	Set against the dramatic backdrop of the 10 acres of manicured gardens at the renowned Compton Acres, 
	The Italian Villa gives Brides and Grooms the magical day they have always wished for.
	As the only one of its kind in the UK, The Italian Villa gives Bridal couples 3 floors.
	This luxury venue in Poole, Dorset, is licensed to perform civil ceremonies & civil partnerships. And with a balcony that 
	overlooks the stunning Italian Garden, you can be sure that your wedding photos will truly be outstanding! " , 
    :img_url => 'Italian_Villa.jpg' , :price => "6500", :capacity => "400", :contact => "Amelia Smith", :telephone => "0214 5654789", :website => "www.ItalianVilla.co.uk",
	:address => "The Italian Villa, Compton Acres, 164 Canford Cliffs Road, Poole, Dorset, BH13 7ES", :country_id => "2", :region_id => "4")
	
	
	Product.create(:title => "Christchurch Harbour Hotel & Spa",:description => "There is nowhere more romantic to tie the knot than the Christchurch Harbour Hotel & Spa.
	Take your vows against a backdrop of breathtaking coastline views, overlooking Mudeford Quay and out towards Hengistbury Head and the Isle of Wight, 
	the stunning waterfront location is the perfect setting for a wedding celebration. Enjoy the award winning cuisine and dramatic golden sunsets, 
	guaranteeing some truly memorable photo opportunities." , 
    :img_url => 'Christchurch.jpg' , :price => "3200", :capacity => "550", :contact => "Dan Simpson", :telephone => "0214 554745672", :website => "www.Christchurchotel.co.uk",
	:address => "Christchurch Harbour Hotel & Spa, Avonmouth, 95 Mudeford, Christchurch, Dorset, BH23 3NT", :country_id => "3", :region_id => "4")
	
	
	Product.create(:title => "Careys Manor Hotel & Spa", :description => "Careys Manor Hotel & SenSpa, situated in the heart of the beautiful New Forest National Park, 
	has long been a favourite with couples intending to spend the rest of their days together. At Careys Manor, we understand that your wedding day is the most important day 
	of your life with so much to organise, you need a venue which you can trust to provide you with something perfect.
	From the moment you arrive, our friendly and professional staff will ensure that your wedding is a truly memorable occasion and, as we hold only one wedding a day, 
	complete focus is on you and your party." , 
	:img_url => 'Careys_Manor.jpg' , :price => "6500", :capacity => "750", :contact => "David Walt", :telephone => "0217 354745987", :website => "www.CareysManorHotel.co.uk",
	:address => "Careys Manor Hotel & Spa, Lyndhurst Road, Brockenhurst, Hampshire, SO42 7RH", :country_id => "3", :region_id => "4")
	
	
	Product.create(:title => "Crew Hall", :description => "Rescued by the sea captain, Frankenstein 
    relays events that begin as he pieces together a man using old body parts. Once he manages to 
    create the horrible life, however, Frankenstein regrets his action immediately and flees his home.
    When he returns, he finds the monster is gone. Shortly after, Frankenstein hears that his brother 
    has been murdered. A series of tragic events follow, as the monster searches for love and Frankenstein 
    suffers the consequences of his immoral act." , 
    :img_url => 'Crewhall.jpg' , :price => "8850", :capacity => "650", :contact => "Mark Duff", :telephone => "0217 091256737", :website => "www.Crewhall.co.uk",
	:address => "Crew Hall, Weston Road, Crewe, Cheshire, CW1 6UZ", :country_id => "4", :region_id => "4")
	
	
	Product.create(:title => "Nottingham Racecourse", :description => "The best day of your life, an occasion
	like no other, shared with those dearest to you; so you need a team with the experience, expertise and spirit 
	to make the ideal picture an unforgettable reality. We know one of the most important things on your wedding
	day is peace of mind, so failsafe planning and attention to the smallest detail comes as standard." ,
    :img_url => 'Racecourse.jpg' , :price => "3000", :capacity => "400", :contact => "Harry Chapin", :telephone => "0870 850 7634",  :website => "http://www.nottinghamracecourse.co.uk/Home",
    :address => "Nottingham Racecourse, Colwick Park, Nottingham, Nottinghamshire, NG2 4BE", :country_id => "5", :region_id => "4")
	



		
	
	
	