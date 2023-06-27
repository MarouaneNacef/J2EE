const logout  = document.querySelector('.home__logout')
const add = document.querySelector('.home__add')
const list = document.querySelector('.home__list')

const HomeTimeline = gsap.timeline({
})

HomeTimeline.to(add,{ duration:1, x:0,opacity:1 , ease:"power1" }).to(list,{ duration:1, x:0,opacity:1 , ease:"power1" },"-=1").to(logout,{ duration:.7,opacity:1 ,scale:1, ease:"bounce" })



logout.addEventListener('click',()=>{
    window.location.href = "http://127.0.0.1:5500/index.html"
})
// fetch('./assets/icons.json')
//   .then(response => response.json())
//   .then(iconData => {
//     // Extract the necessary properties
//     console.log(iconData);
//     const animationType = iconData.animationType;
//     const iconDataString = iconData.data;

//     // Implement the animated icon based on the animation type

//       // If the icon is an SVG animation, directly set the HTML content
//       document.querySelector('.home__logout').innerHTML = iconData;

//   })
//   .catch(error => {
//     console.error('Error loading animated icon:', error);
//   });