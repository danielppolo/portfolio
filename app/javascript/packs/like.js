// Code for heart animation
// window.onload = function(){
if (document.querySelector('.heart') !== null) {
  const heart = document.querySelector('.heart')
  heart.addEventListener('click', (event) => {
    heart.classList.toggle('love');
    heart.classList.toggle('active')
    setTimeout(()=>{ heart.classList.toggle('active'); }, 300);
  });
}
// }
