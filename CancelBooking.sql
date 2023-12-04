CREATE PROCEDURE `CancelBooking` (
    IN p_BookingID INT
)
BEGIN
    DELETE FROM `mydb`.`Bookings`
    WHERE `BookingID` = p_BookingID;
END