CREATE Procedure Original_Content_Search
@typename varchar(30),
@categoryname varchar(169)
AS

IF @typename is null
Select *
from Content LEFT Join Original_Content On Content.id =
Original_Content.original_content_id
where content_category_type=@categoryname

ELSE If @categoryname is null
Select *
from Content LEFT Join Original_Content On Content.id =
Original_Content.original_content_id
where content_type=@typename

else if @typename is null and @categoryname is null
Print ('SORRY, YOU MUST PUT ANY ONE OF THESE VALUE')

Else
Select *
from Content LEFT Join Original_Content On Content.id =
Original_Content.original_content_id
where content_type=@typename and content_category_type=@categoryname

go

CREATE Procedure Contributor_Search
@fullname varchar(100)
AS
select *
From [User] INNER JOIN Contributor ON [User].id = Contributor.contributor_id
where [User].first_name + ' ' + [User].middle_name + ' ' +[User].last_name =@fullname

go

CREATE Procedure Register_User
@usertype varchar(30),
@email varchar(100),
@password varchar(30),
@firstname varchar(30),
@middlename varchar(30),
@lastname varchar(30),
@birth_date datetime,
@working_place_name varchar(30),
@working_place_type varchar(30),
@working_place_description varchar(169),
@specialization varchar(30),
@portfolio_link varchar(160),
@years_experience int,
@hire_date datetime,
@working_hours decimal (4,2),
@payment_rate decimal(12,2),
@user_id int OUTPUT

AS
declare @idn int
if @usertype= 'Viewer'
begin
insert into [User] values(@firstname,@middlename,@lastname,@email,@password,@birth_date,0,Null)
Select @user_id=[User].id
from [User]
where [User].first_name=@firstname and [User].middle_name=@middlename and [User].last_name=@lastname and [User].email=@email and [User].[password]=@password and [User].birth_date=@birth_date
insert into Viewer values(@user_id,@working_place_name,@working_place_type,@working_place_description)
end

else if @usertype= 'Contributor'
begin
insert into [User] values(@firstname,@middlename,@lastname,@email,@password,@birth_date,0,Null)
Select @user_id=[User].id
from [User]
where [User].first_name=@firstname and [User].middle_name=@middlename and [User].last_name=@lastname and [User].email=@email and [User].[password]=@password and [User].birth_date=@birth_date
set Identity_insert Notified_Person ON
insert into Notified_Person (id) VALUES (@user_id)
set Identity_insert Notified_Person Off
select @idn=max(Notified_Person.id)
from Notified_Person
insert into Contributor values(@user_id,@years_experience,@portfolio_link,@specialization,@idn)
end

else if @usertype= 'Content Manager'
begin
insert into [User] values(@firstname,@middlename,@lastname,@email,@password,@birth_date,0,Null)
Select @user_id=[User].id
from [User]
where [User].first_name=@firstname and [User].middle_name=@middlename and [User].last_name=@lastname and [User].email=@email and [User].[password]=@password and [User].birth_date=@birth_date
set Identity_insert Notified_Person ON
insert into Notified_Person (id) VALUES (@user_id)
set Identity_insert Notified_Person Off
select @idn=max(Notified_Person.id)
from Notified_Person
insert into Staff values(@user_id,@hire_date,@working_hours,@payment_rate,@idn)
insert into Content_manager (Content_manager.content_manager_id) values (@user_id)
end
else if @usertype= 'Authorized_Reviewer'
begin
insert into [User] values(@firstname,@middlename,@lastname,@email,@password,@birth_date,0,Null)
Select @user_id=[User].id
from [User]
where [User].first_name=@firstname and [User].middle_name=@middlename and [User].last_name=@lastname and [User].email=@email and [User].[password]=@password and [User].birth_date=@birth_date
set Identity_insert Notified_Person ON
insert into Notified_Person (id) VALUES (@user_id)
set Identity_insert Notified_Person Off
select @idn=max(Notified_Person.id)
from Notified_Person
insert into Staff values(@user_id,@hire_date,@working_hours,@payment_rate,@idn)
insert into Reviewer(Reviewer.reviewer_id) values (@user_id)
end
else
print('You need to write the correct USER TYPE!!')

go

CREATE Procedure Check_Type 
@typename varchar(30),
@content_manager_id int
AS
IF (EXISTS (Select *
from Content_type
Where Content_type.[type]= @typename))

Update Content_manager
Set content_type_type = @typename
where content_manager_id=@content_manager_id

else
Insert into Content_type Values(@typename)
Update Content_manager
Set content_type_type = @typename
where content_manager_id=@content_manager_id

go

CREATE Procedure Order_Contributer
AS 
select *
from [User]
inner join Contributor
ON Contributor.contributor_id = [User].id
Order by Contributor.years_of_experience

go

CREATE Procedure Show_original_content
@Contributer_id int
AS
Select *
from Content inner join Original_Content On Content.id=Original_Content.original_content_id
where Content.content_contributer_id=@Contributer_id and Original_Content.filter_status=1 and Original_Content.review_status=1

go

CREATE Procedure User_login
 @email varchar(100), 
 @password varchar(30), 
 @user_id int OUTPUT
 AS

 declare @dec int
 select @dec=[User].Deactivated
 from [User]
 where email=@email and [password]=@password

 if(@dec=0 or @dec is null)
 begin
 Select @user_id = [User].id 
 from [User]
 where email=@email and [password]=@password
 end

 else if(@dec=1)
 begin
Update [User]
Set [User].Deactivated=1
where [User].email=@email and [User].[password]=@password
Select @user_id = [User].id 
 from [User]
 where email=@email and [password]=@password
end

else
begin
 set @user_id =-1
end

 return @user_id

go

CREATE Procedure Show_Profile
@user_id int,
@email varchar(100) OUTPUT,
@password varchar(100) OUTPUT,
@firstname varchar(100) OUTPUT,
@middlename varchar(100)OUTPUT,
@lastname varchar(100)OUTPUT,
@birth_date datetime OUTPUT,
@working_place_name varchar(100) OUTPUT, 
@working_place_type varchar(100) OUTPUT,
@wokring_place_description varchar(169) OUTPUT,
@specilization varchar(100) OUTPUT,
@portofolio_link varchar(100) OUTPUT,
@years_experience varchar(100) OUTPUT,
@hire_date datetime OUTPUT,
@working_hours decimal (4,2)OUTPUT,
@payment_rate decimal (12,2) OUTPUT
AS
 declare @dec int
 select @dec=[User].Deactivated
 from [User]
 where id=@user_id

if (@dec=0 or @dec is null)
begin
Select @email=[User].email,@password = [User].password,@firstname = [User].first_name,@middlename = [User].middle_name,@lastname = [User].last_name,@birth_date=[User].birth_date,
@working_place_name =Viewer.working_place,@working_place_type = Viewer.working_place_type,@wokring_place_description = Viewer.working_place_description,@specilization = Contributor.specialization,
@portofolio_link =Contributor.portfolio_link ,@years_experience = Contributor.years_of_experience, @hire_date =Staff.hire_date,@working_hours = Staff.working_hours,@payment_rate = Staff.payment_rate
from [User]
left join Viewer
on [User].id = Viewer.[user_id]
left join Contributor
on [User].id = Contributor.contributor_id
left join Staff
on [User].id = Staff.staff_id
where @user_id= [User].id
end

go

CREATE procedure Edit_Profile
@user_id int,
@email varchar(100),
@password varchar(100),
@firstname varchar(100),
@middlename varchar(100),
@lastname varchar(100),
@birth_date datetime,
@working_place_name varchar(100),
@working_place_type varchar(100),
@wokring_place_description varchar(169), 
@specialization varchar(100),
@portofolio_link varchar(100),
@years_experience int,
@hire_date int,
@working_hours decimal(2,1),
@payment_rate decimal(12,2)
AS
UPDATE [User]
SET first_name = @firstname,middle_name = @middlename,last_name = @lastname
where id=@user_id
UPDATE Viewer 
SET working_place = @working_place_name, working_place_type = @working_place_type, working_place_description = @wokring_place_description
where Viewer.user_id=@user_id
UPDATE Contributor
SET Contributor.years_of_experience = @years_experience , specialization = @specialization, portfolio_link = @portofolio_link
where Contributor.contributor_id=@user_id
UPDATE Staff
SET hire_date = @hire_date, working_hours = @working_hours,payment_rate = @payment_rate
where staff_id=@user_id

go

CREATE Procedure Deactivate_Profile
@user_id int
AS
update [User]
set [User].Deactivated=1,[User].Deactivate_time= current_timestamp
where [User].id=@user_id

declare @deactivation_date datetime
select @deactivation_date=Deactivate_time
from [User]
where id=@user_id

if current_timestamp-@deactivation_date> 14

update [User]
set [User].Deactivated=-1,[User].Deactivate_time= current_timestamp
where [User].id=@user_id

go

create Procedure Show_Event
@event_id int
AS
if @event_id is NULL
select * 
from [Event]
else
select *
from [Event] left join [User] ON [Event].event_viewer_id = [User].id
where Event.id =@event_id

go

CREATE Procedure Show_Notification
@user_id int
AS
select *
from Announcement
where Announcement.announcement_notified_person_id =@user_id

go

CREATE Procedure Show_New_Content
@viewer_id int,
@content_id int
AS
if @content_id is null
Select  New_Content.new_content_id ,New_Content.new_content_new_request_id,New_Request.new_request_viewer_id, [User].first_name, [User].middle_name,[User].last_name
from New_Content left join Content on New_Content.new_content_id=Content.id left join New_Request on New_Content.new_content_new_request_id=New_Request.id left join [User] on New_Request.new_request_contributer_id = [User].id

else

Select  New_Content.new_content_id ,New_Content.new_content_new_request_id,New_Request.new_request_viewer_id, [User].first_name, [User].middle_name,[User].last_name
from New_Content left join Content on New_Content.new_content_id=Content.id left join New_Request on New_Content.new_content_new_request_id=New_Request.id left join [User] on New_Request.new_request_contributer_id = [User].id
where New_Request.new_request_viewer_id=@viewer_id and New_Content.new_content_id=@content_id

go

create Procedure Viewer_Create_Event
@city varchar(30),
@event_date_time datetime,
@description varchar(169),
@entertainer varchar(30),
@viewer_id int,
@event_id int OUTPUT

AS
INSERT INTO Event(city, [time], [description], entertainer, event_viewer_id)
VALUES(@city, @event_date_time, @description, @entertainer, @viewer_id)

Select @event_id= [Event].id
from Event
where city=@city and [time]=@event_date_time and [description]=@description and entertainer=@entertainer and event_viewer_id=@viewer_id

return @event_id
go

create Procedure Viewer_Upload_Event_Photo
@event_id int,
@link varchar(100)
AS
INSERT INTO Event_Photos_Link(Event_Photos_link_event_id, link)
VALUES(@event_id, @link)

go

create Procedure Viewer_Upload_Event_Video
@event_id int,
@link varchar(100)
AS
INSERT INTO Event_Videos_Link(Event_Videos_link_event_id, link)
VALUES(@event_id, @link)

go
create Procedure Viewer_Create_Ad_From_Event
@event_id int
AS
declare @desc varchar(169), @loc varchar(169),@id1 int,@id2 int 
Select @desc=[description] , @loc=[location], @id1=id, @id2=event_viewer_id
FROM Event
where Event.id=@event_id

INSERT INTO Advertisement ([description], [location], Advertisement_event_id, Advertisement_viewer_id)
values(@desc,@loc,@id1,@id2)

go

create Procedure Apply_Existing_Request
@viewer_id int,
@original_content_id int
AS
if (exists(select *
from Original_Content
where Original_Content.original_content_id=@original_content_id and rating>=4) )
INSERT INTO Existing_Request (existing_request_original_content_id,existing_request_viewer_id)
VALUES(@original_content_id,@viewer_id)

go

CREATE Procedure Apply_New_Request
@information varchar(169),
@contributer_id int
AS 
INSERT INTO New_Request(information,new_request_contributer_id,Requesting_time)
VALUES(@information,@contributer_id,CURRENT_TIMESTAMP)

if @contributer_id is not null
INSERT INTO Announcement(sent_at,Announcement_notified_person_id)
VALUES(current_timestamp,@contributer_id)

go

CREATE Procedure Delete_New_Request
@request_id int
AS
DELETE FROM New_Request
where  id=@request_id and accept_status is null
DELETE FROM New_Request
where  id=@request_id and accept_status = '0'

go

CREATE Procedure Rating_Original_Content
@original_content_id int,
@rating_value decimal(4,2),
@viewer_id int
AS
if(exists(select* from Original_Content where original_content_id=@original_content_id))
INSERT INTO Rate VALUES(@viewer_id, @original_content_id, Current_timestamp, @rating_value)

declare @rate decimal(4,2), @count decimal(4,2)

Select @rate=Sum(Rate.rate) , @count=count(Rate.rate)
from Rate
where Rate.rate_original_content_id=@original_content_id

Update Original_Content
set Original_Content.rating=(@rate/@count)
where Original_Content.original_content_id=@original_content_id

go

CREATE Procedure Write_Comment
@comment_text varchar(169),
@viewer_id int,
@original_content_id int,
@written_time datetime
AS
INSERT INTO Comment
VALUES(@viewer_id,@original_content_id,@written_time,@comment_text)

go

create Procedure Edit_Comment
@comment_text varchar(169),
@viewer_id int,
@original_content_id int,
@last_written_time datetime,
@updated_written_time datetime
AS if(exists(Select * 
from Comment
where Comment.date=@last_written_time))
UPDATE Comment 
SET Comment.[text]=@comment_text ,comment_original_content_id=@original_content_id,[date]=@updated_written_time
WHERE comment_Viewer_id=@viewer_id

go

create Procedure Delete_Comment
@viewer_id int,
@original_content_id int,
@written_time datetime
AS
DELETE FROM Comment
where Comment.comment_Viewer_id=@viewer_id and Comment.comment_original_content_id=@original_content_id and Comment.[date]=@written_time

go

create Procedure Create_Ads
@viewer_id int,
@description varchar(169),
@location varchar(30)
AS
INSERT INTO Advertisement(Advertisement_viewer_id, [description], [location])
VALUES(@viewer_id, @description, @location)

go

create Procedure Edit_Ad
@ad_id int,
@description varchar(169),
@location varchar(30)
AS
UPDATE Advertisement
SET [description]=@description, [location]=@location
WHERE @viewer_id = Advertisement.Advertisement_viewer_id

go

create Procedure Delete_Ads
@ad_id int
AS
DELETE FROM Advertisement
where id=@ad_id

go

create Procedure Send_Message
@msg_text varchar(169),
@viewer_id int,
@contributer_id int,
@sender_type varchar(169),
@sent_at datetime
AS
INSERT INTO [Message](sent_at,message_contributer_id,message_viewer_id,sender_type,[text])
VALUES (@sent_at,@contributer_id,@viewer_id,@sender_type,@msg_text)

go

create Procedure Show_Message
@contributer_id int
AS
Select *
From [Message]
WHERE [Message].message_contributer_id=@Contributer_id

go

create procedure Assign_New_Request
 @request_id int,
 @contributor_id int
 as
 if (exists(select *
 from New_Request
 where New_Request.id=@request_id and New_Request.accept_status is null))
 Update New_Request
 Set New_Request.new_request_contributer_id=@contributor_id
 where New_Request.id=@request_id

go

create Procedure Receive_New_Requests
@request_id int,
@contributor_id int
AS
if @request_id is null
Select *
From New_Request
where New_Request.new_request_contributer_id=@contributor_id

else if (exists(Select *
From New_Request
where New_Request.new_request_contributer_id=@contributor_id AND New_Request.id=@request_id))

Select *
From New_Request
where New_Request.new_request_contributer_id=@contributor_id AND New_Request.id=@request_id

else
Select *
From New_Request
where  New_Request.id=@request_id

go

create Procedure Respond_New_Request
@contributer_id int,
@accept_status bit,
@request_id int
AS
UPDATE New_Request
SET New_Request.accept_status=@accept_status
WHERE New_Request.new_request_contributer_id=@contributer_id AND New_Request.id=@request_id

go

create Procedure Upload_Original_Content
@type_id varchar(30),
@subcategory_name varchar(50),
@link varchar(100),
@category_id varchar(30),
@contributer_id int
AS
if (not exists(select * from Category where [type]=@category_id))
begin
insert into Category values(@category_id,null) 
end
if (not exists(select * from Sub_Category where [name]=@subcategory_name))
begin
insert into Sub_Category values(@category_id,@subcategory_name) 
end

else
begin
insert into Content
Values(@link,CURRENT_TIMESTAMP,@contributer_id,@category_id,@subcategory_name,@type_id)
Declare @cid int
select @cid=Content.id
from Content
where Content.content_contributer_id=@contributer_id and Content.link=@link and Content.content_type=@type_id and Content.content_subcategory_name=@subcategory_name and Content.content_category_type=@category_id

insert into Original_Content(Original_Content.original_content_id)
Values(@cid)
end
go

create Procedure Upload_New_Content
@new_request_id int,
@link varchar(100),
@subcategory_name varchar(50),
@category_id varchar(30),
@contributer_id int
AS
if (not exists(select * from Category where [type]=@category_id))
begin
insert into Category values(@category_id,null) 
end
if (not exists(select * from Sub_Category where [name]=@subcategory_name))
begin
insert into Sub_Category values(@category_id,@subcategory_name) 
end

else
begin
insert into Content
Values(@link,CURRENT_TIMESTAMP,@contributer_id,@category_id,@subcategory_name,null)

Declare @cid int
select @cid=Content.id
from Content
where Content.content_contributer_id=@contributer_id and Content.link=@link and Content.content_type is null and Content.content_subcategory_name=@subcategory_name and Content.content_category_type=@category_id

insert into New_Content(New_Content.new_content_id,New_Content.new_content_new_request_id)
Values(@cid,@new_request_id)
end
go

create Procedure Delete_Content
@content_id int
AS
if (exists(select*
from Original_Content
where Original_Content.original_content_id=@content_id and Original_Content.filter_status = '0'))
DELETE FROM Original_Content 
WHERE Original_Content.original_content_id=@content_id AND Original_Content.filter_status = '0'
DELETE FROM Content 
WHERE Content.id=@content_id

if (exists(select*
from New_Content
where New_Content.new_content_id=@content_id))
DELETE FROM New_Content 
WHERE New_Content.new_content_id=@content_id

DELETE FROM Content 
WHERE Content.id=@content_id

go

create Procedure Receive_New_Request
@contributor_id int,
@can_recieve varchar(30) Output
AS
declare @count int
select @count=count(*)
from New_Request left join New_Content on New_Request.id=New_Content.new_content_id
where New_Content.new_content_id is null and New_Content.new_content_new_request_id is null and New_Request.new_request_contributer_id=@contributor_id

if @count>=3
begin
Set @can_recieve='Can not recieve new request'
print (@can_recieve)
end
else
begin
Set @can_recieve='Can recieve new request'
print (@can_recieve)
end

go

create Procedure Reviewer_Filter_Content
@reviewer_id int,
@original_content int,
@status bit
AS
UPDATE Original_Content
SET Original_content.review_status =@status,Original_Content.original_content_reviewer_id=@reviewer_id
WHERE Original_content.original_content_id=@original_content

go

create Procedure content_manager_filter_content
@content_manager_id int,
@original_content int,
@status bit
as
declare @type varchar(30),@type1 varchar(30)
Select @type=Content_manager.content_type_type
from Content_manager
where Content_manager.content_manager_id=@content_manager_id

Select @type1=Content.content_type
from Content
where Content.id=@original_content

if (@type1=@type)
UPDATE Original_Content
SET Original_content.review_status =@status, Original_Content.original_content_content_manager_id=@content_manager_id
WHERE Original_content.original_content_id=@original_content

go

create Procedure Staff_Create_Category
@category_name varchar(30)
AS
INSERT INTO Category([type])
VALUES(@category_name)

go

create Procedure Staff_Create_Subcategory
@category_name varchar(30),
@subcategory_name varchar(30)
AS
if(exists(select* 
from Category 
where [type]=@category_name))
INSERT INTO Sub_Category
VALUES(@category_name, @subcategory_name)
else
insert into Category values(@category_name,null)
INSERT INTO Sub_Category
VALUES(@category_name, @subcategory_name)

go

create Procedure Staff_Create_Type
@type_name varchar(30)
as
INSERT INTO Content_type
VALUES(@type_name)

go

create Procedure Most_Requested_Content
AS
Select Original_Content.original_content_id, Count(Existing_Request.id)
from Original_Content
inner join Existing_Request
on Original_Content.original_content_id = Existing_Request.existing_request_original_content_id
group by Original_Content.original_content_id
Order by Count(Existing_Request.id) Desc

go

CREATE Procedure Workingplace_Category_Relation
@category_name varchar(30),
@number_of_requests int Output
as
select @number_of_requests=count(*)
from New_Request inner join Content on New_Request.new_request_contributer_id=Content.content_contributer_id inner join Viewer on New_Request.new_request_viewer_id=Viewer.user_id
where Content.content_category_type=@category_name
group by Viewer.working_place_type
order by Viewer.working_place_type desc

return @number_of_requests

go

create Procedure Delete_Comment
@viewer_id int,
@original_content_id int,
@comment_time datetime
AS
DELETE FROM Comment
where Comment.comment_Viewer_id=@viewer_id and Comment.comment_original_content_id=@original_content_id and Comment.[date]=@comment_time

go

create Procedure Delete_Original_Content
@content_id int
AS
DELETE FROM Original_Content 
WHERE Original_Content.original_content_id=@content_id
DELETE FROM Content 
WHERE Content.id=@content_id

go

create Procedure Delete_New_Content_Content
@content_id int
AS
DELETE FROM New_Content 
WHERE New_Content.new_content_id=@content_id
DELETE FROM Content 
WHERE Content.id=@content_id

go

CREATE Procedure Assign_Contributer_Request
@contributer_id int,
@new_request_id int
AS
Update New_Request
set New_Request.new_request_contributer_id=@contributer_id
where New_Request.id=@new_request_id

go

create procedure Fastest_Contributors
as
Select Content.uploaded_at-New_Request.Requesting_time
from New_Request inner join Content on New_Request.new_request_contributer_id =Content.content_contributer_id
order by Content.uploaded_at-New_Request.Requesting_time