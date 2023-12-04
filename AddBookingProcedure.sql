CREATE DEFINER=`newuser`@`%` PROCEDURE `AddBooking`(
    IN p_TableNo INT,
    IN p_CustomerID INT,
    IN p_BookingSlot DATETIME
)
BEGIN
    INSERT INTO `mydb`.`Bookings` (`TableNo`, `CustomerID`, `BookingSlot`)
    VALUES (p_TableNo, p_CustomerID, p_BookingSlot);
END