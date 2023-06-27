const logout  = document.querySelector('.add__article')
const add = document.querySelector('.add__client')
const list = document.querySelector('.add__bill')

const HomeTimeline = gsap.timeline({
})

HomeTimeline.to(add,{ duration:1, x:0,opacity:1 , ease:"power1" }).to(list,{ duration:1, x:0,opacity:1 , ease:"power1" },"-=1").to(logout,{ duration:.7,opacity:1 ,scale:1, ease:"bounce" })