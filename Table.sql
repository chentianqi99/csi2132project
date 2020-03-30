set search_path = "project";

set search_path = "project";

CREATE TABLE guests_info(
	g_firstName VARCHAR(20),
	g_lastName VARCHAR(20),
	g_id INTEGER,
	g_birth DATE,
	g_address VARCHAR(20),
	g_email VARCHAR(20),
	g_phone VARCHAR(20),
	PRIMARY KEY(g_id)
);

CREATE TABLE branch_info(
	b_name VARCHAR(20),
	b_id INTEGER,
	b_city VARCHAR(20),
	b_province VARCHAR(20),
	b_country VARCHAR(20),
	PRIMARY KEY(b_id)
);

CREATE TABLE host_info(
	h_id INTEGER,
	h_name VARCHAR(20),
	h_address VARCHAR(20),
	h_email VARCHAR(20),
	h_phone INTEGER,
	PRIMARY KEY(h_id)
);

CREATE TABLE payment(
	g_id INTEGER,
	h_id INTEGER,
	receipt_number VARCHAR(20),
	typeOfPayment VARCHAR(20),
	amountOfPayment NUMERIC(8,2),
	paymentStatus VARCHAR(20),
	PRIMARY KEY(typeOfPayment),
	FOREIGN KEY(g_id) REFERENCES guests_info,
	FOREIGN KEY (h_id) REFERENCES host_info
);

CREATE TABLE Property_info(
	h_id INTEGER,
	b_id INTEGER,
	available_date DATE,
	room_type VARCHAR(20),
	p_address VARCHAR(20),
	p_type VARCHAR(20),
	p_location VARCHAR(20),
	p_price NUMERIC(8,2),
	rented BOOLEAN,
	dates DATE,
	PRIMARY KEY(p_address),
	FOREIGN KEY(h_id) references host_info,
	FOREIGN KEY(b_id) references branch_info
);

CREATE TABLE agreement(
	g_id INTEGER,
	h_id INTEGER,
	signingDate DATE,
	startDate DATE,
	endDate DATE,
	PRIMARY KEY(signingDate),
	FOREIGN KEY(g_id) REFERENCES guests_info,
	FOREIGN KEY (h_id) REFERENCES host_info
);

CREATE TABLE review_rating(
	p_address VARCHAR(20),
	rating NUMERIC(8,2),
	communication VARCHAR(20),
	cleanliness VARCHAR(20),
	value_comment VARCHAR(20),
	PRIMARY KEY(rating),
	FOREIGN KEY(p_address) references property_info
);


