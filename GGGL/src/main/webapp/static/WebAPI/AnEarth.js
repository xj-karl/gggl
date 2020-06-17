function SetLayerVisible(LayerName,visible) {
    frames["leftNavIframe"].SetLayerVisible(LayerName,visible);
}
function createXMLDocument(){
	var xmlDoc;
	if(window.ActiveXObject){
		var versions = ["Msxml2.DOMDocument.6.0","Msxml2.DOMDocument.2.0"];
		for(var i=0;i<versions.length;i++){
			try{
				xmlDoc = new ActiveXObject(versions[i]);
				return xmlDoc;
			}
			catch(error){
			}
		}
	}
	return null;
}
var dLon = "1140000.000000";

function GetTransLon() {
    return dLon;
}

var ModelPositionXML;
function ListModelPosition(){
    ModelPositionXML = createXMLDocument();
    ModelPositionXML.async = true;
    ModelPositionXML.onreadystatechange = ModelPositionXML_readyStateChange;
    ModelPositionXML.load("..\\ModelPositionXML.xml");
    ModelPosShow = false;
    HideTreeView();
}

var NodeNameFilter="";
function SetBuildTreeFilter(name) {
    NodeNameFilter = name;
}
function GetBuildTreeFilter(){
    return NodeNameFilter;
}

var TreeLayerFilter = new Array;
function GetTreeLayerFilter() {
    return TreeLayerFilter;
}

function LayerExist(ln) {
    var r = BaseLayerOpObj.GetRoot();
    var n = BaseLayerOpObj.GetChildNum(r);
    for(var i=0;i<n;i++){
        var c = BaseLayerOpObj.GetChildName(r,i);
        if (c==ln) {
            return true;
        }
    }
    return false;
}

function ModelPositionXML_readyStateChange(){
    var firstName = "";
	if(ModelPositionXML.readyState==4){
	    //filter
        TreeLayerFilter = new Array;
	    //filter
	    
        var rootname = BaseLayerOpObj.GetRoot();
		var nodes = ModelPositionXML.getElementsByTagName(NodeNameFilter);
		for(var i=0;i<nodes.length;i++){
		    if (nodes[i].childNodes.length==2||nodes[i].childNodes.length==3) {
                var DisplayName = nodes[i].childNodes[0].firstChild.nodeValue;
                var gdburl = nodes[i].childNodes[1].firstChild.nodeValue;
                var frameObj = frames["leftNavIframe"];
		        var bname = "";
                if (frameObj!=null) {
                    try{
                        var mTree = frameObj.GetTree();
                        var length = mTree.aNodes.length;
                        if (!LayerExist(DisplayName)) {
                            bname = ExtendLayerOpObj.Create3DFeatureLayer(DisplayName,rootname,gdburl);
                            TreeLayerFilter[TreeLayerFilter.length] = DisplayName;
                        }
                        else{
                            TreeLayerFilter[TreeLayerFilter.length] = DisplayName;
                        }
                    }
                    catch(error){
                        bname = ExtendLayerOpObj.Create3DFeatureLayer(DisplayName,rootname,gdburl);
                        TreeLayerFilter[TreeLayerFilter.length] = DisplayName;
                    }
                    if (nodes[i].childNodes.length==3) {
                        var visi = nodes[i].childNodes[2].firstChild.nodeValue;
                        if (visi=="true") {
                            BaseLayerOpObj.SetVisible(bname,true);
                        }
                        if (visi=="false") {
                            BaseLayerOpObj.SetVisible(bname,false);
                        }
                    }		
                }
		    }
            else if (nodes[i].childNodes.length==1) {
                dLon = nodes[i].childNodes[0].firstChild.nodeValue;
            }
		}
        document.getElementById("leftNavIframe").src = "LeftNav.htm";
	}
}


function ShowTreeView() {
    document.getElementById("_leftNav").style.display="block";
    document.getElementById("panel").style.display="none";
}
function HideTreeView() {
    document.getElementById("_leftNav").style.display="none";
    document.getElementById("panel").style.display="block";
}
//控件A同步B
var goTimeID = "";
function SetParentPos() {
    goTimeID = window.setInterval(GoWithAnEarth,5000);
}

var addedFirst = false;
function GoWithAnEarth() {

    var cvinfo = NaviOpObj.GetViewInfo().split(",");
    if (cvinfo =="") {
        return;
    }
    
    var m = parent.CommonOpObj.GetVisibleMode();
    if(m=="Flat"){
        return;
    }
    
    var pvinfo = parent.NaviOpObj.GetViewInfo().split(",");
    var name = "投影转换插件Ex";
    var func = "投影转换";
    var paramG_F = "Globe;Flat";
    var paramF_G = "Flat;Globe";
    var param2 =  cvinfo[0]+";"+cvinfo[1]+";"+dLon;
    var res = CommonOpObj.ExecutePlugin(name,func,paramF_G,param2);
    var xy = res.split(";");
    var cvinfo = NaviOpObj.GetViewInfo().split(",");
    var pvinfo = parent.NaviOpObj.GetViewInfo().split(",");
    pvinfo[2] = pvinfo[3] = 55000;
    var h = parseFloat(cvinfo[3]);
//    if (h>55000) {
//        h = 55000;
//    }
    var v = parseFloat(cvinfo[5]);
    if (v<0) {
        v*=-1;
    }
    v%=90;
    v = 90 - v;
    
    
    //简单判断位置模型&地球不跳转
    var ddx = parseFloat(xy[0])-parseFloat(dLon)/10000;
    if (ddx<-2||ddx>2) {
        return;
    }
    
    //End
    
    parent.NaviOpObj.SetViewInfo(xy[0],xy[1],h,h,parseFloat(cvinfo[4])*-1,v);
//    var url = "../Handler.ashx/tddata?method=PrjTrans&filter=ToGlobe&classpath="+cvinfo[0]+","+cvinfo[1];
//    PrjTrans(url);


}

function StopParentPos() {
    window.clearInterval(goTimeID);
    goTimeID="";
}

function PrjTrans(url) {
    var xmlHttp;
    if (window.ActiveXObject) 
    {   
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");   
    }
    else if (window.XMLHttpRequest) 
    {
        xmlHttp = new XMLHttpRequest();                   
    }
    xmlHttp.open("GET",url , false);
    xmlHttp.onreadystatechange = 
    function()
    {   
        if (xmlHttp.readyState == 4) 
        {   
            if (xmlHttp.status == 200 || xmlHttp.status == 0)
            {   
                PrjTransCallBack(xmlHttp);
            }
        }
    };
    xmlHttp.send(null);
}


function PrjTransCallBack(xmlHttp) {
    var response = xmlHttp.responseText;
    var xy = response.split(";");
    var cvinfo = NaviOpObj.GetViewInfo().split(",");
    var pvinfo = parent.NaviOpObj.GetViewInfo().split(",");
    var h = parseFloat(cvinfo[3]);
    if (h>55000) {
        h = 55000;
    }
    parent.NaviOpObj.SetViewInfo(xy[0],xy[1],h,h,parseFloat(cvinfo[4])*-1,cvinfo[5]);
}


//模型查询
function StartPickModel() 
{   
    //注册鼠标按键弹起事件
    CommonOpObj.RegisterEventHandle("onmouseup", "OnPickModel");
    isPickModel = true;
}

//结束拾取模型
function EndPickModel()
{   
    //删除鼠标按键弹起事件
    CommonOpObj.RemoveEventHandle("onmouseup");
    CommonOpObj.RegisterEventHandle("onmouseup", "r_Query");
    CommonOpObj.RegisterEventHandle("onkeyup", "r_Query");
    CommonOpObj.ClearPick();
    
    parent.LabelOpObj.RemoveLayer("经纬度定位");
}


//鼠标事件回调事件
function OnPickModel(o) 
{
    //左键按下
    if (o.button == 1)
    {
        //拾取模型
        var ids = CommonOpObj.PickModel(o.x, o.y);
        //ids = "x,y,z|GDBP://MapGISLocal/三维平台示例数据/3dfds/几何房屋/3dfcls/房屋/3df/1";
        if (ids)
        {
            
            //拾取到模型
            var info = ids.split('|');
            if (info.length == 2)
            {
                //拾取到点的xyz坐标
                var xyz = info[0].split(',');
                CommonAttriTableObj.Add(xyz[0],xyz[1],xyz[2],320,170);
                //拾取到模型的url
                //可根据该url查询模型的属性
                var id = info[1]; 
                QueryAtt(id);
                
                AddGlobeLabel(xyz[0],xyz[1]);
            }
            
        }
    }
}
        
//查询模型属性的服务调用方法
//
function QueryAtt(id)
{   
    var address = "../handler.ashx";
    var escapeID = encodeURI(id);
    //
    var queryUrl = address + "/tddata?" + "method=modelattribute&classpath=" + escapeID;
    //使用 ajax请求上面的地址即可得到指定模型的属性信息
    
    var xmlHttp;
    if (window.ActiveXObject) 
    {   
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");   
    }
    else if (window.XMLHttpRequest) 
    {
        xmlHttp = new XMLHttpRequest();                   
    }
    xmlHttp.open("GET",queryUrl , true);
    xmlHttp.onreadystatechange = 
    function()
    {   
        if (xmlHttp.readyState == 4) 
        {   
            if (xmlHttp.status == 200 || xmlHttp.status == 0)
            {   
                GetAtt_CallBack(xmlHttp);
            }
        }
    };
    xmlHttp.send(null);
}

var modelDialog="";
function GetAtt_CallBack(xmlHttp)
{
    if(modelDialog!="")
    {
        modelDialog.close();
    }
    var response = xmlHttp.responseText;
    var uresponseexp = decodeURIComponent(response);
    //showModelessDialog("Dialog.htm",uresponseexp, "dialogWidth:250px;dialogHeight:250px;center:yes;help:no;resizable:no;status:no;toolbar:no;scroll:no;location=no;");
    //modelDialog = showModelessDialog  ("Dialog.htm",uresponseexp, "dialogWidth:250px;dialogHeight:250px;center:yes;help:no;resizable:no;status:no;toolbar:no;scroll:no;location=no;");
    var AttrList = uresponseexp.split("|||");
    var resultText = '<table id="mytable" style ="width:100%" ';
    var AttrNum = AttrList.length;
    for (var i = 0; i < AttrNum; i++) 
    {
        var oneAttr = AttrList[i];
        var attr = oneAttr.split(":");
        if(attr.length==1&&AttrNum==1)
        {
            resultText+="<tr>";
            resultText+="<td>";resultText+="无属性";
            resultText+="</td>";
            resultText+="<td>";resultText+="无属性";
            resultText+="</td>";
            resultText+="</tr>";
            continue;
        }
        if(oneAttr=="")
        {
            continue;
        }
        
        resultText+='<tr>';
        resultText+='<th scope="col">';
        resultText+= attr[0];
        resultText+='</th>';
        resultText+='<td class="row">';
        resultText+= attr[1];
        resultText+='</td>';
        resultText+='</tr>';
    }
    
    resultText+='</table>';   
    CommonAttriTableObj.SetURL(resultText);
    CommonAttriTableObj.NotifyUpdate();
    //r_showProgress(false);    
}

     function AttributeTableAPI()
     {
         this.status= '0';     
         this.url   = '查找中…';
         this.CallBack = undefined;
     }
var isPickModel = false;
    /**
    * 通用操作属性表操作对象
    */
     var CommonAttriTableObj = new AttributeTableAPI();
         
     AttributeTableAPI.prototype.SetURL = function (url)
     {
        this.url = url;
     }
     
     AttributeTableAPI.prototype.GetURL = function()
     {
        return this.url;
     }
     
     AttributeTableAPI.prototype.SetStatus = function(status)
     {
        this.status = status;
     }
     
     AttributeTableAPI.prototype.GetStatus = function()
     {
        return this.status;
     }     
     
     //设置回调函数
     AttributeTableAPI.prototype.SetCallBack = function(CallBack)
     {
        this.CallBack = CallBack;
     }
 
     //显示前'pre', 'show', 'exit', 'update', 'onpropertychange'
     AttributeTableAPI.prototype.Notify      = function(status)
     {
         if (this.CallBack != undefined)
         {
            this.CallBack(status);
         }
     }
     
     AttributeTableAPI.prototype.NotifyUpdate = function()
     {
           var doc = frames["ToolTipFrameForURL"].document;
           var div = doc.getElementById("resultView");
           if(div == null || div == "" || div == 'undefined')
           {
                return;
           }
           div.innerHTML = this.url;
     }
     
     AttributeTableAPI.prototype.Add  = function(x, y, z, w, h)
     {
        var lable = LabelOpObj.AddToolTip(x, y, z, "navy", w, h);
        LabelOpObj.SetToolTipBorder(lable, 0, 0, 0, 0);
        LabelOpObj.SetToolTipInfo("..\\r_AttributeShow.htm", "url");
	    //r_showProgress(false);
      }
     
     AttributeTableAPI.prototype.Hide  = function()
     {
        this.url = '查找中…';
        this.status='0';
        LabelOpObj.RemoveToolTip();
        
        if (isPickModel) {
            EndPickModel();
            isPickModel = false;
        }
        
     }    
     
function r_showProgress(show)
{
    var doc = frames["ToolTipFrameForURL"].document;
    if(doc == null) 
    {
        return false;
    }
    
    if (show)
    {
       var pojb = doc.getElementById("r_ProcBar");
       if (pobj!=null) {
         pojb.style.visibility ="visible";
       }
    }
    else
    {
        var pojb = doc.getElementById("r_ProcBar");
        if (pojb!=null) {
          pojb.style.visibility ="hidden";
        }
    } 
    return true;
}

function UpdateTreeView() {
    document.getElementById("leftNavIframe").src = "LeftNav.htm";
}

function AddGlobeLabel(x,y){
    var plugname = "投影转换插件Ex";
    var func = "投影转换";
    var paramG_F = "Globe;Flat";
    var paramF_G = "Flat;Globe";
    var param2 =  x+";"+y+";"+dLon;
    var res = CommonOpObj.ExecutePlugin(plugname,func,paramF_G,param2);
    var xy = res.split(";");
    var LayerName = "经纬度定位";
    var font = "隶书";
    var size = 20;
    var fontColor = "white";
    var z = 1000;
    var farDist = 100000000;
    var nearDist = 1;
    var icoUrl = "\\Res\\materials\\textures\\hong-32.png";
    var icoScale = 1.0;
    var duration = 1;
    var name = "经纬度定位";
  
    parent.LabelOpObj.Add(name,LayerName);
    parent.LabelOpObj.SetPosition(name,LayerName,xy[0] ,xy[1],z);
    parent.LabelOpObj.SetShowDist(farDist,nearDist);
    parent.LabelOpObj.SetIcon(name,LayerName, icoUrl, icoScale, duration);
    //parent.LabelOpObj.SetDepthCheck(name,LayerName,"all",false);
    parent.LabelOpObj.SetElevationType(name,LayerName,"relativeterrain");
    parent.LabelOpObj.SetOnClickHandle(
                name,
                LayerName,
                "HitGlobeLabelCallback");
                
                
}

function ClearActiveXObj() {
    //ActiveXKiller("WebSceneDisCtrl","objContainer");
}

function ActiveXKiller(AcitveXObjectID,ContianerID){   
    var ce=document.getElementById(ContianerID);   
    if (ce){ 
        var cce=ce.children;   
        for(var i=0;i<cce.length;i=i+1){   
            if(cce[i].id==AcitveXObjectID){    
                ce.removeChild(cce[i]);   
                alert("Clear");
            }   
        }
    } 
}