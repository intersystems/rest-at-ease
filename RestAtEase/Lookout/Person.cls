Class Lookout.Person Extends (%Persistent, %JSON.Adaptor)
{

Property id As %String [ Required ];

Index customId On id [ IdKey, PrimaryKey, Unique ];

Property name As %String;

Property department As %String;

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>department</Value>
</Value>
</Data>
<DataLocation>^Lookout.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^Lookout.PersonD</IdLocation>
<IndexLocation>^Lookout.PersonI</IndexLocation>
<StreamLocation>^Lookout.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
