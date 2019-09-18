Class Lookout.Util
{

ClassMethod reset()
{
	Kill ^Lookout.PersonD
	Kill ^Lookout.PersonI
	Kill ^Lookout.MeetingD
	Kill ^Lookout.MeetingI
	Kill ^Lookout.RoomD
	Kill ^Lookout.RoomI
	
	Set ^Lookout.PersonD("adam")=$lb("","Adam B.","Management")
	Set ^Lookout.PersonD("betty")=$lb("","Betty C.","Sales")
	Set ^Lookout.PersonD("christine")=$lb("","Christine D.","Development")
	Set ^Lookout.PersonD("dexter")=$lb("","Dexter E.","Marketing")
	Set ^Lookout.PersonD("edward")=$lb("","Edward F.","Marketing")
	
	Set ^Lookout.MeetingD("sales-update")=$lb("","Projected revenue for the upcoming release","","adam","clarendon",$lb($lb("adam"),$lb("edward")))
	Set ^Lookout.MeetingD("strategy")=$lb("","How can we enter new markets?","","edward","berkeley",$lb($lb("christine")))
	Set ^Lookout.MeetingD("new-features")=$lb("","New features for 2019","","betty","arlington",$lb($lb("dexter")))
	
	Set ^Lookout.RoomD("arlington")=$lb("","Arlington",500)
	Set ^Lookout.RoomD("berkeley")=$lb("","Berkeley",100)
	Set ^Lookout.RoomD("clarendon")=$lb("","Clarendon",100)
	Set ^Lookout.RoomD("dartmouth")=$lb("","Dartmouth",50)
	Set ^Lookout.RoomD("exeter")=$lb("","Exeter",25)
	
	Do ##class(Lookout.Meeting).%BuildIndices()
	Do ##class(Lookout.Person).%BuildIndices()
	Do ##class(Lookout.Room).%BuildIndices()
}

ClassMethod GetJSON() As %DynamicObject
{
  Quit {"name":"Gobi","type":"desert","location":{"continent":"Asia","countries":["China","Mongolia"]},"dimensions":{"length":1500,"length_unit":"km","width":800,"width_unit":"km"}}
}

}
