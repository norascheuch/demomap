const sideNav = () => {
  const buttonOpenNav = document.getElementById("openNav")
  const buttonCloseNav = document.getElementById("closeNav")

  buttonOpenNav.addEventListener('click', () => {
    const mySidenav = document.getElementById("mySidenav")

    if (mySidenav.style.width == "0px") {
      mySidenav.style.width = "160px";
    } else {
      mySidenav.style.width = "0px";
    }
  });
}

export {sideNav};
