set search_path = "project";

/* query number 1 */
SELECT g_name,p_type,p_price,signingDate,b_name,typeOfPayment,paymentStatus
FROM guests_info,property_info,agreement,branch_info,payment
ORDER BY typeOfPayment ASC, signingDate DESC;

/* query number 2 */
CREATE VIEW GuestListView
AS
SELECT g_name,g_id,g_birth,g_address,g_email,g_phone,b_id
FROM guests_info,branch_info
ORDER BY b_id,g_id;

/* query number 3 */
SELECT T.p_price
FROM property_info as T, property_info as S
WHERE T.p_price<S.P_price and T.rented = true and S.rented = true

/* query number 4 */
SELECT p_address
FROM property_info NATURAL JOIN branch_info NATURAL JOIN review_rating
WHERE rented = true
ORDER BY b_id,rating

/* query number 5 */
SELECT  DISTINCT h_id 
FROM Property_info
WHERE rented=false;

/* query number 6 */
SELECT h_id, b_id, room_type, p_address, p_type, p_location, p_price
FROM Property_info
WHERE rented= true and EXTRACT(DAY FROM dates)= 10;

/* query number 7 */
SELECT e_id, e_name, e_branch_id, e_branch_name, e_salary,m_id,m_name,m_branch_id,m_branch_name,m_salary
FROM manager,employee
WHERE e_salary>=15000 and m_salary>=15000
ORDER BY m_id, e_id;

/* query number 8 */
SELECT g_name, g_id, h_name, p_type, p_address, amountOfPayment, typeOfPayment
FROM guests_info, host_info, Property_info, payment;

/* query number 9 */
UPDATE guests_info
SET g_phone=XXX
WHERE g_id=XXX;

/* query number 10 */
CREATE FUNCTION FirstNameFirst()
RETURNS VARCHAR(20) AS $g_fullName$
BEGIN 
	SELECT CONCAT(g_firstName, ' ', g_lastName) as g_fullName FROM guests_info
	RETURN g_fullName;
END;
$g_fullName$ LANGUAGE plpgsql

