$(document).ready(function () {

    var just = $("#templateType").attr('class').split(" ");//[1];

    if (just) {
        if (just[1] == "default") {
            $('body').css({ "background-color": "rgba(77,77,77,1)", "color": "rgba(242,242,242,1)" });
            $(".jumbotron").css("background", "rgba(242,242,242,.2)");
        }      
        console.log(just.length);
    }
    else {
        $('body').css("background-color", "rgba(255,255,255,1)");
    }
});