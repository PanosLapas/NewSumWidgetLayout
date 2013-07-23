
<!DOCTYPE html>
<head>
    <title>Bootstrap Tutorial</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >
    <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <style type='text/css'>
        body {
            background-color: #CCC;
        }
    </style>
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
        function showdiv(id) {
            if (document.getElementById(id).style.display == "none") {

                document.getElementById(id).style.display = "block";
            }
            else {
                document.getElementById(id).style.display = "none";
            }
        }
        function hidediv(id) {
            document.getElementById(id).style.display = 'none';
        }

    </script>


    <!--        Script by hscripts.com          -->
    <!--        copyright of HIOX INDIA         -->
    <!-- Free javascripts @ http://www.hscripts.com -->
    <script type="text/javascript">
        var mouse = "out";
        var bName = navigator.appName;
        var bVer = parseInt(navigator.appVersion);
        var IE4 = (bName == "Microsoft Internet Explorer" && bVer >= 4);
        var click = "no";
        var ghex = "empty";
        var timer;

        function findPosX(obj)
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

        function findPosY(obj)
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

        function showtab(e, n)
        {
            sc = n;
            var buta = document.getElementById('cv');
            var posx = findPosX(buta);
            var posy = findPosY(buta);

            var tabid = document.getElementById('tb');
            tabid.style.display = "block";
            tabid.style.position = "absolute";
            tabid.style.left = posx + 5;
            tabid.style.top = posy + 25;

            if (timer)
                clearTimeout(timer);
        }

        function showval(gg, rr, bb)
        {
            mouse = "in";
            click = "no";
            var hexid = document.getElementById('hx');
            var hexid1 = document.getElementById('hx1');
            var hval = "" + deciToHex(gg) + deciToHex(rr) + deciToHex(bb);
             var hval1 = "" + deciToHex(gg) + deciToHex(rr) + deciToHex(bb);
            hexid.value = hval;
            hexid1.value = hval1;
            var dispid = document.getElementById('cv');
            dispid.style.backgroundColor = "#" + hval;

        }

        function clicked(gg, rr, bb)
        {

            mouse = "in";
            click = "yes";
            var hexid = document.getElementById('hx');
            var hexid1 = document.getElementById('hx1');
            var hval = "" + deciToHex(gg) + deciToHex(rr) + deciToHex(bb);
            var hval1 = "" + deciToHex(gg) + deciToHex(rr) + deciToHex(bb);
            hexid.value = hval;
            hexid1.value = hval1;
            var dispid = document.getElementById('cv');
            dispid.style.backgroundColor = "#" + hval;
            var tabid = document.getElementById('tb');
            tabid.style.display = "none";
            ghex = hexid.value;
            parent.white1.location.href = "http://localhost:8080/NewSumWebWidgetLayoutDummy/index.jsp?col="+ hval + "&bgc=" + hval1;
        }

        function deltab()
        {
            timer = setTimeout('blotab()', 500);
        }

        function deltaba()
        {
            mouse = "out";
            timer = setTimeout('blotab()', 500);
        }

        function blotab()
        {
            if (mouse == "out" && click == "no")
            {

                var tabid = document.getElementById('tb');
                tabid.style.display = "none";
                var hexid = document.getElementById('hx');
                hexid.value = "FF33CC";
                var dispid = document.getElementById('cv');
                dispid.style.backgroundColor = "#FF33CC";

            }

            if (mouse == "out" && click == "yes")
            {
                var tabid = document.getElementById('tb');
                tabid.style.display = "none";
                var hexid = document.getElementById('hx').value;
                var gg = hexid.substr(0, 2);
                var rr = hexid.substr(2, 2);
                var bb = hexid.substr(4, 2);
                var hval = "" + deciToHex(gg) + deciToHex(rr) + deciToHex(bb);
                var dispid = document.getElementById('cv');
                dispid.style.backgroundColor = "#" + hval;
            }


            if (mouse == "out" && click == "no" && ghex != "empty")
            {
                var tabid = document.getElementById('tb');
                tabid.style.display = "none";
                var hexid = document.getElementById('hx');
                hexid.value = ghex;
                var dispid = document.getElementById('cv');
                dispid.style.backgroundColor = "#" + ghex;

            }
        }


        function getHexNum(num)
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

        function deciToHex(arg)
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

    </script>
    <!-- Script by hscripts.com -->


</head>
<body>
    <div class="container" id="colid"> 
        <h1>Choose widget color dummy version</h1>
        <div class='navbar navbar-inverse'>
            <div class='navbar-inner nav-collapse' style="height: auto;">
                <ul class="nav">
                    <li class="active"><a href="#">Home</a></li>
                </ul>
            </div>
        </div>



        <h2>NewSum Web Widget</h2>
        <p>Select background-color</p>
        <div class="span6">
            
            <form name=colorform>
                Hex Value: #<input name=hexval id=hx value=FF33CC size=7></input><br><br>
                Color Viewer: <input type=button size=20 value="                   " name=disp id=cv readonly onmouseover="showtab(event)"
                                     onmouseout="deltab()" style="background-color:#FF33CC;"></input><br><br>
                <div id=tb style="display: none;" onmouseout="deltaba()">
                    <table cellpadding=2 cellspacing=0 style="border: 1px black;">
                        <script type="text/javascript">
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
                        document.write("<td onmouseover='showval(" + ii + "," + jj + "," + kk + ")' \
                                                                                onclick='clicked(" + ii + "," + jj + "," + kk + ")' style='border: 0px solid black; width:8px; height: 8px; background-color: rgb(" + ii + "," + jj + "," + kk + ");'> \
                                                                                <a href=http://www.hscripts.com style='text-decoration: none; \
                                                                                font-family: arial, verdana, san-serif; color: blue; font-size: 10px;'>H</a></td>");
                    } else {
                        document.write("<td onmouseover='showval(" + ii + "," + jj + "," + kk + ")' \
                                                                        onclick='clicked(" + ii + "," + jj + "," + kk + ")' style=\"border: 0px solid black; width:8px; height: 8px; \
                                                                        font-size: 5px; background-color: rgb(" + ii + "," + jj + "," + kk + ");\"" + "> </td>");
                    }
                }
                document.write("</tr><tr>");
            }
            document.write("</tr>");

        }
                        </script>
                    </table>
                </div>
            </form>

        </div>
        <p>Select Rows-color</p>
        
            <form name=colorform1>
                Hex Value: #<input name=hexval id="hx1" value=FF33CC size=7></input><br><br>
                Color Viewer: <input type=button size=20 value="                   " name=disp id=cv readonly onmouseover="showtab(event)"onmouseout="deltab()" style="background-color:#FF33CC;"></input><br><br>
               
            </form>
        
        
        <div id="white" >
            <iframe id="white1" name="white1" src="http://localhost:8080/NewSumWebWidgetLayoutDummy/index.jsp?col=0000FF&bgc=00FFFF" width="372" height="340"></iframe> 
        </div>

       

    </div>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/scify.index.js"></script>
</body>
</html>