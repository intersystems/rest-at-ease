/// Business logic class defined by OpenAPI in Greeting.spec<br/>
/// Updated Aug 28, 2019 18:21:33
Class Greeting.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Returns the hello message
ClassMethod Hello() As %Stream.Object
{
	Quit "Hello world!"
}

/// Returns the custom message
ClassMethod GetMessage() As %Stream.Object
{
	Quit $get(^Message, "no message")
}

/// Updates the custom message<br/>
/// The method arguments hold values for:<br/>
///     body<br/>
ClassMethod SetMessage(body As %Stream.Object) As %Stream.Object
{
	Set ^Message = body.Read()
	Quit ""
}

}
