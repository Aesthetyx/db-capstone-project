CREATE DEFINER=`admin`@`%` PROCEDURE `UpdateBooking`(booking_id INT, booking_date DATE, booking_time TIME, table_number INT, number_of_guests INT)
BEGIN
UPDATE Bookings SET BookingDate = booking_date, BookingTime = booking_time, TableNumber = table_number, NumberOfGuests = number_of_guests WHERE BookingID = booking_id;
SELECT CONCAT("Booking ", booking_id, " updated") AS Confirmation;
END