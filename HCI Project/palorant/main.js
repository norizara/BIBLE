function menubar() {
    document.querySelector(".menu-data").classList.add("active");
    document.getElementById("Menu-bar").style.display = "none";
    document.getElementById("close-icon").style.display = "block";
}

function closebar() {
    document.querySelector(".menu-data").classList.remove("active");
    document.getElementById("Menu-bar").style.display = "block";
    document.getElementById("close-icon").style.display = "none";
}

window.onclick = function(event) {
    const menu = document.querySelector(".menu-data");
    const menuIcon = document.getElementById("Menu-bar");

    if (event.target !== menu && event.target !== menuIcon && menu.classList.contains("active")) {
        closebar();
    }
};

window.addEventListener("resize", function () {
    if(window.innerWidth > 768){
        document.querySelector(".menu-data").classList.remove("active");
        document.getElementById("Menu-bar").style.display = "none";
        document.getElementById("close-icon").style.display = "none";
    }else{
        document.getElementById("Menu-bar").style.display = "block";
    }
});

function clickAgent()
{
    window.location.href="agent.html";
    }

function clickMaps()
{
    window.location.href="maps.html";
    }