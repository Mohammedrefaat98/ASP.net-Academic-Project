CREATE table [User](
id int IDENTITY,
first_name varchar(30),
middle_name varchar(30),
last_name varchar(30),
email varchar(30),
[password] varchar(30) not null,
birth_date datetime not null,
age as (year(current_timestamp)) - year(birth_date),
Deactivated int,
Deactivate_time datetime,
PRIMARY KEY(id)
);

CREATE table Viewer(
[user_id] int,
working_place varchar(30),
working_place_type varchar(30),
working_place_description varchar(30),
PRIMARY KEY([user_id]),
Foreign KEY([user_id]) References [User] ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE table Notified_Person(
id int identity,
PRIMARY KEY(id)
);

CREATE table Contributor(
contributor_id int,
years_of_experience int,
portfolio_link varchar(100),
specialization varchar(30),
notified_id int,
PRIMARY KEY(contributor_id),
Foreign KEY(contributor_id) References [User] ON DELETE CASCADE ON UPDATE CASCADE,
Foreign KEY(notified_id) References Notified_Person ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE table Staff(
staff_id int,
hire_date int,
working_hours decimal(4,2),
payment_rate decimal(12,2),
total_salary as payment_rate * working_hours,
notified_id int,
PRIMARY KEY(staff_id),
Foreign KEY(staff_id) References [User] ON DELETE CASCADE ON UPDATE CASCADE,
Foreign KEY(notified_id) References Notified_Person ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE table Content_manager(
content_manager_id int,
content_type_type varchar(30),
PRIMARY KEY(content_manager_id),
Foreign KEY(content_manager_id) References Staff ON DELETE CASCADE ON UPDATE CASCADE,
Foreign KEY(content_type_type) References Content_type ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE table Reviewer(
reviewer_id int,
PRIMARY KEY(reviewer_id),
Foreign KEY(reviewer_id) References Staff ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE table [Message](
sent_at datetime,
message_contributer_id int,
message_viewer_id int,
sender_type varchar(30),
[text] varchar(169),
read_at datetime not null,
read_status bit,
PRIMARY KEY(sent_at,message_contributer_id,message_viewer_id,sender_type),
Foreign KEY(message_contributer_id) References Contributor ON DELETE NO ACTION ON UPDATE NO ACTION,
Foreign KEY(message_viewer_id) References Viewer ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE table Category(
[type] varchar(30),
[description] varchar(169),
PRIMARY KEY([type])
);

CREATE table Sub_Category(
sub_category_category_type varchar(30),
[name] varchar(169),
PRIMARY KEY(sub_category_category_type,[name]),
Foreign KEY(sub_category_category_type) References Category ON DELETE no action ON UPDATE no action
);

CREATE table Content_type(
[type] varchar(30),
PRIMARY KEY([type])
);

CREATE table Notification_Object(
id int IDENTITY,
PRIMARY KEY(id),
);


CREATE table Existing_Request(
id int identity,
existing_request_original_content_id int,
existing_request_viewer_id int,
PRIMARY KEY(id),
Foreign KEY(existing_request_original_content_id) References Original_Content ON DELETE CASCADE ON UPDATE CASCADE,
Foreign KEY(existing_request_viewer_id) References Viewer ON DELETE no action ON UPDATE no action,
);

CREATE table New_Request(
id int identity,
accept_status bit,
specified varchar(30),
information varchar(169),
new_request_viewer_id int,
new_request_notif_obj_id int,
new_request_contributer_id int,
requesting_time datetime not null,
PRIMARY KEY(id),
Foreign KEY(new_request_notif_obj_id) References Notification_Object ON DELETE CASCADE ON UPDATE CASCADE,
Foreign KEY(new_request_viewer_id) References Viewer ON DELETE no action ON UPDATE no action,
Foreign KEY(new_request_contributer_id) References Contributor ON DELETE no action ON UPDATE no action,
);

CREATE table Content(
id int identity,
link varchar(169),
uploaded_at datetime not null,
content_contributer_id int,
content_category_type varchar(30),
content_subcategory_name varchar(169),
content_type varchar(30),
PRIMARY KEY(id),
Foreign KEY(content_contributer_id) References Contributor ON DELETE no action ON UPDATE no action,
Foreign KEY(content_category_type,content_subcategory_name) References Sub_Category ON DELETE CASCADE ON UPDATE CASCADE,
Foreign KEY(content_type) References Content_type ON DELETE CASCADE ON UPDATE CASCADE,
);


create table Original_Content(
original_content_id int identity,
original_content_content_manager_id int,
original_content_reviewer_id int,
review_status bit,
filter_status bit,
rating decimal(3,2)
PRIMARY KEY(original_content_id),
Foreign KEY(original_content_id) References Content ON DELETE CASCADE ON UPDATE CASCADE,
Foreign KEY(original_content_reviewer_id) References Reviewer ON DELETE no action ON UPDATE no action,
Foreign KEY(original_content_content_manager_id) References ContentManager ON DELETE no action ON UPDATE no action);


create table New_Content(
new_content_id int identity,
new_content_new_request_id int,
PRIMARY KEY(new_content_id),
Foreign KEY(new_content_id) References Content ON DELETE CASCADE ON UPDATE CASCADE,
Foreign KEY(new_content_new_request_id) References New_Request ON DELETE CASCADE ON UPDATE CASCADE);

create table Comment(
comment_Viewer_id int,
comment_original_content_id int,
[date] datetime not null,
[text] varchar(169),
PRIMARY KEY(comment_Viewer_id,comment_original_content_id,[date]),
Foreign KEY(comment_Viewer_id) References Viewer ON DELETE no action ON UPDATE no action,
Foreign KEY(comment_original_content_id) References Original_Content ON DELETE no action ON UPDATE no action);

create table Rate(
rate_viewer_id int,
rate_original_content_id int,
[date] datetime not null,
rate decimal(2,1),
PRIMARY KEY(rate_viewer_id, rate_original_content_id),
Foreign KEY(rate_viewer_id) References Viewer ON DELETE no action ON UPDATE no action,
Foreign KEY(rate_original_content_id) references Original_Content ON DELETE no action ON UPDATE no action);

create table [Event](
id int identity,
[description] varchar(200),
[location] varchar(200),
city varchar(200),
[time] datetime not null,
entertainer varchar(300),
event_notification_object_id int,
event_viewer_id int,
PRIMARY KEY(id),
Foreign KEY(event_notification_object_id) references Notification_Object ON DELETE CASCADE ON UPDATE CASCADE,
Foreign KEY(event_viewer_id) references Viewer ON DELETE no action ON UPDATE no action);

create table Event_Photos_link(
Event_Photos_link_event_id int,
link varchar(200)
Primary KEY (Event_Photos_link_event_id, link),
Foreign KEY (Event_Photos_link_event_id) references Event ON DELETE no action ON UPDATE no action);

create table Event_Videos_link(
Event_Videos_link_event_id int,
link varchar(200)
Primary KEY (Event_Videos_link_event_id, link),
Foreign KEY (Event_Videos_link_event_id) references Event ON DELETE no action ON UPDATE no action);

create table Advertisement(
id int identity,
[description] varchar(200),
[location] varchar(200),
Advertisement_event_id int,
Advertisement_viewer_id int,
PRIMARY KEY(id),
Foreign KEY(Advertisement_event_id) References [Event] ON DELETE no action ON UPDATE no action,
Foreign KEY(Advertisement_viewer_id) References Viewer ON DELETE no action ON UPDATE no action);

create table Ads_Video_Link(
Ads_Video_Link_advertisement_id int,
link varchar(200),
PRIMARY KEY(Ads_Video_Link_advertisement_id,link),
Foreign KEY(Ads_Video_Link_advertisement_id) References Advertisement ON DELETE no action ON UPDATE no action);

create table Ads_Photos_Link(
Ads_Photos_Link_advertisement_id int,
link varchar(200),
PRIMARY KEY(Ads_Photos_Link_advertisement_id,link),
Foreign KEY(Ads_Photos_Link_advertisement_id) References Advertisement ON DELETE no action ON UPDATE no action);

create table Announcement(
id int identity,
seen_at datetime not null,
sent_at datetime not null,
Announcement_notified_person_id int,
Announcement_notification_object_id int,
PRIMARY KEY(id),
Foreign KEY(Announcement_notified_person_id) References Notified_Person ON DELETE no action ON UPDATE no action,
Foreign KEY(Announcement_notification_object_id) References Notification_Object ON DELETE no action ON UPDATE no action
);

