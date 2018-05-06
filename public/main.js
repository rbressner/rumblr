window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("downbtn").style.display = "block";
    } else {
        document.getElementById("downbtn").style.display = "none";
    }
}


function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

// Source: https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_scroll_to_top
