/// Conference planning<br/>
/// Business logic class defined by OpenAPI in Lookout.Service.spec<br/>
/// Updated Aug 28, 2019 13:46:14
Class Lookout.Service.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 1;

/// Returns the list of meetings at the conference.
ClassMethod getAllMeetings() As %Stream.Object
{
	Set array = []
	Set rs = ##Class(%SQL.Statement).%ExecDirect(,"SELECT id, title, room->name as room FROM Lookout.Meeting")
	While rs.%Next() {
		Do array.%Push({
			"id": (rs.%Get("id")),
			"title": (rs.%Get("title")),
			"room": (rs.%Get("room"))
		})
	}
	
	Quit array
}

/// Create a new meeting.<br/>
/// The method arguments hold values for:<br/>
///     body<br/>
ClassMethod newMeeting(body As %Stream.Object) As %Stream.Object
{
	Set meeting = ##class(Lookout.Meeting).%New()
	Do meeting.%JSONImport(body, "NewMeeting")
	Do meeting.%Save()
	Quit ""
}

/// Returns the details for a particular meeting.<br/>
/// The method arguments hold values for:<br/>
///     meetingId, Meeting id to view<br/>
ClassMethod getMeeting(meetingId As %String) As %DynamicObject
{
	Set meeting = ##class(Lookout.Meeting).%OpenId(meetingId)
	If meeting = "" {
		Do ..%SetStatusCode(404)
		Quit ""
	}
	
	Do meeting.%JSONExportToStream(.stream, "BasicInfo")
	Quit stream
}

/// Partial update of an existing meeting.<br/>
/// The method arguments hold values for:<br/>
///     meetingId, Meeting id<br/>
///     body<br/>
ClassMethod updateMeeting(meetingId As %String, body As %Stream.Object) As %Stream.Object
{
	Set meeting = ##class(Lookout.Meeting).%OpenId(meetingId)
	If meeting = "" {
		Do ..%SetStatusCode(404)
		Quit ""
	}
	
	Do meeting.%JSONImport(body, "RoomOnly")
	Do meeting.%Save()
	
	Quit ""
}

}
