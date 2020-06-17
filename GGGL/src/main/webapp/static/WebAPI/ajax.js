function createXMLHttpRequest()
{   
	var xmlHttp;   

	if (window.ActiveXObject || "ActiveXObject" in window) 
	{   
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");   
	}    
	else if (window.XMLHttpRequest) 
	{   
		xmlHttp = new XMLHttpRequest();                   
	}
	   
	return xmlHttp;   
} 

function createXMLDocument()
{
	var xmlDoc;
	if (!!window.ActiveXObject || "ActiveXObject" in window)
	{
		var versions = ["Msxml2.DOMDocument.6.0","Msxml2.DOMDocument.2.0"];
		for(var i=0;i<versions.length;i++)
		{
			try
			{
				xmlDoc = new ActiveXObject(versions[i]);
				return xmlDoc;
			}
			catch(e)
			{
				alert(e.message);
			}
		}
	}
	return null;
}

		