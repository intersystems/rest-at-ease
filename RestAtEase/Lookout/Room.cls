Class Lookout.Room Extends (%Persistent,%JSON.Adaptor)
{

Property id As %String [ Required ];

Index customId On id [IdKey, PrimaryKey, Unique];

Property name As %String;

Property capacity As %Integer;

XData NameOnly
{
  <Mapping xmlns="http://www.intersystems.com/jsonmapping">
    <Property Name="id" Include="none"/>
    <Property Name="name" Include="outputonly"/>
    <Property Name="capacity" Include="none"/>
  </Mapping>
}

Storage Default
{
<Data name="RoomDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>capacity</Value>
</Value>
</Data>
<DataLocation>^Lookout.RoomD</DataLocation>
<DefaultData>RoomDefaultData</DefaultData>
<IdLocation>^Lookout.RoomD</IdLocation>
<IndexLocation>^Lookout.RoomI</IndexLocation>
<StreamLocation>^Lookout.RoomS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}