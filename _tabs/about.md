---
# the default layout is 'page'
icon: fas fa-info-circle
order: 4
---

<style>
  .about-container {
    max-width: 720px;
    margin: 0 auto;
    padding: 0.5rem 0 2rem;
  }

  .about-hero {
    text-align: center;
    margin-bottom: 2.5rem;
  }

  .about-avatar-wrap {
    position: relative;
    display: inline-block;
    margin-bottom: 1.25rem;
  }

  .about-avatar {
    width: 130px;
    height: 130px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #0969da;
    box-shadow: 0 6px 24px rgba(9, 105, 218, 0.18);
    position: relative;
    z-index: 2;
    transition: transform 0.3s ease;
  }

  .about-avatar:hover {
    transform: scale(1.05);
  }

  .about-avatar-ring {
    position: absolute;
    top: -6px;
    left: -6px;
    right: -6px;
    bottom: -6px;
    border-radius: 50%;
    border: 2px dashed #0969da;
    opacity: 0.25;
    animation: rotate 24s linear infinite;
    z-index: 1;
  }

  @keyframes rotate {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
  }

  .about-heading {
    font-size: 2.25rem;
    font-weight: 800;
    margin-bottom: 0.75rem;
    letter-spacing: -0.025em;
    line-height: 1.2;
  }

  .about-tagline {
    font-size: 1.1rem;
    font-style: italic;
    opacity: 0.75;
    max-width: 500px;
    margin: 0 auto;
    line-height: 1.6;
  }

  .about-tagline::before {
    content: '“';
    margin-right: 0.2em;
    opacity: 0.5;
  }

  .about-tagline::after {
    content: '”';
    margin-left: 0.2em;
    opacity: 0.5;
  }

  .about-card {
    background: rgba(128, 128, 128, 0.04);
    border: 1px solid rgba(128, 128, 128, 0.12);
    border-radius: 14px;
    padding: 1.75rem;
    margin-bottom: 1.25rem;
    transition: all 0.25s ease;
    color: inherit;
  }

  .about-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 32px rgba(0, 0, 0, 0.1);
    border-color: rgba(9, 105, 218, 0.3);
  }

  .about-card-title {
    font-size: 1.15rem;
    font-weight: 700;
    margin-bottom: 0.875rem;
    display: flex;
    align-items: center;
    gap: 0.625rem;
    color: inherit;
  }

  .about-card-icon {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    background: linear-gradient(135deg, #0969da, #54aeff);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    font-size: 0.875rem;
    flex-shrink: 0;
  }

  .about-card p {
    margin-bottom: 0.75rem;
    line-height: 1.75;
    font-size: 0.95rem;
    color: inherit;
  }

  .about-card p:last-child {
    margin-bottom: 0;
  }

  .about-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 1.25rem;
    margin-top: 1.25rem;
  }

  @media (min-width: 640px) {
    .about-grid {
      grid-template-columns: repeat(2, 1fr);
    }
  }

  .about-cta {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    margin-top: 0.75rem;
    padding: 0.75rem 1.25rem;
    background: linear-gradient(135deg, #0969da, #54aeff);
    color: #fff !important;
    text-decoration: none !important;
    border-radius: 10px;
    font-weight: 600;
    font-size: 0.9rem;
    transition: all 0.2s ease;
    box-shadow: 0 4px 16px rgba(9, 105, 218, 0.25);
    border: none;
    cursor: pointer;
  }

  .about-cta:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 24px rgba(9, 105, 218, 0.35);
    color: #fff !important;
    text-decoration: none !important;
  }

  .about-cta-arrow {
    transition: transform 0.2s ease;
  }

  .about-cta:hover .about-cta-arrow {
    transform: translateX(3px);
  }

  .about-footer {
    text-align: center;
    margin-top: 2.5rem;
    padding-top: 1.5rem;
    border-top: 1px solid rgba(128, 128, 128, 0.12);
    font-size: 0.8rem;
    opacity: 0.6;
  }
</style>

<div class="about-container">
  <div class="about-hero">
    <div class="about-avatar-wrap">
      <div class="about-avatar-ring"></div>
      <img src="/assets/img/avatar.png" alt="Avatar sinibaca" class="about-avatar" loading="lazy">
    </div>
    <h1 class="about-heading">Tentang</h1>
    <p class="about-tagline">Nulis kalau semua kondisi mendukung, dan itu jarang terjadi.</p>
  </div>

  <div class="about-card">
    <div class="about-card-title">
      <span class="about-card-icon"><i class="fas fa-book-open"></i></span>
      Apa itu Sinibaca?
    </div>
    <p>
      Sinibaca adalah tempat aku menuangkan pikiran — soal filsafat, cara berpikir, dan hal-hal yang terasa penting tapi jarang dibicarakan.
    </p>
    <p>
      Ini bukan sekadar blog. Ini adalah ruang refleksi, tempat ide-ide liar dan pertanyaan-pertanyaan yang mengganggu dituliskan sebelum terlupakan oleh waktu.
    </p>
  </div>

  <div class="about-grid">
    <div class="about-card">
      <div class="about-card-title">
        <span class="about-card-icon"><i class="fas fa-brain"></i></span>
        Filsafat & Berpikir
      </div>
      <p>
        Dari Sokrates hingga Stoisisme, dari Diogenes hingga pemikiran kontemporer — filsafat adalah bahan bakar untuk memahami hidup lebih dalam.
      </p>
    </div>

    <div class="about-card">
      <div class="about-card-title">
        <span class="about-card-icon"><i class="fas fa-robot"></i></span>
        Otomasi & Tools
      </div>
      <p>
        Di luar sini, aku membangun sistem otomasi, tools, dan workflow. Kalau kamu penasaran dengan sisi itu —
      </p>
      <a href="https://riskiipriyadi.github.io/portofolio" target="_blank" rel="noopener noreferrer" class="about-cta">
        Lihat portfolio saya
        <span class="about-cta-arrow">→</span>
      </a>
    </div>
  </div>

  <div class="about-footer">
    <p>© 2026 sinibaca · Dibuat dengan pikiran yang terus bertanya</p>
  </div>
</div>