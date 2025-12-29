-- QUERY 1: TOTAL REVENUE BY PAYMENT METHOD
-- EXPLANATION:
-- This query shows how much revenue was generated from each payment method
-- (Credit Card, Gift Card, Scene+ Points, etc.) over the last 30 days.
-- Useful for Finance team to understand payment trends and customer preferences.
-- Shows: Payment method, transaction count, unique customers, total revenue, and average transaction value.

SELECT 
    p.PaymentMethod,
    COUNT(DISTINCT p.PaymentID) AS [Total Transactions],
    COUNT(DISTINCT ISNULL(b.UserID, so.UserID)) AS [Unique Customers],
    SUM(p.TotalPaid) AS [Total Revenue],
    ROUND(AVG(p.TotalPaid), 2) AS [Average Transaction Value]
FROM [Payment] p
LEFT JOIN Booking b ON p.BookingID = b.BookingID
LEFT JOIN SnackOrder so ON p.SnackOrderID = so.SnackOrderID
WHERE p.StartTime >= DATEADD(DAY, -30, GETDATE())
GROUP BY p.PaymentMethod
ORDER BY [Total Revenue] DESC;

-- QUERY 2: TOP 10 MOVIES BY BOX OFFICE REVENUE
-- This query identifies the best-performing movies based on ticket sales revenue
-- over the last 30 days. Shows how many screenings, total seats sold, revenue,
-- and average ticket price for each movie.
-- Useful for Programming team to make decisions about which movies to continue showing
-- and which ones to replace. Also helps with marketing strategy for top performers.

SELECT TOP 10
    m.Title,
    m.PG_Rating,
    COUNT(DISTINCT s.ScreeningID) AS [Number of Screenings],
    COUNT(DISTINCT sb.seatBookingID) AS [Total Seats Sold],
    SUM(sb.SeatCost) AS [Box Office Revenue],
    ROUND(AVG(sb.SeatCost), 2) AS [Average Ticket Price]
FROM Movie m
INNER JOIN Screening s ON m.MovieID = s.MovieID
INNER JOIN seatBooking sb ON s.ScreeningID = sb.ScreeningID
WHERE s.ScreeningDate >= DATEADD(DAY, -30, GETDATE())
  AND sb.SeatBookingStatus = 'Booked'
GROUP BY m.MovieID, m.Title, m.PG_Rating
ORDER BY [Box Office Revenue] DESC;

-- QUERY 3: TOP 10 CUSTOMERS BY TOTAL SPENDING
-- This query identifies the most valuable customers based on total spending
-- (both tickets and snacks) over all time. Shows customer name, email, number
-- of visits, spending breakdown, and loyalty membership status.
-- Useful for Marketing team to identify VIP customers for special offers,
-- and for Customer Retention strategies.

SELECT TOP 10
    u.UserID,
    u.[Name],
    u.Email,
    COUNT(DISTINCT b.BookingID) AS [Movie Purchases],
    COUNT(DISTINCT so.SnackOrderID) AS [Snack Orders],
    SUM(b.TotalPrice) AS [Ticket Spending],
    SUM(soi.Subtotal) AS [Snack Spending],
    (SUM(ISNULL(b.TotalPrice, 0)) + SUM(ISNULL(soi.Subtotal, 0))) AS [Total Spending],
    CASE 
        WHEN cm.MembershipID IS NOT NULL THEN cm.MembershipType 
        ELSE 'Non-Member' 
    END AS [Loyalty Status]
FROM [User] u
LEFT JOIN Booking b ON u.UserID = b.UserID
LEFT JOIN SnackOrder so ON u.UserID = so.UserID
LEFT JOIN SnackOrderItem soi ON so.SnackOrderID = soi.SnackOrderID
LEFT JOIN CineClubMembership cm ON u.UserID = cm.UserID
GROUP BY u.UserID, u.[Name], u.Email, cm.MembershipID, cm.MembershipType
HAVING COUNT(DISTINCT b.BookingID) + COUNT(DISTINCT so.SnackOrderID) > 0
ORDER BY [Total Spending] DESC;

-- QUERY 4: CURRENT SEAT OCCUPANCY BY SCREENING
-- This query shows real-time seat availability for all upcoming screenings.
-- Displays the movie title, theatre complex, screening date/time, total seats,
-- seats booked, seats available, and occupancy percentage.
-- Useful for Operations team to monitor occupancy rates and identify
-- which screenings are selling well and which may need promotion.

SELECT 
    m.Title,
    c.[Name] AS [Theatre Complex],
    h.HallNumber,
    s.ScreeningDate,
    s.StartTime,
    h.SeatCapacity,
    ISNULL(COUNT(DISTINCT sb.seatBookingID), 0) AS [Seats Booked],
    (h.SeatCapacity - ISNULL(COUNT(DISTINCT sb.seatBookingID), 0)) AS [Seats Available],
    ROUND(
        (ISNULL(COUNT(DISTINCT sb.seatBookingID), 0) * 100.0 / h.SeatCapacity), 2
    ) AS [Occupancy Percentage]
FROM Screening s
INNER JOIN Movie m ON s.MovieID = m.MovieID
INNER JOIN Hall h ON s.HallID = h.HallID
INNER JOIN [Complex] c ON h.ComplexID = c.ComplexID
LEFT JOIN seatBooking sb ON s.ScreeningID = sb.ScreeningID 
    AND sb.SeatBookingStatus = 'Booked'
WHERE s.ScreeningDate >= GETDATE()
GROUP BY m.MovieID, m.Title, c.ComplexID, c.[Name], h.HallID, h.HallNumber, 
         h.SeatCapacity, s.ScreeningID, s.ScreeningDate, s.StartTime
ORDER BY s.ScreeningDate, s.StartTime;

-- QUERY 5: TOP 10 SNACKS BY SALES REVENUE
-- This query shows which concession items generate the most revenue
-- over the last 30 days. Displays snack name, category, units sold,
-- total revenue, and average price per unit.
-- Useful for Concessions Manager to understand which products are best-sellers,
-- manage inventory, and determine pricing strategy for promotions.

SELECT TOP 10
    sn.SnackName,
    sn.Category,
    ROUND(sn.Price, 2) AS [Unit Price],
    SUM(soi.Quantity) AS [Total Quantity Sold],
    SUM(soi.Subtotal) AS [Total Revenue],
    ROUND(AVG(soi.PricePerUnit), 2) AS [Average Price Paid]
FROM Snack sn
INNER JOIN SnackOrderItem soi ON sn.SnackID = soi.SnackID
WHERE soi.SnackOrderID IN 
    (SELECT SnackOrderID FROM SnackOrder 
     WHERE OrderTime >= DATEADD(DAY, -30, GETDATE()))
GROUP BY sn.SnackID, sn.SnackName, sn.Category, sn.Price
ORDER BY [Total Revenue] DESC;