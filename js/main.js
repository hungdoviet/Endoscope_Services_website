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

    // Mobile dropdown toggle: tapping the arrow toggles submenu; tapping link text navigates to the page
    const dropdownParents = mainNav.querySelectorAll('.has-dropdown');
    dropdownParents.forEach(parent => {
        const link = parent.querySelector('.nav-link');
        const arrow = link ? link.querySelector('.dropdown-arrow') : null;

        if (arrow) {
            arrow.setAttribute('role', 'button');
            arrow.setAttribute('aria-label', 'Toggle submenu');
            arrow.setAttribute('tabindex', '0');
        }

        if (link) {
            link.addEventListener('click', (e) => {
                if (window.innerWidth <= 768) {
                    const clickedArrow = e.target.closest('.dropdown-arrow');
                    if (clickedArrow) {
                        e.preventDefault();
                        e.stopPropagation();
                        parent.classList.toggle('open');
                    }
                }
            });
        }
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

document.querySelectorAll('.service-card, .highlight-card, .feature-item, .process-step, .content-card, .contact-detail, .hiw-step, .faq-accordion-item').forEach(el => {
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
                    
                    fetch('https://workflow.forexdaily.ezzones.com/webhook/form-submit', {
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
const normalizePath = (p) => {
    if (!p) return '/';
    let clean = p.replace(/\/index\.html$/, '/').replace(/\.html$/, '');
    if (clean.length > 1 && clean.endsWith('/')) {
        clean = clean.slice(0, -1);
    }
    return clean.startsWith('/') ? clean : '/' + clean;
};
const currentPath = normalizePath(window.location.pathname);

document.querySelectorAll('.nav-link').forEach(link => {
    const href = normalizePath(link.getAttribute('href'));
    const parentDropdown = link.closest('.has-dropdown');
    let isChildActive = false;

    if (parentDropdown) {
        parentDropdown.querySelectorAll('.dropdown-menu a').forEach(subLink => {
            if (normalizePath(subLink.getAttribute('href')) === currentPath) {
                isChildActive = true;
            }
        });
    }

    if (href === currentPath || isChildActive) {
        link.classList.add('active');
    } else {
        link.classList.remove('active');
    }
});
