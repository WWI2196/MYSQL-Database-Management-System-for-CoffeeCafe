use Coffeecafe_details;
INSERT INTO customer(user_ID, first_name, last_name, email,delivery_address)
VALUES 
('A00045', 'Arnol', 'Jhonson', 'Arjho@gmail.com','23,Barrio de Greenwich,Greenwich'),
('A45300', 'Ruby', 'Wilson', 'RubyWil@gmail.com','45,Barrington,Stratford'),
('E05678', 'Burton', 'Harris', 'Burth@gmail.com','122,Turnham Green,Chiswick'),
('B57005', 'Olivia', 'Elizabeth', 'Eliza@gmail.com','234,Mottingham,Bromley'),
('R66789', 'Samantha', 'Joann', 'samantha@gmail.com','99,Tiddington,Stratford');

INSERT INTO customer_contact_number(user_ID, contact_number)
VALUES 
('A00045', '+447975777666'),
('A45300', '+441682960079'),
('E05678', '+441711960287'),
('B57005', '+441632960201'),
('B57005', '+441772961239'),
('B57005', '+441632960732'),
('R66789', '+441900960806');

INSERT INTO employee(employee_ID, designation, first_name, last_name, salary, manager_ID)
VALUES
(207990, 'Manager','Jamie','Hall',300000,null),
(200989, 'Manager','Daisy', 'Green',300000,null),
(202780, 'Manager','Patrick','Gould',300000,null),
(100067, 'Steward','Amelia','Stephens',90000,202780),
(830500, 'Driver','Zachary', 'Baldwin',85000,200989),
(511222, 'Steward','Jacob','Ali',90000,202780),
(675543, 'Steward','Kyle','Howarth',90000,202780),
(500789,'Driver','Jamie', 'Nixon',85000,200989),
(190078, 'Cleaner','Kayleigh', 'Potts',76000,207990),
(675443, 'Steward','Adam','Bennett',90000,202780),
(203420, 'Manager','Georgina','Doherty',300000,null),
(511789,'Driver','Finley', 'Conway',85000,200989),
(267886,'Driver','Rummy', 'Arnon',85000,200989),
(555799,'Barista','Charles','Ryan',98000,203420);

INSERT INTO delivery(delivery_ID,vehicle_number,delivery_date,driver_ID,steward_ID,delivered_time)
VALUES 
(788890,'M88U KER','2022-10-11',830500,100067,'10:30:45'),
(906433,'SMII 12X','2022-06-08',500789,100067,'15:10:10'),
(324579,'TA25 MAK','2022-05-26',267886,675443,'09:06:50'),
(444589,'CSIY NET','2022-05-26',511789,511222,'09:55:50'),
(980097,'DM1T KER','2022-09-02',830500,675443,'14:37:20'),
(100098,'TA2T MAK','2022-02-26',511789,675543,'16:44:56'),
(134566,'CSI1 NET','2022-11-10',500789,675543,'12:50:10');

INSERT INTO delivery_receive(delivery_ID, user_ID)
VALUES 
(788890,'A00045'),
(906433,'A00045'),
(324579,'A45300'),
(444589,'E05678'),
(980097,'R66789'),
(100098,'B57005'),
(134566,'B57005');

INSERT INTO delivery_staff(employee_ID, driver_license_number)
VALUES
(830500,'URE504124XA9UK'),
(500789,'YLE554923XA0KC'),
(511789,'QFV717243ZA8MN'),
(267886,'ZZE411631JQ6VB');

INSERT INTO delivery_vehicles_allowed(employee_ID, vehicles_allowed)
VALUES
(830500,'Car'),
(830500,'Moped'),
(830500,'Motorcycle'),
(830500,'Bicycle'),
(500789,'Car'),
(500789,'Motorcycle'),
(511789,'Car'),
(267886,'Car');

INSERT INTO employee_address(employee_ID, address)
VALUES
(511222, '59,Warren St,West Hatch'),
(207990, '66,High Street,Ashill'),
(200989, '46,Roman Rd,Leckhampstead'),
(202780, '60,Henley Road,Bournbrook'),
(202780, '69,Broad Street,Lower Swell'),
(675543, '79,Simone Weil Avenue,Waytown'),
(100067, '76,Crescent Avenue,Drumlemble'),
(830500, '2,Quay Street,Nedging TYE'),
(500789,'6,Seaford Road,Culgower'),
(190078, '57,Union Terrace,Lochawe'),
(190078, '13,Lairg Road,New Winton'),
(675443, 'S44,Fordham Rd,Halfway Houses'),
(203420, '71,Ash Lane,Yaverland'),
(511789,"7,Argyll Road,Llandefaelog-Tre'R-Graig"),
(267886,'86,Harrogate Road,Saddington'),
(555799,'68,Henley Road,Bourton');

INSERT INTO employee_contact_number(employee_ID, contact_number)
VALUES
(511222, '+447878061681'),
(207990, '+447885619683'),
(200989, '+447847985395'),
(200989, '+447831965208'),
(202780, '+447760056457'),
(202780, '+447925840713'),
(100067, '+447706441475'),
(830500, '+447703839120'),
(500789,'+447031309766'),
(675543, '+447938834700'),
(190078, '+447955920132'),
(190078, '+447924555791'),
(675443, '+447786975325'),
(203420, '+447851066584'),
(511789,'+447061044919'),
(267886,'+447830606399'),
(555799,'+447085436640');

INSERT INTO manager_details(employee_ID, employment_peroid_years, division_in_charge)
VALUES
(207990, 4, 'Cleaning'),
(200989, 7,'Delivery'),
(202780, 10,'Delivery tracking'),
(203420, 11,'Production');

INSERT INTO product(product_ID, product_name, product_description, product_type, price)
VALUES
('HBD587913', 'Espresso','Espresso is a kind of strong 
coffee made by forcing steam or boiling water through ground, dark-roast coffee beans.','hot beverage',3.70),
('HBD501255', 'Affogato', 'Affogato is a classic Italian 
dessert that features a scoop of vanilla ice cream covered in a warm shot of espresso.', 'hot beverage',5.70),
('CBD566541', 'Iced Horchata Latte', 'A combination of a Latin American 
favorite and an American café staple, the iced horchata latte brings together the 
sweet heady-spiced goodness of horchata and the earthy sweetness of a café latte.','cold beverage',3.75),
('CBD165890', 'La Colombe Triple Latte', 'This iced coffee upgrade has the 
classic full taste and texture of a true cold latte, complete with a frothy layer of milk and 3 shots of espresso.', 'cold beverage',6.30),
('SNA483227', 'Muffins', 'A quick bread made of batter containing egg 
and baked in a pan having cuplike molds.', 'snack',2.70),
('CBD622213', 'Iced Lavender Mint Matcha Latte',default, 'cold beverage',7.70),
('CAK711123', 'Chocolate coconut cake', 'An irresistible cake with the dense aroma of 
brown sugar with creamy texture of coconut.',  'cake',5.60),
('HBD661789', 'Mocha', 'It is a variant of a latte, in the sense that 
it is often 1/3 espresso and 2/3 steamed milk. However, a chocolate flavour is added, and this can be milk or dark.', 'hot beverage',5.40);

INSERT INTO steward_details(employee_ID, city_assigned)
VALUES
(511222, 'Chiswick'),
(100067, 'Greenwich'),
(675543, 'Bromley'),
(675443, 'Stratford');

INSERT INTO user_card_details(card_number,card_holder)
VALUES
('498711234522', 'Ruby Wilson'),
('487643212234', 'Arnol Jhonson'),
('497654112312', 'Olivia Elizabeth');

INSERT INTO order_details(order_ID,received_date,received_time,prepaired_time,delivery_ID,prepared_employee_ID,user_ID,payment_ID)
VALUES
('QQR78190','2022-10-11','09:57:17','10:05:03',788890,555799,'A00045','PDA267789'),
('UPW88930','2022-09-02','14:00:03','14:10:23',980097,555799,'R66789','PDR789911'),
('HJK99040','2022-05-26','09:00:20','09:13:10',444589,555799,'E05678','PDY233211'),
('BBN11123','2022-05-26','08:35:02','08:42:22',324579,555799,'A45300','POI556789'),
('XXA66788','2022-06-08','14:41:23','14:49:33',906433,555799,'A00045','POQ498112'),
('REL78644','2022-02-26','16:12:36','16:20:36',100098,555799,'B57005','POG677754'),
('CXA45112','2022-11-10','12:00:40','12:17:28',134566,555799,'B57005','POV580009');

INSERT INTO order_contents(order_ID,product_ID,quantity)
VALUES
('QQR78190','HBD587913',1),
('QQR78190','CBD566541',2),
('QQR78190','CBD165890',1),
('UPW88930','SNA483227',2),
('HJK99040','HBD661789',1),
('HJK99040','CBD165890',1),
('BBN11123','CAK711123',1),
('XXA66788','HBD501255',2),
('REL78644','CBD622213',1),
('CXA45112','CBD622213',2);

INSERT INTO payment_on_delivery(payment_ID,payment_date,total,verified_time,steward_ID,receipt_number)
VALUES
('PDA267789','2022-10-11',17.50,'10:32:00',100067,'IP123D837'),
('PDR789911','2022-09-02',5.40,'14:41:23',675443,'QT667U009'),
('PDY233211','2022-05-26',11.70,'09:57:20',511222,'YO007L909');

INSERT INTO payment_online(payment_ID,payment_date,total,verified_time,steward_ID,card_number)
VALUES
('POI556789','2022-05-26',5.60,'08:35:02',675443,'498711234522'),
('POQ498112','2022-06-08',11.40,'14:41:23',100067,'487643212234'),
('POG677754','2022-02-26',7.70,'16:12:36',675543,'497654112312'),
('POV580009','2022-11-10',15.40,'12:00:40',675543,'497654112312');
