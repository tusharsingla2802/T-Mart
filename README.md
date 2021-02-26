This is a "Shopping" Website created using Java Server Pages(JSP) along with HTML and CSS for Front-end and JDBC for Back-end and MySQL for the database.
This site gives you an option to explore various objects and makes you feel like real shopping.




create database tmart;
use tmart;

create table customer(cid int primary key auto_increment,cname varchar(50),email varchar(50),phone varchar(12),address varchar(200));
alter table customer add password varchar(15);

create table category(catid int primary key auto_increment,cat_name varchar(25));

create table subcategory(subcatid int primary key auto_increment,subcat_name varchar(25),catid int);

create table products(pid int primary key auto_increment,pname varchar(25),price decimal(8,2),details varchar(1200),img varchar(20));

alter table subcategory add constraint fkcatid foreign key(catid) references category(catid);

create table cart(cartid int primary key auto_increment,pid int,uid int,price decimal(8,2),qty int);

create table trending_items(no int primary key auto_increment,catid int,pid int);

create table saveforlater(sno int primary key auto_increment,uid int,pid int);

create table admin(aid int primary key auto_increment,aname varchar(50),email varchar(50),phone varchar(12),address varchar(200),password varchar(15));


insert into category(cat_name) values('Electronics');
insert into category(cat_name) values('Games');
insert into category(cat_name) values('Health Care');
insert into category(cat_name) values('Home and Applainces');


insert into subcategory(subcat_name,catid) values('Airbuds',1);
insert into subcategory(subcat_name,catid) values('Watches',1);
insert into subcategory(subcat_name,catid) values('Head Phones',1);
insert into subcategory(subcat_name,catid) values('Laptops',1);

insert into subcategory(subcat_name,catid) values('PS5',2);
insert into subcategory(subcat_name,catid) values('Spider-Man',2);
insert into subcategory(subcat_name,catid) values('Shooting',2);

insert into subcategory(subcat_name,catid) values('Proteins',3);
insert into subcategory(subcat_name,catid) values('Vitamins',3);
insert into subcategory(subcat_name,catid) values('Oral-Care',3);
insert into subcategory(subcat_name,catid) values('Trimmers',3);

insert into subcategory(subcat_name,catid) values('Sofa-sets',4);
insert into subcategory(subcat_name,catid) values('Induction and Pans',4);
insert into subcategory(subcat_name,catid) values('Dinner Sets',4);
insert into subcategory(subcat_name,catid) values('water Purifiers',4);



insert into products(pname,price,details,img) values('Black Dial Mens Watch',2499.00,'A classic masterpiece of design exclusive watch for Mens along with a modern twist. This Rolly Black dial Stainless Steel strap Mens watch gives you a feeling of elegance and class.','1.PNG');

insert into products(pname,price,details,img) values('Brown Dial Men\'s Watch',2899.00,'This Rolly Brown dial Leather strap Men\'s watch gives you a feeling of elegance and class. Magnificently designed watch for Men along with a round dial and a durable strap this Men\'s watch is extremely versatile good enough to suit almost any attire.','2.PNG');

insert into products(pname,price,details,img) values('Grey Dail Men\'s Watch',3499.00,'You may feel comfortable knowing that this Men\'s watch will rest safely and securely on your wrist because of its comfortable Stainless Leather strap. Watches are more than just technological innovation. They\'re worn for their looks additionally they have got a practical function.','3.PNG');

insert into products(pname,price,details,img) values('White Dial Leather Watch',2099.00,'A classic masterpiece of design exclusive watch for Men\'s along with a modern twist. This Rolly Gray dial Stainless Leather strap Men\'s watch gives you a feeling of elegance and class.','4.PNG');

insert into products(pname,price,details,img) values('Steel Strap Analog Watch',3999.00,'This Rolly Gray dial Stainless Steel strap Men\'s watch gives you a feeling of elegance and class. Magnificently designed watch for Men along with a round dial and a durable bracelet strap, this Men\'s watch is extremely versatile good enough to suit almost any attire.','5.PNG');


insert into products(pname,price,details,img) values('Apple AirPods Pro',24900.00,'Easy Connectivity: The Mivi DuoPods M40 comes with Bluetooth 5.0 and a stronger, better connection. Take the earbuds out of the charging case connect them to your phone and you\'re ready to go.Your personal music companion/artist: Need to get away from the hustle-bustle around? Mivi DuoPods M40 is here to help. Immerse yourself in the high-quality sound of DuoPods M40.','6.PNG');

insert into products(pname,price,details,img) values('Mivi Pods',2499.00,'Touch Adaptive Controls: Control your music and calls with the tap of a finger. Touch the MFB button to play/pause your music, take/reject your calls and activate Siri/Google voice assistant.Enjoy worry-free music: The Mivi DuoPods M40 is splashproof and sweatproof so you can play your music without worry.','7.PNG');

insert into products(pname,price,details,img) values('Ultron Pods',1499.00,'Touch Adaptive Controls: Control your music and calls with the tap of a finger. Touch the MFB button to play/pause your music, take/reject your calls and activate Siri/Google voice assistant.Enjoy worry-free music: The Mivi DuoPods M40 is splashproof and sweatproof so you can play your music without worry.','8.PNG');

insert into products(pname,price,details,img) values('Ptron Pods',2099.00,'Enjoy worry-free music: The Mivi DuoPods M40 is splashproof and sweatproof so you can play your music without worry.Extend your playtime: Mivi DuoPods M40 play your music on and on for up to 6 hours. The charging case lets you charge the earbuds up to three times.','9.PNG');

insert into products(pname,price,details,img) values('Boat Earbuds',3099.00,'Easy Connectivity: The Mivi DuoPods M40 comes with Bluetooth 5.0 and a stronger and better connection. Take the earbuds out of the charging case and connect them to your phone and you\'re ready to go.Your personal music companion/artist: Need to get away from the hustle-bustle around? Mivi DuoPods M40 is here to help. Immerse yourself in the high-quality sound of DuoPods M40.Touch Adaptive Controls: Control your music and calls with the tap of a finger. Touch the MFB button to play/pause your music take/reject your calls and activate Siri/Google voice assistant.','10.PNG');


insert into products(pname,price,details,img) values('Lenovo GXD0T69863 Legion',3099.00,'Game for hours without strain, thanks to the soft and perfectly fitting rotatable PU leather ear cups. Control volume in-line, and fully retract the noise-cancelling microphone after you’re done','11.JPG');

insert into products(pname,price,details,img) values('Boat GXD693 H300',2999.00,'Comfortable, lightweight and built to last, the H300 features a unique suspension headband, sturdy and stylish all-metal frame, andthe distinctive aesthetic of the Legion gaming family','12.JPG');

insert into products(pname,price,details,img) values('Ultron UT0V34',1999.00,'Don’t miss a single footstep or note! With powerful sound immersion 50 mm audio drivers and plug-and-play noise-cancelling the H300 delivers the sound quality of a premium headset','13.JPG');

insert into products(pname,price,details,img) values('R T40JD83H',1499.00,'Game for hours without strain Comfortable lightweight and built to last the H300 features a unique suspension headband sturdy and stylish all-metal frame','14.JPG');

insert into products(pname,price,details,img) values('SONY S123JD',3499.00,'Game for hours without strain thanks to the soft and perfectly fitting rotatable PU leather ear cups. Control volume in-line and fully retract the noise-cancelling microphone.Game for hours without strain thanks to the soft and perfectly fitting rotatable PU leather ear cups. Control volume in-line and fully retract the noise-cancelling microphone after you\'re done','15.JPG');


insert into products(pname,price,details,img) values('ASUS GTX350',49999.00,'Processor: Intel Core i5-9300H 2.4 GHz base frequency up to 4.1 GHz with Intel Turbo Boost Technology 8 MB L3 cache 4 cores. Memory: 8 GB DDR4-2666 SDRAM (1 x 8 GB). Storage: 512 GB PCIe NVMe M.2 SSD. Display: 15.6 Inch FHD IPS ati-glare micro-edge WLED-backlit 250 nits 45% NTSC (1920 x 1080)','16.JPG');

insert into products(pname,price,details,img) values('HP PAVALION',54999.00,'Processor: Intel Core i5-9300H (2.4 GHz base frequency up to 4.1 GHz with Intel Turbo Boost Technology 8 MB L3 cache 4 cores)
Memory: 8 GB DDR4-2666 SDRAM (1 x 8 GB). Storage: 512 GB PCIe NVMe M.2 SSD
Display: 15.6 Inch FHD IPS anti-glare micro-edge WLED-backlit 250 nits 45% NTSC (1920 x 1080)
Graphics: NVIDIA GeForce GTX 1650 Graphics (4 GB GDDR5 dedicated)
Operating System: Pre-loaded Windows 10 Home with lifetime validity
In the box: Laptop with included battery and charger
Ports: 1 USB 3.1 Gen 2 Type-C (10 Gb/s signaling rate Power Delivery 3.0 DisplayPort 1.4 HP Sleep and Charge). 1 USB 3.1 Gen 1 Type-A (HP Sleep and Charge); 2 USB 3.1 Gen 1 Type-A (Data Transfer Only). 1 HDMI. 1 AC smart pin. 1 RJ-45. 1 headphone/microphone combo
Warranty: This genuine HP laptop comes with a 1-year domestic warranty from HP covering manufacturing defects and not covering physical damage.
','17.JPG');


insert into products(pname,price,details,img) values('ACER D35E',39999.00,'Processor: Intel Core i5-9300H (2.4 GHz base frequency up to 4.1 GHz with Intel Turbo Boost Technology 8 MB L3 cache 4 cores)
Memory: 8 GB DDR4-2666 SDRAM (1 x 8 GB). Storage: 512 GB PCIe NVMe M.2 SSD
Display: 15.6 Inch FHD IPS anti-glare micro-edge WLED-backlit 250 nits 45% NTSC (1920 x 1080)
Graphics: NVIDIA GeForce GTX 1650 Graphics (4 GB GDDR5 dedicated)
Operating System: Pre-loaded Windows 10 Home with lifetime validity
In the box: Laptop with included battery and charger
Ports: 1 USB 3.1 Gen 2 Type-C (10 Gb/s signaling rate Power Delivery 3.0 DisplayPort 1.4 HP Sleep and Charge). 1 USB 3.1 Gen 1 Type-A (HP Sleep and Charge); 2 USB 3.1 Gen 1 Type-A (Data Transfer Only). 1 HDMI. 1 AC smart pin. 1 RJ-45. 1 headphone/microphone combo
Warranty: This genuine HP laptop comes with a 1-year domestic warranty from HP covering manufacturing defects and not covering physical damage.
','18.JPG');


insert into products(pname,price,details,img) values('PREDATOR',69999.00,'Processor: Intel Core i5-9300H (2.4 GHz base frequency up to 4.1 GHz with Intel Turbo Boost Technology 8 MB L3 cache 4 cores)
Memory: 8 GB DDR4-2666 SDRAM (1 x 8 GB). Storage: 512 GB PCIe NVMe M.2 SSD
Display: 15.6 Inch FHD IPS anti-glare micro-edge WLED-backlit 250 nits 45% NTSC (1920 x 1080)
Graphics: NVIDIA GeForce GTX 1650 Graphics (4 GB GDDR5 dedicated)
Operating System: Pre-loaded Windows 10 Home with lifetime validity
In the box: Laptop with included battery and charger
Ports: 1 USB 3.1 Gen 2 Type-C (10 Gb/s signaling rate Power Delivery 3.0 DisplayPort 1.4 HP Sleep and Charge). 1 USB 3.1 Gen 1 Type-A (HP Sleep and Charge); 2 USB 3.1 Gen 1 Type-A (Data Transfer Only). 1 HDMI. 1 AC smart pin. 1 RJ-45. 1 headphone/microphone combo
Warranty: This genuine HP laptop comes with a 1-year domestic warranty from HP covering manufacturing defects and not covering physical damage.
','19.JPG');

insert into products(pname,price,details,img) values('MACBOOK M21O0',89999.00,'Processor: Intel Core i5-9300H (2.4 GHz base frequency up to 4.1 GHz with Intel Turbo Boost Technology 8 MB L3 cache 4 cores)
Memory: 8 GB DDR4-2666 SDRAM (1 x 8 GB). Storage: 512 GB PCIe NVMe M.2 SSD
Display: 15.6 Inch FHD IPS anti-glare micro-edge WLED-backlit 250 nits 45% NTSC (1920 x 1080)
Graphics: NVIDIA GeForce GTX 1650 Graphics (4 GB GDDR5 dedicated)
Operating System: Pre-loaded Windows 10 Home with lifetime validity
In the box: Laptop with included battery and charger
Ports: 1 USB 3.1 Gen 2 Type-C (10 Gb/s signaling rate Power Delivery 3.0 DisplayPort 1.4 HP Sleep and Charge). 1 USB 3.1 Gen 1 Type-A (HP Sleep and Charge); 2 USB 3.1 Gen 1 Type-A (Data Transfer Only). 1 HDMI. 1 AC smart pin. 1 RJ-45. 1 headphone/microphone combo
Warranty: This genuine HP laptop comes with a 1-year domestic warranty from HP covering manufacturing defects and not covering physical damage.
','20.JPG');



insert into products(pname,price,details,img) values('PS4',18090.00,'This PS4 system opens the door to an incredible journey through immmersive new gaming worlds and a deeply connected gaming community. This Sony PS4 supports 4K display with Motion Control.','21.JPG');

insert into products(pname,price,details,img) values('PS4',27890.00,'This PS4 system opens the door to an incredible journey. PS4 puts gamers first with an astounding launch lineup and over 180 games in development. Play the blockbusters on thid slim PS4 with 300GB storage and console.','22.JPG');

insert into products(pname,price,details,img) values('PS4',34990.00,'This PS4 system opens the door to an incredible journey through immmersive new gaming worlds with Slim 500GB storage and RT1350 graphics Card.','23.JPG');

insert into products(pname,price,details,img) values('SpiderMan',499.00,'The Ultimate SpiderMan game.. This game depicts the story of Ultimate spiderMan movie its an adventure game developed by Insomaniac games and published by Sony Entertainment.','24.JPG');

insert into products(pname,price,details,img) values('FIFA',1290.00,'This classic football game gives you the best ever feeling as you are playing in real. This FIFA 20 was published by Electronic Arts. It can be Played on XBox or Play-Station or Nintendo Switch.','25.JPG');

insert into products(pname,price,details,img) values('Altera Plus',599.00,'Best Free Shooter Game by  BlackTea StudioRated: Guidance Suggested 3.9 out of 5 stars and 14 customer ratings','26.JFIF');

insert into products(pname,price,details,img) values('Snipper Assasin',1190.00,'Item part number : com.blackteastudio.missions.terrorist.counter.fps Manufacturer : BlackTea StudioBest Sellers Rank: #4812 Free in Apps for Android','27.JFIF');

insert into products(pname,price,details,img) values('Tank Wars',399.00,'This app needs permission to access: Access information about networks Open network sockets Original Release Date : 2019 Manufacturer : BlackTea Studio','28.JFIF');

insert into products(pname,price,details,img) values('Battle Fields',00.00,'A very Nice shooting game similar to pubg in variouus aspects.','29.JFIF');

insert into products(pname,price,details,img) values('Pubg Mobile',00.00,'The best evcer shooting game of all the times. This game gives you the feel of real battle on the ground. It enhances you tactic skills and presence of youe mind in different situations on the field. ','30.JFIF');



insert into products(pname,price,details,img) values('Colgate Plax Antibacterial Mouthwash',290.00,'Colgate Plax Fresh Mint mouthwash removes over 99% of germs that cause bad breath and cavities giving you a fresher and cleaner mouth than brushing alone. It has a refreshing freshmint after taste. It is antibacterial yet alcohol-free so you experience no burning sensation but just an instant blast of freshness and 10x longer cooling sensation compared to brushing alone.Its unique formula has a refreshing flavour that gives you (24/7) control over bad breath with regular use as directed.','31.jpg');

insert into products(pname,price,details,img) values('Flash Mint Strips',310.00,'These strips can also help prevent cavities protect against germ build-up and provide healthier gums (vs. non-antisceptic mouth strips) when used as directed.','32.jpg');

insert into products(pname,price,details,img) values('Kwix Mint Strips',300.00,'Good oral care habits keep your teeth and gums healthy, prevents tooth decay, gum disease & bad breath with help of these minty strips.','33.jpg');

insert into products(pname,price,details,img) values('Ice Breaker Mints',490.00,'These strips can also help prevent cavities protect against germ build-up and provide healthier gums (vs. non-antisceptic mouth strips) when used as directed.','34.jpg');

insert into products(pname,price,details,img) values('New Teeth Whitener',1090.00,'Colgate is India\'s most trusted oral care brand and certified by Indian Dental Association. It is antibacterial yet alcohol-free so you experience no burning sensation just an instant blast of freshness and 10x longer cooling sensation compared to brushing alone.','35.jpg');


insert into products(pname,price,details,img) values('Fizzy Protien Tablets',580.00,'Revolutionary Protein : A delicious and powerful fruit twist to your regular whey protein','36.jpg');

insert into products(pname,price,details,img) values('Refreshing Mango Flavored Hydrolysed Whey Protein',429.00,'Best made even better: world-class formulation of 26g protein from hydrolysed and isolate whey protein matrix along with 15g essential amino acids, 6g glutamine, 5.5g BCAAs and 0g sugar','37.jpg');

insert into products(pname,price,details,img) values('Bigmuscles Green and Fruits Nutrition ',1099.00,'Deliciously Fruity: Incredible refreshing, light, and crisp whey protein with an identical taste like that of fruit juices. Available in 5 fruity flavours Pineapple, Guava, Mango Orange, Litchi, and Mango','38.jpg');

insert into products(pname,price,details,img) values('Himalya Quista Pro',993.00,'A unisexual whey protein that not only helps fitness enthusiasts in building physique but also acts as a delicious & healthy meal replacement for all - students, office bearers and bodybuilders','39.jpg');

insert into products(pname,price,details,img) values('Pro Weight Gainer',1890.00,'Best made even better: world-class formulation of 26g protein from hydrolysed and isolate whey protein matrix along with 15g essential amino acids 6g glutamine 5.5g BCAAs and 0g sugar per serving.','40.jpg');


insert into products(pname,price,details,img) values('Philips Beard Trimmer',1280.00,'Gentle blades: Vega T-1 beard trimmer comes with corrosion-free & self-sharpening skin-friendly stainless-steel blades. It can trim your beard easily.','41.jpg');

insert into products(pname,price,details,img) values('Nova Beard and hair Trimmer',1449.00,'Hassle-Free charging for convenient use - Easy and On the GO charging with USB charging cable. Ideal for daily use travel holiday and business trips.','42.jpg');

insert into products(pname,price,details,img) values('IBell Trimmer',1080.00,'Ergonomic Design: compact body design easy to hold in hand, lightweight, and portable. Easy Rotating Wheel – Get Precision trimming with 23 length settings (1mm – 23 mm).','43.jpg');

insert into products(pname,price,details,img) values('Syska Ultra Cup Trimmer',1990.00,'Gentle blades: Vega T-1 beard trimmer comes with corrosion-free & self-sharpening skin-friendly stainless-steel blades. It can trim your beard easily. Best for beard and moustache. Hassle-Free charging for convenient use - Easy and On the GO charging with USB charging cable.Warranty: 1 year manufacturer warranty, customer care','44.jpg');

insert into products(pname,price,details,img) values('Litmus Premeium Look Beard Trimmer',1680.00,'Easy Rotating Wheel – Get Precision trimming with 23 length settings (1mm – 23 mm). Charging & Runtime - 8 hours of charging time on a single charge gives 40 minutes of the run time of cordless use. In the Box: 1 Trimmer with comb attachment, 1 US charging cable, 1 cleaning oil, 1 cleaning brush, 1 user manual','45.jpg');


insert into products(pname,price,details,img) values('NAN Pro Vitamin Powder',280.00,'Uses organic fruits & grains grown without artificial substances.Bag-in-Box format ensures enhanced safety hygiene and convenience','46.jpg');

insert into products(pname,price,details,img) values('Ceregrow',249.00,'CERELAC with organic goodness for 6 to 12-month-old babies. Made form 100% organic heat and Milk','47.jpg');

insert into products(pname,price,details,img) values('LactoGrow',380.00,'Organic Selection Wheat Cereal - From 6 to 12 months. 200g Bag-In-Box Pack.','48.jpg');

insert into products(pname,price,details,img) values('Nestle Higher Protein',490.00,'This Protein powder helps with your muscles.','49.jpg');

insert into products(pname,price,details,img) values('Oziva Protein and Herbs Powder',680.00,'A delicious and powerful fruit twist to your regular whey protein','50.jpg');


insert into products(pname,price,details,img) values('SKYHEART Exclusive Dinner Set',1490.00,'Made of Virgin Reinforced Polypropylene, a 100% Safe & Food Grade Plastic Material.','51.jpg');

insert into products(pname,price,details,img) values('LaOpala Opalware Dinner Set - 47 Pieces White',5299.00,'Safe for use in Microwave Refrigerator Freezer and Dishwasher (top rack) Can be used straight from the fridge to the microwave for reheating and serving.','52.jpg');

insert into products(pname,price,details,img) values('Ceramic Plate Dinner set',2945.00,'Convenient to clean and maintain. Lightweight & Stackable Easy to Clean & Store.','53.jpg');

insert into products(pname,price,details,img) values('Set Of 32 Pcs Darkpyro White Plastic Dinner',1599.00,'Full Plate 6 Pcs Quarter Plate 6 Pcs Veg Bowl 12 Pcs Rice Plate 1 Pc Serving Bowl 2 Pcs Serving Bowl Lid 2 Pcs Serving Spoon 2 Pcs Serving Laddle 1 Pc','54.jpg');

insert into products(pname,price,details,img) values('Royal sapphire 61 pcs Designer dinnerware Set',3490.00,'Printed White For regular use and gifting purposes.','55.jpg');

insert into products(pname,price,details,img) values('Highglass Melamine Dinner Set',1990.00,'Made of Virgin Reinforced Polypropylene, a 100% Safe & Food Grade Plastic Material.','56.jpg');



insert into products(pname,price,details,img) values('Prestige PIC 20 1200 Watt Induction',2590.00,'Prestige Induction Cooktop-Pic 20.0. Net Quantity: 1 Unit Voltage: 230V; Wattage: 1200W Antimagnetic Wall','57.jpg');

insert into products(pname,price,details,img) values('Usha IC 3616 Induction Cooktop',1899.00,'Power consumption-1600 W Resistant to voltage fluctuation up to 1500 volts Power saving intelligence Frequency: 50 Hz Pan sensor technology Manual setting to customize cooking','58.jpg');

insert into products(pname,price,details,img) values('Prestige PIC 1900-Watt Induction with Push button',1999.00,'Max 3 differentiators great features ,Indian menu options,aerodynamic cooling system,pause function for added convenience','59.jpg');

insert into products(pname,price,details,img) values('Cello Prima Induction Non-Stick Cookware',1590.00,'Material: Aluminium Lid: Tempered Glass. Base type: Induction Base Base thickness: 2.5mm Included components: 1 Dosa Tawa 1 Fry Pan 1 Kadai with Lid Colour: Cherry','60.jpg');

insert into products(pname,price,details,img) values('WONDERCHEF Celebration Cookware Set with Lid',2599.00,'Convenience merges with contemporary design to bring you this wok set that is constructed from sturdy metal and lets you prepare scrumptious meals with ease.','61.jpg');



insert into products(pname,price,details,img) values('Eureka Forbes AquaSure from Aquaguard',13490.00,'Color- Grey Capacity: 7 litres tank Power: 230 watts Input Water Temperature: 10 - 40°C and Operating Input Voltage: 150 V - 270 V AC/50 Hz Material Tank Type- Food Grade Plastic Smart LED indication shows Power On Purification On Tank Full Status.','62.jpg');

insert into products(pname,price,details,img) values('KENT Supreme Extra 2020',15249.00,'Multiple purification by RO + UV + UF + Alkaline + TDS Control which removes even dissolved impurities such as arsenic rust pesticides and fluorides and kills bacteria and viruses to make water 100 % pure and suitable for consumption. The in tank UV LED keeps purified water pure for longer duration.','63.jpg');

insert into products(pname,price,details,img) values('Havells 7 litres UV + UF Water Purifier UV Plus',8490.00,'Mineralz cartridge Germicidal UV Zero splash faucet, Smart alerts Ingress protection tank cover iProtect purification monitoring','64.jpg');

insert into products(pname,price,details,img) values('KENT Gold UF technology based Water Purifier',2300.00,'Color: White. Purification by hollow fiber ultra filtration membrane. Use of nano silver carbon for better disinfection of water. long life membrane expected to last upto 4000 Litre','65.jpg');

insert into products(pname,price,details,img) values('BLUESTAR UV Water Purifier Pristina PT1BLAM01',6990.00,'CSafe & durable stainless steel UV purification chamber. UV fail alert indicates that UV lamp life is over Safeguards against microbiological impurities Built-in voltage stabilizer Filter change alert','66.jpg');

insert into products(pname,price,details,img) values('NXT RO+UV+UF+TDS controller Water Purifier',4199.00,'RO+UV+UF+TDS Controller Alkaline water purification System. High quality 100 GPD Booster Pump TFC 1812-75 GPD Imported Membrane UV Protection UF Filter & Mineral Alkaline technology in side. ABS Food Grade Plastic Cabinet. This system is designed to work from 100 to 2000 tds(Total Dissolved Solids)','67.jpg');

insert into products(pname,price,details,img) values('OCEAN 18L',1690.00,'Rust Proof SS Body. Ceramic Candle Filters. Work Without Electricity with Zero Maintenance. Provides Pure and Safe Water. Warranty: 2 Years on SS','68.jpg');



insert into products(pname,price,details,img) values('Nendle Luxurious Cotton Abstarct Design',19999.00,'Color Size & Design: Nendle offers you luxurious abstract design Marron sofa covers sets for 3+1+1. It comes in 6 pieces i.e. 1 Sofa Seat Cover','69.jpg');

insert into products(pname,price,details,img) values('CasaStyle Casperia 6 Seater SofaSet',23999.00,'L shape Sofa Set for living room | Dimensions:L-101.5 D-60 H-28 (inches). Upholstery Material : Fabric | Color : Grey-Black | SEATING CAPACITY- 6 Seater Sofa set for Home and Office','70.jpg');

insert into products(pname,price,details,img) values('Living and Dining Hall Nylon U Shape Sofa',49999.00,'Primary Material: Wood secondary material: Foam Upholstery Material: Fabric Color : Multi Colour. Relaxed and comfortable experience: The sleek modern sofa is suitable for office bedroom living room or other occasional seating area. Decorate your home/house/office for your guest or family to chill together.','71.jpg');

insert into products(pname,price,details,img) values('Aric Chaise Lounger in Grey Colour',17499.00,'Muebles Casa - muebles is a Spanish name that means furniture and casa means "home". Muebles Casa is a new brand in the industry run by qualified furniture experts and a highly professional design team. Our priority is to provide the utmost comfort value for money and in vogue colours and designs to our customer.','72.jpg');

insert into products(pname,price,details,img) values('Woodcasa Urbanway Sofa Set',27890.00,'PRODUCT DIMENSIONS- L-101.5 D-60 H-33 - COLOR- Grey - Black. PRIMARY MATERIAL- Solid Wood & 32 density Supersoft Air Foam - UPHOLSTERY MATERIAL- Premium Fabric - SEATING CAPACITY- 6 Seater','73.jpg');




insert into trending_items(catid,pid) values(1,1);

insert into trending_items(catid,pid) values(1,11);

insert into trending_items(catid,pid) values(2,24);

insert into trending_items(catid,pid) values(2,33);

insert into trending_items(catid,pid) values(3,43);

insert into trending_items(catid,pid) values(3,50);

insert into trending_items(catid,pid) values(4,65);

insert into trending_items(catid,pid) values(4,74);





