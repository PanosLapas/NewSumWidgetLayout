<%-- 
    Document   : CustomWidget
    Created on : 26 Ιουλ 2013, 9:43:33 πμ
    Author     : plapas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="org.scify.NewSumServer.Server.JSon.*"%>
<%@page import="org.scify.NewSumServer.Server.Adaptor.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >
        <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
        <title>Custom Widget</title>

        <%ArrayList str = new ArrayList();
            //creating an arraylist with 3 strings each one for different element selection
            str.add("Επιλέξτε background χρώμα");
            str.add("Επιλέξτε χρώμα κατηγοριών");
            str.add("Επιλέξτε χρώμα τίτλων ειδήσεων");
        %>
        <script>
            var divState = {}; // we store the status in this object
            function showhide(id) {
                if (document.getElementById) {
                    var divid = document.getElementById(id);

                    divState[id] = (divState[id]) ? false : true; // initialize / invert status (true is visible and false is closed)
                    //close others
                    for (var div in divState) {
                        if (divState[div] && div != id) { // ignore closed ones and the current
                            document.getElementById(div).style.display = 'none'; // hide
                            divState[div] = false; // reset status
                        }
                    }
                    divid.style.display = (divid.style.display == 'block' ? 'none' : 'block');
                }
            }
        </script>

        <script type="text/javascript">
            //Javascript code for color selection
            var CatArray = new Array();//arxikopoihsh ths listas me tis kathgories
            var fontsz = 12;//arxikopoihsh font-size
            var fontfm = "sans-serif";//arxikopoihsh font-family
            var refTim = 1800;
            var WidVal = 470;
            var HeiVal = 270;

            var mouse = "out";
            var bName = navigator.appName;
            var bVer = parseInt(navigator.appVersion);
            var IE4 = (bName == "Microsoft Internet Explorer" && bVer >= 4);
            var click = "no";
            var ghex = "empty";
            var timer;
            //Initialize colors
            var rowcol = "ffffff";//row color(Category)
            var backgrcol = "ffffff";//background color
            var titlecol = "ffffff";//tittle-row color
            //End of initialization

            function findPosX(obj)//function for finding X position of color-palette
            {
                var curleft = 0;
                if (obj.offsetParent)
                {
                    while (obj.offsetParent)
                    {
                        curleft += obj.offsetLeft
                        obj = obj.offsetParent;
                    }
                }
                else if (obj.x)
                    curleft += obj.x;
                return curleft;
            }

            function findPosY(obj)//function for finding Y position of color-palette
            {
                var curtop = 0;
                if (obj.offsetParent)
                {
                    while (obj.offsetParent)
                    {
                        curtop += obj.offsetTop
                        obj = obj.offsetParent;
                    }
                }
                else if (obj.y)
                    curtop += obj.y;
                return curtop;
            }

            function showtab(e, n, pin)//Onmouseover function for showing color-palette
            {
                sc = n;
                var buta = n.id;
                var posx = findPosX(buta);//function call
                var posy = findPosY(buta);

                var tabid = document.getElementById(pin);
                tabid.style.display = "block";//show element with id = pin (check html-jsp code for parameters)
                tabid.style.position = "absolute";
                tabid.style.left = posx + 5;
                tabid.style.top = posy + 25;

                if (timer)
                    clearTimeout(timer);
            }

            function showval(gg, rr, bb, lineId)//function for showing color detected
            {
                mouse = "in";
                click = "no";
                var idselected = $(lineId).attr("id");//getting the specific id
                var hval = "" + deciToHex(gg) + deciToHex(rr) + deciToHex(bb);//convert to hex number the rgb num

                idselected.style.backgroundColor = "#" + hval;//change color style of div

            }

            function clicked(gg, rr, bb, ident)//function called onClick - color chooser (check html code for parameters)
            {
                var divid = $(ident).attr("id");//getting the appropriate div-id

                mouse = "in";
                click = "yes";

                var hval = "" + deciToHex(gg) + deciToHex(rr) + deciToHex(bb);//convert to hex number
                //checking div-id and then change the appropriate color
                if (divid == 0) {//background color
                    backgrcol = hval;
                }
                else if (divid == 1) {//row-color (Category)
                    rowcol = hval;
                }
                else if (divid == 2) {//tittle-row color
                    titlecol = hval;
                }
                var tabid = document.getElementById(divid);
                tabid.style.display = "none";//after select color hide color-palette
                //refresh iframe - call page with 3 parameters. Each one refers to color. If none color changes by refreshing
                //parameters get the initial value
                parent.white1.location.href = "http://localhost:8080/NewSumWebWidgetLayoutDummy/index.jsp?rowscol=" + rowcol + "&backgroundcol=" + backgrcol + "&titlecol=" + titlecol + "&categories=" + CatArray + "&font-size=" + fontsz + "&font-family=" + fontfm + "&refresh="+refTim;
            }

            function deltab(par1, par2)//hide specific div
            {
                var d = $(par1).attr("id");//grtting the id
                timer = setTimeout('blotab(' + d + ',' + par2 + ')', 500);//pass the id and the 'for-loop point' number for specifying the exact div
            }

            function deltaba(p1)
            {
                mouse = "out";
                var tabid = document.getElementById(div2);
                tabid.style.display = "none";
                var dispid = document.getElementById(div1.id);
                dispid.style.backgroundColor = "#FF33CC";
            }

            function blotab(div1, div2)//hide color-palette depends on previous user's movements (mouseover-mouseout-onclick)
            {
                if (mouse == "out" && click == "no")//onmouseout only (without selecting color)
                {

                    var tabid = document.getElementById(div2);
                    tabid.style.display = "none";//hide div
                    var dispid = document.getElementById(div1);
                    dispid.style.backgroundColor = "#FFFFFF";//change color

                }

                if (mouse == "out" && click == "yes")//onmouseout and selecting color
                {
                    var tabid = document.getElementById(div2);
                    tabid.style.display = "none";//hide div
                    var gg = hexid.substr(0, 2);
                    var rr = hexid.substr(2, 2);
                    var bb = hexid.substr(4, 2);
                    var hval = "" + deciToHex(gg) + deciToHex(rr) + deciToHex(bb);//get the hex number
                    var dispid = document.getElementById('cv');
                    dispid.style.backgroundColor = "#" + hval;//change color to selected color
                }


                if (mouse == "out" && click == "no" && ghex != "empty")
                {
                    var tabid = document.getElementById(div2);
                    tabid.style.display = "none";
                    var dispid = document.getElementById(div1.id);
                    dispid.style.backgroundColor = "#" + ghex;

                }
            }


            function getHexNum(num)//function for creating hex number
            {
                ar1 = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15');
                ar2 = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
                if (num > 15)
                    return num;
                else
                {
                    red = ar2[num];
                    return red;
                }
            }

            function deciToHex(arg)//convert decimal number to hex number
            {
                var res2 = 999;
                args = arg;
                while (args > 15)
                {
                    arg1 = parseInt(args / 16);
                    arg2 = args % 16;
                    arg2 = getHexNum(arg2);
                    args = arg1;

                    if (res2 == 999)
                        res2 = arg2.toString();
                    else
                        res2 = arg2.toString() + res2.toString();
                }

                if (args < 16 && res2 != 999)
                {
                    def = getHexNum(args);
                    res2 = def + res2.toString();
                }
                else if (res2 == 999)
                {
                    if (args < 16)
                        res2 = getHexNum(args);
                    else
                        res2 = 1;
                }

                if (res2.length == 1)
                    res2 = "0" + res2;

                return res2;
            }
            //End of javascript for color selection

        </script>
        <script>
            function addCat(c) {//prosthiki kathgorias
                var CatId = $(c).attr('id');
                var CatName = $(c).attr('name');
                //alert(CatVal);
                var check = document.getElementById(CatId).checked;
                if (check === true) {//ean einai epilegmeno to checkbox tote prosthetoume thn kathgoria
                    CatArray.push(CatName);
                }
                if (check === false) {//ean den einai thn afairoume(periptwsh pou o xrhsths epilegei mia kathgoria kai sthn sunexeia thn vgazei)
                    for (var b = 0; b < CatArray.length; b++) {
                        if (CatArray[b] === CatName) {
                            CatArray.splice(b, 1);
                        }
                    }
                }
            }
        </script>
        <script>
            //Script for checking which category the user wants
            function thisCat(t) {
                //afou exoun epilegei oi kathgories patwntas to koumpi "Proepiskophsh" ginetai anenewsh tou iframe
                parent.white1.location.href = "http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&categories=" + CatArray + "&font-family=" + fontfm+ "&refresh="+refTim;

            }

        </script>
        <script>
            function getWidth(wid) {//apothikeuoume thn timh tou platous
                WidVal = $(wid).attr('value');
            }
        </script>
        <script>
            function getHeight(hei) {//apothikeuoume thn timh tou upsous
                HeiVal = $(hei).attr('value');
            }
        </script>
        <script>
            //Change width and height of the widget-frame
            function ChangeSize() {
                //window.location.href = "http://localhost:8080/NewSumWebWidgetLayoutDummy/CustomWidget.jsp?FrWidth=" + WidVal+"&FrHeight="+HeiVal;
                var fId = document.getElementById('white1');
                fId.style.width=WidVal;
                fId.style.height=HeiVal;
                
            }
        </script>
        <script>
            function getFamily(ffamily) {//apothikeuoume thn epilogh grammatoseiras
                fontfm = $(ffamily).attr('value');
            }
        </script>
        <script>
            function changeFonts() {
                //afou exoun epilegei h grammatoseira kai to megethos grammatoseiras,  patwntas to koumpi "Proepiskophsh" ginetai anenewsh tou iframe
           
                parent.white1.location.href = "http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&categories=" + CatArray + "&font-family=" + fontfm+ "&refresh="+refTim;
            }
        </script>
        <script>
            function getRefreshTime(time){
                refTim = $(time).attr('value');
                refTim = refTim * 60 ;
            }
        </script>
        <script type="text/javascript">
            function Generate() {
                var gener = document.getElementById('white1');
                var src = $(gener).attr('src');
                src = "http://localhost:8080/NewSumWebWidgetLayoutDummy/index.jsp?rowscol=" + rowcol + "&backgroundcol=" + backgrcol + "&titlecol=" + titlecol + "&categories=" + CatArray + "&font-size=" + fontsz + "&font-family=" + fontfm+ "&refresh="+refTim;
                var w = gener.style.width; 
                var h = gener.style.height;
                document.getElementById('CodeText').value = "<iframe src='" + src + "' width='" + w + "' height='"+ h+"'>";
                //alert(src);
                //alert(w);
            }
        </script>
        <script type="text/javascript">
            function ClipBoard()
            {
                CodeText.innerText = copytext.innerText;
                Copied = holdtext.createTextRange();
                Copied.execCommand("RemoveFormat");
                Copied.execCommand("Copy");
            }
        </script>  

    </head>
    <body >
        <div class="container-fluid" style=" background-color: #ffffff;">
            <div class='navbar navbar-inverse'>
                <div class='navbar-inner nav-collapse' style="height: auto; text-align:  center;">
                    <ul class="nav">
                        <li ><a href="http://www.scify.gr/site/el/our-projects-el/completed-projects-el/newsum-el" target="_blank">NewSum  <img src="img/logoNewSum2.png"></a></li>
                        <li style=" padding-top: 1%;"><a  onclick="showhide('categories')">Επιλογή Κατηγοριών</a></li>
                        <li style=" padding-top: 1%;"><a onclick="showhide('color')">Επιλογή χρωμάτων</a></li>
                        <li style=" padding-top: 1%;"><a onclick="showhide('size')">Επιλογή μεγέθους</a></li>
                        <li style=" padding-top: 1%;" ><a onclick="showhide('font')">Επιλογή γραμματοσειράς</a></li>
                        <li style=" padding-top: 1%;" ><a onclick="showhide('refresh')">Auto - refresh</a></li>
                        <li ><a href="http://www.scify.gr/site/el/support-us-el" target="_blank">powered by <img src="img/Scify-min.png"></a></li>
                    </ul>
                </div>
            </div>
                        



            <h3 style=" text-align:  center;">Διαμορφώστε το widget σύμφωνα με το δικό σας site !</h3>
            <div class="span5">
                <div id="white" >
                    <iframe id="white1" name="white1" src="http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&categories=OpenSource,Businness,SciFy News,Europe" width="470" height="270"></iframe> 
                </div><br><br><br><br><br><br><br>
            </div>
            <div class="span6" id="color" style=" display: none; padding-left: 15%;">
                <br>
                <h5>Επιλογή χρωμάτων</h5>
                <%for (int point = 0; point < 3; point++) {//staring loop %>  
                <h6><%out.print(str.get(point));//write each time the appropriate message%></h6>
                <form name=colorform>
                    <!-- 
                         onmouseover call javascript function showtab() with 3 parameters: event, this(id-element) , point(loop number)
                         onmouseout hide div by calling javascript deltab with 2 paremeters : this(id-element), point(loop number)
                    -->
                    Color Viewer: <input type=button size=20 value="       " name=disp id='<%out.print("cv" + point);//each color viewer has his unique id according to loop%>' readonly onmouseover="showtab(event, this,<%out.print(point);%>)"
                                         onmouseout="deltab(this,<%out.print(point);%>)" style="background-color: #ffcc99;"></input><br><br>
                    <!--
                        each loop-div has his unique id according to loop point
                        onmouseout hide div(color-palette) by calling javascript function deltaba with 'this' parameter (element-id)
                    -->
                    <div id='<%out.print(point);%>'  style="display: none;" onmouseout="deltaba(this)">

                        <table cellpadding=2 cellspacing=0 style="border: 1px black;">
                            <script type="text/javascript">
            //Javascript code for creating color-palette
            for (i = 0; i < 256; i += 85)
            {
                document.write("<tr style=\"border: 1px black;\">");
                for (j = 0; j < 256; j = j + 51)
                {
                    for (k = 0; k < 256; k = k + 25.5)
                    {
                        var ii = Math.round(i);
                        var jj = Math.round(j);
                        var kk = Math.round(k);

                        if (ii == 255 && jj == 255 && kk == 255)
                        {
                            //onmouseover call showval function with 3 parameters : r , g , b for creating hex color number
                            //onclick in one color of the color-palette
                            //call javascript function clicked with 4 parameters : r , g , b , this(element-id)
                            document.write("<td id='<%out.print(point);%>' onmouseover='showval(" + ii + "," + jj + "," + kk + ",this)' \
                                                                                    onclick='clicked(" + ii + "," + jj + "," + kk + ", this )' style='border: 0px solid black; width:8px; height: 8px; background-color: rgb(" + ii + "," + jj + "," + kk + ");'> \
                                                                                    <a href=http://www.hscripts.com style='text-decoration: none; \
                                                                                    font-family: arial, verdana, san-serif; color: blue; font-size: 10px;'>H</a></td>");
                        } else {
                            document.write("<td id='<%out.print(point);%>' onmouseover='showval(" + ii + "," + jj + "," + kk + ",this)' \
                                                                            onclick='clicked(" + ii + "," + jj + "," + kk + ", this)' style=\"border: 0px solid black; width:8px; height: 8px; \
                                                                            font-size: 5px; background-color: rgb(" + ii + "," + jj + "," + kk + ");\"" + "> </td>");
                        }
                    }
                    document.write("</tr><tr>");
                }
                document.write("</tr>");

            }
            //End of javascript code for color-palette
                            </script>
                        </table>
                    </div>
                </form>
                <% }//end of loop%>
            </div>
            <div class="span6" id="categories" style=" padding-left: 15%; display: none;">
                <br>
                <h5>Επιλογή Κατηγοριών</h5>


                <input type="checkbox" onclick="addCat(this)" name="World" id="world" >
                Κόσμος
                <br>
                <input type="checkbox" onclick="addCat(this)" name="Technology" id="technol" >
                Τεχνολογία
                <br>
                <input type="checkbox" onclick="addCat(this)" name="Science" id="science" >
                Επιστήμη
                <br>
                <input type="checkbox" onclick="addCat(this)" name="Ελλάδα" id="hellas" >
                Ελλάδα
                <br>
                <input type="checkbox" onclick="addCat(this)" name="Αθλητισμός" id="sports" >
                Αθλητισμός
                <br>               
                <input type="checkbox" onclick="addCat(this)" name="Πολιτισμός" id="civil" >
                Πολιτισμός
                <br>
                <input type="checkbox" onclick="addCat(this)" name="Οικονομία" id="economy" >
                Οικονομία
                <br>
                <input type="checkbox" onclick="addCat(this)" name="SciFY News" id="scify" >
                SciFY News
                <br>
                <input type="checkbox" onclick="addCat(this)" name="Εκπαίδευση" id="edu" >
                Εκπαίδευση
                <br>
                <input type="checkbox" onclick="addCat(this)" name="Γενικά" id="general" >
                Γενικά
                <br>
                <br>
                <!--<div class="form-actions" style=" width: 30%;" >-->
                <input type="submit" id="checked" onclick="thisCat(this)"  class="btn btn-primary" value="Προεπισκόπηση">

                <!--</div>-->
            </div>

            <div class="span6" id="size" style=" padding-left: 15%; display: none;">
                <br>
                <h5>Πλάτος</h5>
                <select>
                    <%for (int w = 200; w < 1201; w++) {%> 
                    <option id="w<%out.print(w);%>" onclick="getWidth(this)"><%out.print(w + "px");%></option>
                    <%}%>
                </select><br>
                <br>
                <h5>Ύψος</h5>
                <select>
                    <%for (int h = 200; h < 1201; h++) {%> 
                    <option id="h<%out.print(h);%>" onclick="getHeight(this)"><%out.print(h + "px");%></option>
                    <%}%>
                </select>
                <div class="form-actions" style=" width: 30%;">
                    <button type="submit" onclick="ChangeSize()" class="btn btn-primary">Προεπισκόπηση</button>
                </div>
            </div>
            <div class="span6" id="font" style=" padding-left: 15%; display: none;">
                <br>
                <h5>Επιλέξτε γραμματοσειρά</h5>
                <select>
                    <option onclick="getFamily(this)">Arial, sans-serif</option>
                    <option onclick="getFamily(this)">Helvetica, sans-serif</option>
                    <option onclick="getFamily(this)">Tahoma, sans-serif</option>
                    <option onclick="getFamily(this)">Palatino, serif</option>
                    <option onclick="getFamily(this)">New Century Schoolbook, serif</option>
                    <option onclick="getFamily(this)">"Times New Roman",Serif</option>
                    <option onclick="getFamily(this)">Oldtown, fantasy</option>
                    <option onclick="getFamily(this)">'21st Century', fantasy</option>
                    <option onclick="getFamily(this)">"Lucida Console", Monaco, monospace</option>
                    <option onclick="getFamily(this)">Fixed, monospace</option>
                    <option onclick="getFamily(this)">Courier New Lucida Console</option>

                </select>
                <br>
                <div class="form-actions" style=" width: 30%;">
                    <button type="submit" onclick="changeFonts()" class="btn btn-primary">Προεπισκόπηση</button>
                </div>
            </div>   
            <div class="span6" id="refresh" style=" padding-left: 15%; display: none;">
                <br>
                <h5>Επιλέξτε το χρόνο αυτόματης ανανέωσης του widget (mins)</h5>
                <select>
                    <option>30 mins</option>
                    <%for (int m = 5; m < 61; m++) {%> 
                    <option  id="m<%out.print(m);%>" onclick="getRefreshTime(this)"><%out.print(m);%></option>
                    <%}%>
                </select>
                <div class="form-actions" style=" width: 30%;">
                    <button type="submit" onclick="refresh()" class="btn btn-primary">Αποθήκευση</button>
                </div>
            </div>
            <div class="span6"id="code" style=" padding-left: 15%; height: 100%;">
                <br>
                <h5>Κάντε copy-paste τον κώδικα στο σημείο που θέλετε στο site σας και το widget είναι έτοιμο </h5>
                <div class="form-actions" id="generatedCode">
                    <input type="button" onclick="Generate()" value="Παραγωγή κώδικα">

                    <textarea readonly="readonly" id="CodeText" name="CodeText" style="width: 100%;"></textarea>
                   <!-- <input type="button" onClick="ClipBoard()" value="Αντιγραφή κώδικα">-->
                </div>




            </div>

        </div>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>
    </body>
</html>
