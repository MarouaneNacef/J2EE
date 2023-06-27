const login = document.querySelector('.login');
const loginImg = document.querySelector('.login__img');
const loginUser = document.querySelector('.loginUser');
const loginPassword = document.querySelector('.loginPassword');
const loginBtn = document.querySelector('.loginBtn');


const loginTimeline = gsap.timeline({
})

loginTimeline.to(login,{ duration:1, scale: 1,opacity:1 , ease:"bounce" }).to(loginUser,{ duration:.7, opacity:1 , ease:"slow" }).to(loginPassword,{ duration:.7,opacity:1 , ease:"slow" }).to(loginBtn,{ duration:.7,opacity:1 , ease:"slow" }).to(loginImg,{ duration:.7,opacity:1 , ease:"slow" })


//loginBtn.addEventListener("click",(e)=>{
//    e.preventDefault()
//    window.location.href = 'http://127.0.0.1:5500/home.html';
//})