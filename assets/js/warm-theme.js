(function() {
  // Apply saved theme or default based on prefers-color-scheme
  function applyMode(mode) {
    document.documentElement.setAttribute('data-mode', mode);
  }

  var stored = localStorage.getItem('theme');
  var mode;
  if (stored) {
    mode = stored;
  } else {
    mode = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  }
  applyMode(mode);

  function createToggle() {
    var btn = document.createElement('button');
    btn.id = 'warm-theme-toggle';
    btn.setAttribute('aria-label', 'Toggle theme mode');
    btn.title = 'Toggle theme mode';
    btn.innerHTML = '🕯️'; // candle icon
    // Attempt to mimic existing theme button styling if present
    var existing = document.querySelector('.theme-switch-btn');
    if (existing) {
      btn.className = existing.className; // copy classes
      // Insert after existing theme button
      existing.parentNode.insertBefore(btn, existing.nextSibling);
    } else {
      // Fallback: fixed position bottom left
      btn.style.position = 'fixed';
      btn.style.bottom = '1rem';
      btn.style.left = '1rem';
      btn.style.zIndex = '1000';
      btn.style.padding = '0.5rem';
    }

    btn.addEventListener('click', function() {
      var current = localStorage.getItem('theme') || (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
      var next;
      if (current === 'light') next = 'dark';
      else if (current === 'dark') next = 'warm';
      else next = 'light';
      localStorage.setItem('theme', next);
      applyMode(next);
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', createToggle);
  } else {
    createToggle();
  }
})();