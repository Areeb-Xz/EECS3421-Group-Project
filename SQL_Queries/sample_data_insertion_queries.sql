-- STEP 1: INSERT USERS FIRST (No dependencies)
INSERT INTO [User] ([Name], Email, PhoneNumber, PasswordHash, DateCreated) VALUES
('John Smith', 'john.smith@email.com', '416-555-0100', 'hashed_pwd_123_secure', GETDATE()),
('Sarah Johnson', 'sarah.johnson@email.com', '416-555-0101', 'hashed_pwd_456_secure', GETDATE()),
('Michael Chen', 'michael.chen@email.com', '416-555-0102', 'hashed_pwd_789_secure', GETDATE()),
('Emily Davis', 'emily.davis@email.com', '416-555-0103', 'hashed_pwd_012_secure', GETDATE()),
('Alex Williams', 'alex.williams@email.com', '416-555-0104', 'hashed_pwd_345_secure', GETDATE()),
('Jessica Brown', 'jessica.brown@email.com', '416-555-0105', 'hashed_pwd_678_secure', GETDATE()),
('David Martinez', 'david.martinez@email.com', '416-555-0106', 'hashed_pwd_901_secure', GETDATE());

-- STEP 2: INSERT CREDIT CARDS (Requires User)
INSERT INTO CreditCard (CreditCardNum, UserID, CardType, ExpiryDate, CVC, PostalCode) VALUES
('4532015112830366', 1, 'Visa', '12/26', '123', 'M5H 2N2'),
('5425233010103442', 2, 'Mastercard', '08/25', '456', 'M4B 1B3'),
('378282246310005', 3, 'Amex', '06/27', '1234', 'M1A 1A1'),
('4916338506082832', 4, 'Visa', '03/28', '789', 'L5B 1C3'),
('5105105105105100', 5, 'Mastercard', '09/26', '321', 'M5V 1Y7');

-- STEP 3: INSERT GIFT CARDS (Requires User)
INSERT INTO GiftCard (GiftCardNum, UserID, BalanceAmount) VALUES
('9000001234567890', 1, 150.00),
('9000001234567891', 2, 75.50),
('9000001234567892', 3, 200.00),
('9000001234567893', 4, 50.00),
('9000001234567894', 5, 100.00),
('9000001234567895', 6, 300.00);

-- STEP 4: INSERT GENRES (Master - No dependencies)
INSERT INTO [Genre] (GenreName) VALUES
('Action'),
('Comedy'),
('Drama'),
('Horror'),
('Romance'),
('Science Fiction'),
('Animation'),
('Thriller'),
('Adventure'),
('Documentary');

-- STEP 5: INSERT SEAT CATEGORIES (Master - No dependencies)
INSERT INTO SeatCategory (CategoryName, BasePriceModifier, IsAccessible) VALUES
('Standard', 1.0, 0),
('VIP', 1.5, 0),
('D-Box Motion', 1.75, 0),
('Accessible', 1.0, 1);

-- STEP 6: INSERT CAST MEMBERS (Master - No dependencies)
INSERT INTO CastMember ([Name]) VALUES
('Tom Cruise'),
('Scarlett Johansson'),
('Ryan Gosling'),
('Emma Stone'),
('Leonardo DiCaprio'),
('Zendaya'),
('Timothée Chalamet'),
('Cillian Murphy'),
('Robert Downey Jr.'),
('Gal Gadot');

-- STEP 7: INSERT SNACKS (Master - No dependencies)
INSERT INTO Snack (SnackName, Category, Price, IsCombo, IsAvailable) VALUES
('Small Popcorn', 'Popcorn', 6.99, 0, 1),
('Large Popcorn', 'Popcorn', 9.99, 0, 1),
('Buttered Popcorn', 'Popcorn', 8.49, 0, 1),
('Small Coca-Cola', 'Beverage', 5.99, 0, 1),
('Large Coca-Cola', 'Beverage', 7.99, 0, 1),
('Gummy Bears', 'Candy', 5.49, 0, 1),
('Chocolate Chip Cookie', 'Candy', 4.99, 0, 1),
('Nachos with Cheese', 'Food', 8.99, 0, 1),
('Hot Dog', 'Food', 7.49, 0, 1),
('Combo - Popcorn + Drink', 'Combo', 12.99, 1, 1),
('Ice Cream', 'Candy', 6.99, 0, 1),
('Candy Mix', 'Candy', 4.49, 0, 1),
('Water Bottle', 'Beverage', 3.99, 0, 1),
('Nachos Cheese Sauce', 'Food', 2.99, 0, 1),
('Monster Energy Drink', 'Beverage', 6.99, 0, 1);

-- STEP 8: INSERT MOVIES (Master - No dependencies)
INSERT INTO Movie (Title, Synopsis, IMDBRating, [Language], ReleaseDate, Duration, PG_Rating) VALUES
('Inception', 'A skilled thief who steals corporate secrets through dream-sharing technology.', 8.8, 'en', '2010-07-16', 148, '12A'),
('The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption.', 9.3, 'en', '1994-10-14', 142, '15'),
('Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity survival.', 8.6, 'en', '2014-11-07', 169, '12A'),
('La La Land', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love.', 8.0, 'en', '2016-12-09', 128, '12A'),
('Oppenheimer', 'The story of American scientist J. Robert Oppenheimer and his role in developing the atomic bomb.', 8.4, 'en', '2023-07-21', 180, '15'),
('Spider-Man Across the Spider-Verse', 'Miles and his allies journey across the multiverse.', 8.5, 'en', '2023-06-02', 140, '12A'),
('Dune Part Two', 'Paul leads the Fremen in a war against those who destroyed his family.', 8.1, 'en', '2024-02-29', 166, '12A'),
('Toy Story 4', 'When a new toy called Forky joins Woody and the gang, a road trip ensues.', 7.7, 'en', '2019-06-21', 100, 'G'),
('The Dark Knight', 'Batman faces the Joker, a criminal mastermind who wants to plunge the city into anarchy.', 9.0, 'en', '2008-07-18', 152, '12A'),
('Avatar The Way of Water', 'Jake Sully leads the Navi against a new threat on Pandora.', 7.9, 'en', '2022-12-16', 192, '12A');

-- STEP 9: INSERT MOVIE GENRES (M:M)
INSERT INTO MovieGenre (MovieID, GenreID) VALUES
(1, 6), (1, 8),
(2, 3),
(3, 6), (3, 9),
(4, 3), (4, 5),
(5, 3), (5, 8),
(6, 6), (6, 1),
(7, 1), (7, 6),
(8, 7),
(9, 1), (9, 8),
(10, 6), (10, 9);

-- STEP 10: INSERT MOVIE CAST (M:M)
INSERT INTO MovieCast (MovieID, CastID, RoleType) VALUES
(1, 1, 'Actor'),
(3, 5, 'Actor'),
(4, 3, 'Actor'),
(4, 4, 'Actor'),
(5, 8, 'Actor'),
(6, 6, 'Actor'),
(7, 7, 'Actor'),
(9, 5, 'Actor'),
(10, 2, 'Actor');

-- STEP 11: INSERT MOVIE MEDIA
INSERT INTO MovieMedia (MovieID, MediaType, MediaURL, UploadDate) VALUES
(1, 'Poster', 'https://cineplex.com/media/inception-poster.jpg', GETDATE()),
(1, 'Trailer', 'https://cineplex.com/media/inception-trailer.mp4', GETDATE()),
(3, 'Poster', 'https://cineplex.com/media/interstellar-poster.jpg', GETDATE()),
(4, 'Poster', 'https://cineplex.com/media/lalaland-poster.jpg', GETDATE()),
(5, 'Poster', 'https://cineplex.com/media/oppenheimer-poster.jpg', GETDATE()),
(6, 'Poster', 'https://cineplex.com/media/spiderman-poster.jpg', GETDATE()),
(7, 'Poster', 'https://cineplex.com/media/dune-poster.jpg', GETDATE()),
(8, 'Poster', 'https://cineplex.com/media/toystory-poster.jpg', GETDATE()),
(9, 'Trailer', 'https://cineplex.com/media/darkknight-trailer.mp4', GETDATE()),
(10, 'Poster', 'https://cineplex.com/media/avatar-poster.jpg', GETDATE());

-- STEP 12: INSERT SCENE+ CARDS
INSERT INTO ScenePlusCard (SceneCardNumber, PointsBalance, IsActive) VALUES
('SCENE001', 500, 1),
('SCENE002', 250, 1),
('SCENE003', 1000, 1),
('SCENE004', 0, 1),
('SCENE005', 750, 1),
('SCENE006', 350, 1),
('SCENE007', 2000, 1);

-- STEP 13: INSERT CINECLUB MEMBERSHIPS (Requires User)
INSERT INTO CineClubMembership (UserID, MembershipType, StartDate, RenewalDate, PaymentFrequency) VALUES
(1, 'Standard', '2024-01-15', '2025-01-15', 'Annual'),
(2, 'Premium', '2024-06-01', '2025-06-01', 'Annual'),
(4, 'VIP', '2023-11-20', '2024-11-20', 'Annual'),
(5, 'Standard', '2024-09-10', '2025-09-10', 'Annual'),
(6, 'Premium', '2024-04-05', '2025-04-05', 'Annual');

-- STEP 14: INSERT CINECLUB TICKETS (Requires CineClubMembership)
INSERT INTO CineClubTicket (MembershipID, TicketType, [Status], Price, IssueDate) VALUES
(1, 'Complimentary', 'Active', 0.00, GETDATE()),
(2, 'Discounted', 'Active', 8.99, GETDATE()),
(3, 'Premium', 'Active', 14.99, GETDATE()),
(1, 'Discounted', 'Redeemed', 8.99, DATEADD(DAY, -30, GETDATE())),
(4, 'Complimentary', 'Active', 0.00, GETDATE()),
(5, 'Premium', 'Active', 14.99, GETDATE());

-- STEP 15: INSERT COMPLEX
INSERT INTO [Complex] ([Name], StreetAddress, City, Province, PostalCode, ContactNumber) VALUES
('Cineplex Odeon Yonge-Dundas', '10 Dundas Street West', 'Toronto', 'ON', 'M5G 2C2', '416-515-0500'),
('Cineplex Odeon Scotiabank Theatre', '259 Richmond Street West', 'Toronto', 'ON', 'M5V 1Y7', '416-863-0500'),
('Cineplex Odeon Forum Theatre', '1 York Street', 'Toronto', 'ON', 'M5J 0N6', '416-815-0500'),
('Cineplex Odeon Mississauga', '1 Dundas Street West', 'Mississauga', 'ON', 'L5B 1C3', '905-271-1234');

-- STEP 16: INSERT HALLS (Requires Complex)
INSERT INTO Hall (ComplexID, HallNumber, SeatCapacity, HasVIP, HasDBox) VALUES
(1, 1, 200, 1, 0),
(1, 2, 180, 0, 1),
(1, 3, 150, 1, 1),
(2, 1, 250, 1, 1),
(2, 2, 180, 0, 0),
(3, 1, 120, 1, 0),
(4, 1, 200, 0, 1),
(4, 2, 150, 1, 0);

-- STEP 17: INSERT SEATS (Requires Hall, SeatCategory)
INSERT INTO Seat (HallID, SeatRow, SeatColumn, SeatCategoryID) VALUES
(1, 'A', 1, 1), (1, 'A', 2, 1), (1, 'A', 3, 1), (1, 'A', 4, 1), (1, 'A', 5, 1),
(1, 'B', 1, 1), (1, 'B', 2, 2), (1, 'B', 3, 2), (1, 'B', 4, 2), (1, 'B', 5, 1),
(1, 'C', 1, 1), (1, 'C', 2, 1), (1, 'C', 3, 3), (1, 'C', 4, 3), (1, 'C', 5, 1),
(1, 'D', 1, 4), (1, 'D', 2, 1), (1, 'D', 3, 1), (1, 'D', 4, 1), (1, 'D', 5, 4),
(2, 'A', 1, 1), (2, 'A', 2, 1), (2, 'A', 3, 1), (2, 'A', 4, 1), (2, 'A', 5, 1),
(2, 'B', 1, 2), (2, 'B', 2, 2), (2, 'B', 3, 2), (2, 'B', 4, 2), (2, 'B', 5, 2),
(2, 'C', 1, 1), (2, 'C', 2, 1), (2, 'C', 3, 1), (2, 'C', 4, 1), (2, 'C', 5, 1),
(2, 'D', 1, 3), (2, 'D', 2, 3), (2, 'D', 3, 3), (2, 'D', 4, 3), (2, 'D', 5, 3),
(3, 'A', 1, 1), (3, 'A', 2, 1), (3, 'A', 3, 2), (3, 'A', 4, 2), (3, 'A', 5, 1),
(3, 'B', 1, 3), (3, 'B', 2, 3), (3, 'B', 3, 3), (3, 'B', 4, 3), (3, 'B', 5, 3),
(3, 'C', 1, 4), (3, 'C', 2, 1), (3, 'C', 3, 1), (3, 'C', 4, 1), (3, 'C', 5, 4);

-- STEP 18: INSERT SCREENINGS (Requires Hall, Movie)
INSERT INTO Screening (HallID, MovieID, ScreeningDate, StartTime, EndTime, Is3D) VALUES
(1, 1, '2025-11-21', '14:00:00', '15:48:00', 0),
(1, 1, '2025-11-21', '19:30:00', '21:18:00', 0),
(2, 3, '2025-11-21', '15:00:00', '16:49:00', 1),
(2, 3, '2025-11-21', '19:00:00', '20:49:00', 1),
(3, 4, '2025-11-21', '16:30:00', '18:38:00', 0),
(4, 5, '2025-11-22', '10:00:00', '11:20:00', 0),
(5, 2, '2025-11-22', '14:00:00', '15:42:00', 0),
(1, 7, '2025-11-22', '18:00:00', '19:46:00', 0),
(6, 9, '2025-11-22', '16:00:00', '17:32:00', 0),
(7, 10, '2025-11-23', '15:30:00', '17:42:00', 0);

-- STEP 19: INSERT CURRENTLY PLAYING (M:M - Requires Complex, Movie)
INSERT INTO CurrentlyPlaying (ComplexID, MovieID, IsFeatured, StartDate, EndDate) VALUES
(1, 1, 1, '2025-11-21', '2025-11-27'),
(1, 3, 1, '2025-11-21', '2025-11-27'),
(1, 4, 0, '2025-11-21', '2025-11-27'),
(2, 5, 1, '2025-11-22', '2025-11-28'),
(2, 2, 0, '2025-11-22', '2025-11-28'),
(3, 7, 0, '2025-11-21', '2025-11-27'),
(4, 8, 0, '2025-11-21', '2025-11-27'),
(3, 9, 1, '2025-11-22', '2025-11-28');

-- STEP 20: INSERT SEAT LOCKS (Requires User, Seat, Screening)
INSERT INTO SeatLock (UserID, SeatID, ScreeningID, LockStartTime, LockExpiryTime, [Status]) VALUES
(1, 1, 1, GETDATE(), DATEADD(MINUTE, 10, GETDATE()), 'Active'),
(2, 21, 3, DATEADD(MINUTE, -15, GETDATE()), DATEADD(MINUTE, -5, GETDATE()), 'Expired'),
(3, 41, 5, DATEADD(MINUTE, -5, GETDATE()), DATEADD(MINUTE, 5, GETDATE()), 'Active'),
(5, 2, 1, GETDATE(), DATEADD(MINUTE, 10, GETDATE()), 'Active'),
(6, 31, 3, DATEADD(MINUTE, -20, GETDATE()), DATEADD(MINUTE, -10, GETDATE()), 'Expired');

-- STEP 21: INSERT BOOKINGS (Requires User, Screening)
INSERT INTO Booking (UserID, ScreeningID, BookingTime, [Status], TotalPrice) VALUES
(1, 1, GETDATE(), 'Confirmed', 29.98),
(2, 3, GETDATE(), 'Confirmed', 19.99),
(3, 4, GETDATE(), 'Confirmed', 39.97),
(4, 5, GETDATE(), 'Pending', 14.99),
(5, 6, GETDATE(), 'Confirmed', 44.96),
(6, 9, DATEADD(DAY, -1, GETDATE()), 'Confirmed', 29.98),
(7, 10, DATEADD(DAY, -2, GETDATE()), 'Confirmed', 34.97);

-- STEP 22: INSERT SEAT BOOKINGS (Associative - Requires Booking, Seat, Screening)
INSERT INTO seatBooking (BookingID, SeatID, ScreeningID, SeatCost, SeatBookingStatus) VALUES
(1, 1, 1, 14.99, 'Booked'),
(1, 2, 1, 14.99, 'Booked'),
(2, 21, 3, 19.99, 'Booked'),
(3, 26, 4, 19.99, 'Booked'),
(3, 27, 4, 19.99, 'Booked'),
(4, 41, 5, 14.99, 'Booked'),
(5, 6, 6, 22.48, 'Booked'),
(5, 7, 6, 22.48, 'Booked'),
(6, 51, 9, 14.99, 'Booked'),
(7, 31, 10, 17.49, 'Booked');

-- STEP 23: INSERT SNACK ORDERS (Requires User, Complex)
INSERT INTO SnackOrder (UserID, ComplexID, OrderTime) VALUES
(1, 1, GETDATE()),
(2, 1, GETDATE()),
(3, 2, GETDATE()),
(5, 1, GETDATE()),
(6, 3, DATEADD(DAY, -1, GETDATE())),
(7, 4, DATEADD(DAY, -2, GETDATE()));

-- STEP 24: INSERT SNACK ORDER ITEMS (Associative - Requires SnackOrder, Snack)
INSERT INTO SnackOrderItem (SnackOrderID, SnackID, Quantity, PricePerUnit, Subtotal) VALUES
(1, 1, 2, 6.99, 13.98),
(1, 4, 2, 5.99, 11.98),
(2, 10, 1, 12.99, 12.99),
(3, 3, 1, 8.49, 8.49),
(3, 5, 1, 7.99, 7.99),
(4, 1, 1, 6.99, 6.99),
(4, 4, 1, 5.99, 5.99),
(5, 2, 1, 9.99, 9.99),
(5, 6, 2, 5.49, 10.98),
(6, 10, 1, 12.99, 12.99);

-- STEP 25: INSERT PAYMENTS (Requires Booking, SnackOrder - both optional)
INSERT INTO [Payment] (BookingID, SnackOrderID, PaymentMethod, StartTime, EndTime, AmountPaid, Taxes, TicketSubtotal, SnackSubtotal, TotalPaid) VALUES
(1, NULL, 'CreditCard', GETDATE(), GETDATE(), 29.98, 3.90, 29.98, NULL, 33.88),
(2, NULL, 'ScenePlusCard', GETDATE(), GETDATE(), 19.99, 2.60, 19.99, NULL, 22.59),
(3, NULL, 'CreditCard', GETDATE(), GETDATE(), 39.97, 5.20, 39.97, NULL, 45.17),
(4, NULL, 'GiftCard', GETDATE(), GETDATE(), 14.99, 1.95, 14.99, NULL, 16.94),
(5, NULL, 'CreditCard', GETDATE(), GETDATE(), 44.96, 5.84, 44.96, NULL, 50.80),
(6, NULL, 'Visa', DATEADD(DAY, -1, GETDATE()), DATEADD(DAY, -1, GETDATE()), 29.98, 3.90, 29.98, NULL, 33.88),
(7, NULL, 'Mastercard', DATEADD(DAY, -2, GETDATE()), DATEADD(DAY, -2, GETDATE()), 34.97, 4.55, 34.97, NULL, 39.52),
(NULL, 1, 'CreditCard', GETDATE(), GETDATE(), 25.96, 3.37, NULL, 25.96, 29.33),
(NULL, 2, 'GiftCard', GETDATE(), GETDATE(), 12.99, 1.69, NULL, 12.99, 14.68),
(NULL, 5, 'CreditCard', DATEADD(DAY, -1, GETDATE()), DATEADD(DAY, -1, GETDATE()), 20.97, 2.73, NULL, 20.97, 23.70);

-- STEP 26: INSERT CREDIT CARD PAYMENTS (Associative - Requires Payment, CreditCard)
INSERT INTO CreditCardPayment (PaymentID, CreditCardNum, AmountCharged) VALUES
(1, '4532015112830366', 33.88),
(3, '5425233010103442', 45.17),
(5, '378282246310005', 50.80),
(6, '4916338506082832', 33.88),
(7, '5105105105105100', 39.52),
(8, '4532015112830366', 29.33),
(10, '5425233010103442', 23.70);

-- STEP 27: INSERT GIFT CARD PAYMENTS (Associative - Requires Payment, GiftCard)
INSERT INTO GiftCardPayment (PaymentID, GiftCardNum, AmountDeducted, TransactionTime) VALUES
(4, '9000001234567890', 16.94, GETDATE()),
(9, '9000001234567891', 14.68, GETDATE());

-- STEP 28: INSERT SCENE REDEMPTIONS (Associative - Requires Payment, ScenePlusCard)
INSERT INTO SceneRedemption (PaymentID, SceneCardNumber, PointsUsed, AmountCovered, RedemptionTime) VALUES
(2, 'SCENE002', 100, 22.59, GETDATE()),
(2, 'SCENE003', 50, 5.00, GETDATE());

-- STEP 29: INSERT RECEIPTS (Requires Payment, User, Booking, SnackOrder)
INSERT INTO Receipt (PaymentID, UserID, BookingID, SnackOrderID, PurchaseDateTime, Total) VALUES
(1, 1, 1, NULL, GETDATE(), 33.88),
(2, 2, 2, NULL, GETDATE(), 22.59),
(3, 3, 3, NULL, GETDATE(), 45.17),
(4, 4, 4, NULL, GETDATE(), 16.94),
(5, 5, 5, NULL, GETDATE(), 50.80),
(6, 6, 6, NULL, DATEADD(DAY, -1, GETDATE()), 33.88),
(7, 7, 7, NULL, DATEADD(DAY, -2, GETDATE()), 39.52),
(8, 1, NULL, 1, GETDATE(), 29.33),
(9, 2, NULL, 2, GETDATE(), 14.68),
(10, 5, NULL, 5, DATEADD(DAY, -1, GETDATE()), 23.70);

-- FINAL VERIFICATION: Count All Tables
PRINT 'FINAL DATA VERIFICATION REPORT';

SELECT 'Genre' AS [Table Name], COUNT(*) AS [Record Count] FROM [Genre]
UNION ALL SELECT 'SeatCategory', COUNT(*) FROM SeatCategory
UNION ALL SELECT 'CastMember', COUNT(*) FROM CastMember
UNION ALL SELECT 'Snack', COUNT(*) FROM Snack
UNION ALL SELECT 'CreditCard', COUNT(*) FROM CreditCard
UNION ALL SELECT 'GiftCard', COUNT(*) FROM GiftCard
UNION ALL SELECT 'Movie', COUNT(*) FROM Movie
UNION ALL SELECT 'MovieGenre', COUNT(*) FROM MovieGenre
UNION ALL SELECT 'MovieCast', COUNT(*) FROM MovieCast
UNION ALL SELECT 'MovieMedia', COUNT(*) FROM MovieMedia
UNION ALL SELECT '[User]', COUNT(*) FROM [User]
UNION ALL SELECT 'ScenePlusCard', COUNT(*) FROM ScenePlusCard
UNION ALL SELECT 'CineClubMembership', COUNT(*) FROM CineClubMembership
UNION ALL SELECT 'CineClubTicket', COUNT(*) FROM CineClubTicket
UNION ALL SELECT '[Complex]', COUNT(*) FROM [Complex]
UNION ALL SELECT 'Hall', COUNT(*) FROM Hall
UNION ALL SELECT 'Seat', COUNT(*) FROM Seat
UNION ALL SELECT 'Screening', COUNT(*) FROM Screening
UNION ALL SELECT 'CurrentlyPlaying', COUNT(*) FROM CurrentlyPlaying
UNION ALL SELECT 'SeatLock', COUNT(*) FROM SeatLock
UNION ALL SELECT 'Booking', COUNT(*) FROM Booking
UNION ALL SELECT 'seatBooking', COUNT(*) FROM seatBooking
UNION ALL SELECT 'SnackOrder', COUNT(*) FROM SnackOrder
UNION ALL SELECT 'SnackOrderItem', COUNT(*) FROM SnackOrderItem
UNION ALL SELECT '[Payment]', COUNT(*) FROM [Payment]
UNION ALL SELECT 'CreditCardPayment', COUNT(*) FROM CreditCardPayment
UNION ALL SELECT 'GiftCardPayment', COUNT(*) FROM GiftCardPayment
UNION ALL SELECT 'SceneRedemption', COUNT(*) FROM SceneRedemption
UNION ALL SELECT 'Receipt', COUNT(*) FROM Receipt
ORDER BY [Table Name];