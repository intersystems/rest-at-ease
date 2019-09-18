Class Lookout.Meeting Extends (%Persistent, %JSON.Adaptor)
{

Property id As %String [ Required ];

Index customId On id [ IdKey, PrimaryKey, Unique ];

Property title As %String [ Required ];

Property description As %String(MAXLEN = "");

Property host As Lookout.Person;

Property room As Lookout.Room;

Property attendees As list Of Lookout.Person;

XData BasicInfo
{
<Mapping xmlns="http://www.intersystems.com/jsonmapping">
    <Property Name="id"/>
    <Property Name="title"/>
    <Property Name="room" Reference="ID" />
  </Mapping>
}

XData NewMeeting
{
<Mapping xmlns="http://www.intersystems.com/jsonmapping">
		<Property Name="id"/>		
		<Property Name="title" FieldName="name-of-meeting"/>
    	<Property Name="host" Reference="ID"/>
		<Property Name="room" Reference="ID"/>
	</Mapping>
}

XData RoomOnly
{
<Mapping xmlns="http://www.intersystems.com/jsonmapping">
		<Property Name="room" Reference="ID" Include="inputonly"/>
	</Mapping>
}

Storage Default
{
<Data name="MeetingDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>title</Value>
</Value>
<Value name="3">
<Value>description</Value>
</Value>
<Value name="4">
<Value>host</Value>
</Value>
<Value name="5">
<Value>room</Value>
</Value>
<Value name="6">
<Value>attendees</Value>
</Value>
</Data>
<DataLocation>^Lookout.MeetingD</DataLocation>
<DefaultData>MeetingDefaultData</DefaultData>
<IdLocation>^Lookout.MeetingD</IdLocation>
<IndexLocation>^Lookout.MeetingI</IndexLocation>
<StreamLocation>^Lookout.MeetingS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
