/* The addToc() method is called when the web page loads */
window.onload = init;


function init()
{
	addHeader();
	addToc();
	addFooter();
}


/* Added by JOM: Holds literal header strings:	
   var headerItemsData = [  ["","Professor Jeff Miller"] 
                          ];  */

/* Holds the literal strings required for building the nav. Allows us to make all the buttons in a nice for loop */
var tocItemsData = [	["index.htm", "Contact & ID"],
						["Research.htm", "Research"],
						["StudentInfo.htm", "Student Info"],
						["Software.htm", "Free Software"],
						["StatsBook.htm", "Stats Book"],
						["Publications.htm", "Publications"],
						["Posters.htm", "Conferences"]
					];
					
/* Given text for the href and link text of an <a>, creates and returns an <li><a> element */
function createNewLi(href, linkText)
{
	var newLI = document.createElement('li');
	var newAnchor = document.createElement('a');
	newAnchor.href = href;
	newAnchor.innerHTML = linkText;
	newAnchor.className = "tocItemsLink";
		
	return newAnchor;
}

function addHeader()
{
/* Additions by JOM to produce the header superimposed over the image */
	var headerDiv = document.getElementById('header');

	var newP = document.createElement('p');
	var newTxt = document.createTextNode('Professor Jeff Miller');
	newP.appendChild(newTxt);
	headerDiv.appendChild(newP);

	var newP = document.createElement('p');
	var newHREF = document.createElement('a');
	newHREF.setAttribute('href', 'http://www.otago.ac.nz/psychology');
	newHREF.appendChild(document.createTextNode('Department of Psychology'));
	newP.appendChild(newHREF);
	headerDiv.appendChild(newP);

	var newP = document.createElement('p');
	var newHREF = document.createElement('a');
	newHREF.setAttribute('href', 'http://www.otago.ac.nz');
	newHREF.appendChild(document.createTextNode('University of Otago'));
	newP.appendChild(newHREF);
	headerDiv.appendChild(newP);

	var newP = document.createElement('p');
	var newTxt = document.createTextNode('Dunedin, New Zealand');
	newP.appendChild(newTxt);
	headerDiv.appendChild(newP);
/* End of additions by JOM */

}

function addFooter()
{
	var footerDiv = document.getElementById('footer');

	/* put in the divider line which is a class defined elsewhere */
	var newDIV = document.createElement('div');
	newDIV.setAttribute('class','divider');
	footerDiv.appendChild(newDIV);

	var newAddr = document.createElement('address');
	var newTxt = document.createTextNode('Send comments to: ');
	newAddr.appendChild(newTxt);
	var newHREF = document.createElement('a');
	newHREF.setAttribute('href', 'mailto:miller@psy.otago.ac.nz');
	newHREF.appendChild(document.createTextNode('miller @ psy.otago.ac.nz'));
	newAddr.appendChild(newHREF);
	var newSPAN = document.createElement('span');
	newSPAN.setAttribute('class','update');
        /* NewJeff: Change last update, separately for BIB & RIS files in publications.htm */
	newSPAN.appendChild(document.createTextNode('Last update: 20 January, 2021'));
	newAddr.appendChild(newSPAN);
	footerDiv.appendChild(newAddr);

}

/* Populates the toc div with <ul><li><a> as defined byt the tocItemsData array */
/* The calls to 'appendChild' below, modify the DOM -- the browser's in-memory  */
/* representation of the page. Modifying the DOM causes the page to be redrawn	*/
/* but no server touch is needed.						*/
function addToc()
{

	/* Get a reference to the toc <div>. This is physically in the html file. */
	/* We will build the <ul> and place it inside this <div>. */
	var tocDiv = document.getElementById('toc');

	/* Create a <ul> and set its id for later access (in case you need it) */
	var tocUL = document.createElement('ul');
	tocUL.id = "tocItems";
	
	/* Cycle through the tocItemsData array. Create each <li><a> and add it to the <ul> */
	for (var i=0; i<tocItemsData.length; i++)
	{
		/* Get the new <li><a> */
		var newLi = createNewLi(tocItemsData[i][0], tocItemsData[i][1]);
		
		/* Add it to the <ul> */
		tocUL.appendChild(newLi);
	}
	
	/* Add the prepared <ul> to the toc <div> */
	tocDiv.appendChild(tocUL);	
}

/* Implementing the show/hide for Further Descriptions on the Software page */
function toggle_visibility(id) 
{
    var element = document.getElementById(id);
	if(element.style.display == 'block')
		element.style.display = 'none';
    else
		element.style.display = 'block';
}


