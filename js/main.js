// ── Header scroll effect ──
const header = document.getElementById('site-header');
if (header) {
    window.addEventListener('scroll', () => {
        header.classList.toggle('scrolled', window.scrollY > 20);
    });
}

// ── Mobile hamburger menu ──
const hamburger = document.getElementById('hamburger');
const mainNav   = document.getElementById('main-nav');

if (hamburger && mainNav) {
    hamburger.addEventListener('click', () => {
        const isOpen = mainNav.classList.toggle('open');
        hamburger.classList.toggle('active', isOpen);
        hamburger.setAttribute('aria-expanded', String(isOpen));
    });

    // Close on outside click
    document.addEventListener('click', (e) => {
        if (!hamburger.contains(e.target) && !mainNav.contains(e.target)) {
            mainNav.classList.remove('open');
            hamburger.classList.remove('active');
            hamburger.setAttribute('aria-expanded', 'false');
        }
    });

    // Mobile dropdown toggle
    const dropdownParents = mainNav.querySelectorAll('.has-dropdown');
    dropdownParents.forEach(parent => {
        const link = parent.querySelector('.nav-link');
        link.addEventListener('click', (e) => {
            if (window.innerWidth <= 768) {
                e.preventDefault();
                parent.classList.toggle('open');
            }
        });
    });
}

// ── Smooth fade-in animations on scroll ──
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -60px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
            observer.unobserve(entry.target);
        }
    });
}, observerOptions);

document.querySelectorAll('.service-card, .highlight-card, .feature-item, .process-step, .content-card, .contact-detail, .hiw-step').forEach(el => {
    el.classList.add('fade-in');
    observer.observe(el);
});

// ── Contact form handling ──
const contactForm = document.getElementById('contact-form');
if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const btn = contactForm.querySelector('button[type="submit"]');
        const originalText = btn.textContent;
        btn.textContent = 'Sending...';
        btn.disabled = true;

        if (typeof grecaptcha !== 'undefined') {
            grecaptcha.ready(function() {
                grecaptcha.execute('6LdAA7AsAAAAAOgQUSfIto3glofDgBFDL-bep31N', {action: 'submit'}).then(function(token) {
                    document.getElementById('recaptchaResponse').value = token;
                    
                    const formData = new FormData(contactForm);
                    
                    // Honeypot check
                    if (formData.get('website')) {
                        btn.textContent = '✓ Message Sent!';
                        btn.style.background = 'linear-gradient(135deg, #22c55e, #16a34a)';
                        contactForm.reset();
                        setTimeout(() => {
                            btn.textContent = originalText;
                            btn.style.background = '';
                            btn.disabled = false;
                        }, 5000);
                        return;
                    }

                    const data = {};
                    formData.forEach((value, key) => {
                        if (key !== 'website') data[key] = value;
                    });
                    
                    fetch('https://workflow.ezzones.com/webhook/form-submit', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(data)
                    })
                    .then(response => {
                        if(response.ok) {
                            btn.textContent = '✓ Message Sent!';
                            btn.style.background = 'linear-gradient(135deg, #22c55e, #16a34a)';
                            contactForm.reset();
                        } else {
                            btn.textContent = '✘ Submission Failed';
                            btn.style.background = 'linear-gradient(135deg, #ef4444, #dc2626)';
                        }
                        setTimeout(() => {
                            btn.textContent = originalText;
                            btn.style.background = '';
                            btn.disabled = false;
                        }, 5000);
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        btn.textContent = '✘ Network Error';
                        btn.style.background = 'linear-gradient(135deg, #ef4444, #dc2626)';
                        setTimeout(() => {
                            btn.textContent = originalText;
                            btn.style.background = '';
                            btn.disabled = false;
                        }, 5000);
                    });
                });
            });
        } else {
            btn.textContent = '✘ Security Blocked';
            setTimeout(() => { btn.textContent = originalText; btn.disabled = false; }, 3000);
        }
    });
}

// ── Active nav link highlighting ──
const currentPage = window.location.pathname.split('/').pop() || 'index.html';
document.querySelectorAll('.nav-link').forEach(link => {
    const href = link.getAttribute('href');
    if (href === currentPage || (currentPage === '' && href === 'index.html')) {
        link.classList.add('active');
    } else {
        link.classList.remove('active');
    }
});
