(function(){
  var S='sinibaca-theme-state';
  var states=['light','dark','warm'];
  var icons=['fas fa-sun','fas fa-moon','fas fa-fire'];
  var titles=['Switch to Dark','Switch to Warm','Switch to Light'];

  function applyState(n){
    var s=states[n];
    document.body.classList.remove('warm-mode','warm-active');
    if(s==='warm'){
      document.documentElement.setAttribute('data-mode','light');
      document.body.classList.add('warm-mode','warm-active');
    } else {
      document.documentElement.setAttribute('data-mode',s);
    }
    localStorage.setItem(S,n);
    var b=document.getElementById('theme-cycle');
    if(b){
      b.innerHTML='<i class="'+icons[n]+'"></i>';
      b.title=titles[n];
      b.setAttribute('aria-label',titles[n]);
    }
  }

  function inject(){
    if(document.getElementById('theme-cycle'))return;
    var old=document.getElementById('mode-toggle');
    if(!old)return;
    old.style.display='none';
    var b=document.createElement('button');
    b.id='theme-cycle';
    b.className='btn btn-link nav-link';
    var n=parseInt(localStorage.getItem(S)||'0');
    b.innerHTML='<i class="'+icons[n]+'"></i>';
    b.title=titles[n];
    b.setAttribute('aria-label',titles[n]);
    b.onclick=function(){
      var cur=parseInt(localStorage.getItem(S)||'0');
      var next=(cur+1)%3;
      applyState(next);
    };
    old.parentNode.insertBefore(b,old);
  }

  document.addEventListener('DOMContentLoaded',function(){
    var n=parseInt(localStorage.getItem(S)||'0');
    applyState(n);
    inject();
  });
})()