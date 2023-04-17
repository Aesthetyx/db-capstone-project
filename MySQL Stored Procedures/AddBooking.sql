CREATE DEFINER=`admin`@`%` PROCEDURE `AddBooking`(booking_date DATE, booking_time TIME, table_number INT, number_of_guests INT, customer_id INT)
BEGIN
DECLARE booking_id INT;
INSERT INTO Bookings (BookingDate, BookingTime, TableNumber, NumberOfGuests, CustomerID) 
VALUES (booking_date, booking_time, table_number, number_of_guests, customer_id);
SET booking_id = (SELECT BookingID FROM Bookings WHERE BookingDate = booking_date AND BookingTime = booking_time AND TableNumber = table_number AND NumberOfGuests = number_of_guests AND CustomerID = customer_id);
SELECT CONCAT("New booking ", booking_id, " confirmed for table ", table_number, " for ", number_of_guests, " guests at ", booking_time, " on ", booking_date) AS Confirmation;
END