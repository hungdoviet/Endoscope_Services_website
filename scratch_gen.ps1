$baseDir = "e:\EndoscopeServices\Web\AI WEB ES"
$indexPath = Join-Path $baseDir "index.html"
$utf8 = New-Object System.Text.UTF8Encoding $False
$indexHtml = [IO.File]::ReadAllText($indexPath, $utf8)

$headerMatch = [regex]::Match($indexHtml, '(?s)<!DOCTYPE html>.*?</header>')
$footerMatch = [regex]::Match($indexHtml, '(?s)<footer class="site-footer">.*?</html>')

$header = $headerMatch.Value
$footer = $footerMatch.Value

$pages = @(
    @{
        fileName = 'services.html';
        title    = 'Endoscope Repair & Maintenance';
        desc     = 'Comprehensive repair and maintenance services for flexible endoscopes and surgical power tools.';
        content  = @"
        <div class="two-col-grid">
            <a href="colonoscope-repair.html" class="content-card">
                <h3>&#x1F52C; Colonoscope Repair</h3>
                <p>Expert repair and rebuild of colonoscopes to OEM standards for optimal performance.</p>
            </a>
            <a href="gastroscope-repair.html" class="content-card">
                <h3>&#x1F3E5; Gastroscope Repair</h3>
                <p>Precision repair services for gastroscopes used in gastrointestinal procedures.</p>
            </a>
            <a href="bronchoscope-repair.html" class="content-card">
                <h3>&#x1FAC1; Bronchoscope Repair</h3>
                <p>Specialized services for bronchoscopes used in respiratory diagnostics.</p>
            </a>
            <a href="surgical-power-tools.html" class="content-card">
                <h3>&#x2699;&#xFE0F; Surgical Power Tools</h3>
                <p>Repair and maintenance for all major brands of surgical power tools.</p>
            </a>

        </div>
        <div class="info-box">
            <h4>Ready for Service?</h4>
            <p>Contact us today for a free quotation. We provide comprehensive reports for all repairs. <a href="contact.html" style="color:var(--clr-primary);font-weight:600;">Get a Quote &rarr;</a></p>
        </div>
"@
    },
    @{
        fileName = 'colonoscope-repair.html';
        title    = 'Colonoscope Repair';
        desc     = 'Expert repair and rebuild of colonoscopes to OEM standards for optimal performance.';
        content  = @"
        <h2>Comprehensive Colonoscope Servicing</h2>
        <p>Colonoscopes undergo significant wear and tear. We provide full-service repair and maintenance to ensure optimal functioning and image clarity. Our technicians are trained to handle minor adjustments to complete rebuilds.</p>
        <div class="two-col-grid">
            <div class="content-card">
                <h3>Common Repairs</h3>
                <ul>
                    <li>Insertion tube replacement</li>
                    <li>Bending rubber replacement</li>
                    <li>Light guide tube repair</li>
                    <li>Fluid invasion removal</li>
                </ul>
            </div>
            <div class="content-card">
                <h3>Our Process</h3>
                <p>We conduct an exhaustive 40-point inspection before and after any repair to ensure the scope meets all OEM specifications and safety standards.</p>
            </div>
        </div>
"@
    },
    @{
        fileName = 'gastroscope-repair.html';
        title    = 'Gastroscope Repair';
        desc     = 'Precision repair services for gastroscopes used in gastrointestinal procedures.';
        content  = @"
        <h2>Reliable Gastroscope Maintenance</h2>
        <p>A functioning gastroscope is critical for accurate diagnostics. We provide fast, reliable repairs to get your equipment back in service quickly without compromising quality.</p>
        <div class="two-col-grid">
            <div class="content-card">
                <h3>Services Offered</h3>
                <ul>
                    <li>Angulation adjustment and repair</li>
                    <li>Biopsy channel replacement</li>
                    <li>Image bundle repair/replacement</li>
                    <li>Nozzle unclogging and replacement</li>
                </ul>
            </div>
            <div class="content-card">
                <h3>OEM Parts</h3>
                <p>We use high-quality, OEM-compatible parts to ensure longevity and precise handling characteristics for physicians.</p>
            </div>
        </div>
"@
    },
    @{
        fileName = 'bronchoscope-repair.html';
        title    = 'Bronchoscope Repair';
        desc     = 'Specialized services for bronchoscopes used in respiratory diagnostics.';
        content  = @"
        <h2>Bronchoscope Care & Repair</h2>
        <p>Bronchoscopes are delicate instruments. Our specialized technicians handle them with the utmost care, repairing everything from minor kinks to full insertion tube replacements.</p>
        <div class="two-col-grid">
            <div class="content-card">
                <h3>Expert Solutions</h3>
                <ul>
                    <li>Suction channel repairs</li>
                    <li>Bending section mesh replacement</li>
                    <li>Objective lens cleaning and resealing</li>
                </ul>
            </div>
            <div class="content-card">
                <h3>Quick Turnaround</h3>
                <p>Understanding the critical nature of respiratory diagnostics, we prioritize bronchoscope repairs for a swift return to your facility.</p>
            </div>
        </div>
"@
    },
    @{
        fileName = 'surgical-power-tools.html';
        title    = 'Surgical Power Tool Repair';
        desc     = 'Repair and maintenance for all major brands of surgical power tools.';
        content  = @"
        <h2>Precision Power Tool Repairs</h2>
        <p>We repair pneumatic, battery, and electric surgical power tools from major brands including Stryker, Hall, Linvatec, and MicroAire.</p>
        <div class="two-col-grid">
            <div class="content-card">
                <h3>Types of Tools Serviced</h3>
                <ul>
                    <li>Drills and Reamers</li>
                    <li>Saws (Sagittal, Oscillating, Reciprocating)</li>
                    <li>Attachments and Consoles</li>
                    <li>Battery Packs and Chargers</li>
                </ul>
            </div>
            <div class="content-card">
                <h3>Quality Assurance</h3>
                <p>Every tool undergoes rigorous load testing and RPM verification to ensure it performs perfectly in the operating room.</p>
            </div>
        </div>
"@
    },

    @{
        fileName = 'sell-equipment.html';
        title    = 'Sell Your Equipment';
        desc     = 'Information on selling and trading medical equipment.';
        content  = @"
        <h2>Unlock Value from Retired Equipment</h2>
        <p>Upgrade your inventory or clear out unused storage by selling your retired or broken flexible endoscopes and surgical power tools to us. We offer competitive market rates.</p>
        <div class="info-box">
            <h4>Trade-in Options Available</h4>
            <p>Looking to upgrade? We offer credit towards repairs or refurbished equipment when you trade in your old scopes.</p>
        </div>
        <div class="two-col-grid">
            <div class="content-card">
                <h3>What We Buy</h3>
                <ul>
                    <li>Olympus, Pentax, and Fujinon Scopes</li>
                    <li>Broken or non-functional equipment</li>
                    <li>Surplus operational equipment</li>
                    <li>Surgical power tools and consoles</li>
                </ul>
            </div>
            <div class="content-card">
                <h3>How It Works</h3>
                <p>Provide us with a list of models and their condition. We will offer a preliminary quote. Once received and evaluated, we provide prompt payment.</p>
            </div>
        </div>
"@
    },
    @{
        fileName = 'handling-procedures.html';
        title    = 'Handling Procedures';
        desc     = 'Educational content on equipment handling and damage prevention.';
        content  = @"
        <h2>Preventing Endoscope Damage</h2>
        <p>The majority of endoscope repairs are due to handling damage. Proper care and handling can significantly extend the life of your equipment and reduce repair costs.</p>
        <div class="two-col-grid">
            <div class="content-card">
                <h3>Best Practices</h3>
                <ul>
                    <li>Never stack scopes during transport.</li>
                    <li>Use appropriate carrying cases or trays.</li>
                    <li>Ensure light-guide cables are not tightly coiled.</li>
                    <li>Always attach water-resistant caps before leak testing.</li>
                </ul>
            </div>
            <div class="content-card">
                <h3>Staff Training</h3>
                <p>We offer on-site educational sessions for your clinical and reprocessing staff to reinforce proper handling protocols.</p>
            </div>
        </div>
"@
    },
    @{
        fileName = 'contact.html';
        title    = 'Contact Us';
        desc     = 'Get in touch for repair quotes, questions, or to schedule a service.';
        content  = @"
        <div class="contact-layout">
            <div class="contact-info-block">
                <h2>Let's discuss your repair needs</h2>
                <p>Reach out to discuss your equipment repair, request a loaner, or find out more about our maintenance plans.</p>
                
                <div class="contact-detail">
                    <div class="contact-detail-icon">&#x1F4CD;</div>
                    <div class="contact-detail-text">
                        <h4>Head Office</h4>
                        <p>3 Barnett Grove, Noble Park<br>Victoria 3174, Australia</p>
                    </div>
                </div>
                
                <div class="contact-detail">
                    <div class="contact-detail-icon">&#x1F4DE;</div>
                    <div class="contact-detail-text">
                        <h4>Phone (Peter)</h4>
                        <a href="tel:0448334797">0448 334 797</a>
                    </div>
                </div>

                <div class="contact-detail">
                    <div class="contact-detail-icon">&#x1F4DE;</div>
                    <div class="contact-detail-text">
                        <h4>Phone (Kevin)</h4>
                        <a href="tel:0435730477">0435 730 477</a>
                    </div>
                </div>
                
                <div class="contact-detail">
                    <div class="contact-detail-icon">&#x2709;&#xFE0F;</div>
                    <div class="contact-detail-text">
                        <h4>Email</h4>
                        <a href="mailto:kevin@endoscopeservices.com.au">kevin@endoscopeservices.com.au</a>
                    </div>
                </div>
            </div>
            
            <div class="contact-form-wrapper">
                <h3>Send a Message</h3>
                <form id="contact-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">Your Name</label>
                            <input type="text" id="name" name="name" required placeholder="e.g. Dr. Sarah Miller">
                        </div>
                        <div class="form-group">
                            <label for="facility">Facility / Hospital</label>
                            <input type="text" id="facility" name="facility" required placeholder="e.g. Royal Melbourne Hospital">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required placeholder="name@hospital.com.au">
                    </div>
                    <div class="form-group">
                        <label for="service">Service Needed</label>
                        <select id="service" name="service">
                            <option>General Inquiry</option>
                            <option>Repair Quote</option>
                            <option>Loaner Request</option>
                            <option>Sell Equipment</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" required placeholder="How can we help you?"></textarea>
                    </div>
                    
                    <div style="display:none;">
                        <label>Leave this field empty</label>
                        <input type="text" name="website" autocomplete="off">
                    </div>
                    <input type="hidden" name="recaptcha_response" id="recaptchaResponse">
                    <button type="submit" class="btn btn-primary" style="width: 100%; justify-content: center;">Send Message</button>
                </form>
            </div>
        </div>
        <script src="https://www.google.com/recaptcha/api.js?render=6LdAA7AsAAAAAOgQUSfIto3glofDgBFDL-bep31N"></script>
"@
    },
    @{
        fileName = 'loan-endoscopes.html';
        title    = 'Loan Endoscope Services';
        desc     = 'Stay operational with our loan scope service while your equipment is being repaired.';
        content  = @"
        <h2>Minimize Clinical Downtime</h2>
        <p>We understand that a broken endoscope can halt your schedule and impact patient care. To ensure you stay operational, we offer a comprehensive loaner program for our repair clients.</p>
        
        <div class="how-it-works-steps">
            <div class="hiw-step">
                <div class="hiw-num">1</div>
                <h4>Request Repair</h4>
                <p>Contact us with your broken scope details and request a compatible loaner.</p>
            </div>
            <div class="hiw-step">
                <div class="hiw-num">2</div>
                <h4>Loaner Dispatch</h4>
                <p>We rapidly express ship a sterilized, tested loaner scope to your facility.</p>
            </div>
            <div class="hiw-step">
                <div class="hiw-num">3</div>
                <h4>Send Damaged Scope</h4>
                <p>Use the provided packaging to send your broken scope to us for evaluation.</p>
            </div>
            <div class="hiw-step">
                <div class="hiw-num">4</div>
                <h4>Return Loaner</h4>
                <p>Once your repaired scope is returned, send the loaner back to our facility.</p>
            </div>
        </div>

        <div class="info-box">
            <h4>Extensive Inventory</h4>
            <p>Our loaner pool includes a wide range of Olympus, Pentax, and Fujinon scopes. While we strive to match your exact model, an equivalent alternative may be provided to ensure you can continue procedures.</p>
            <br>
            <p><a href="loaner-tc.html" style="color:var(--clr-primary);font-weight:600;">Read Loaner Terms & Conditions &rarr;</a></p>
        </div>
"@
    },
    @{
        fileName = 'loaner-tc.html';
        title    = 'Endoscope Loaner T&C';
        desc     = 'Terms and conditions regarding our loaner endoscope services.';
        content  = @"
        <h2>Loaner Equipment Terms & Conditions</h2>
        <p>Please review our terms regarding the use and care of our loaner equipment.</p>
        <ul>
            <li><strong>Care and Handling:</strong> The receiving facility is responsible for treating the loaner equipment with the same high standard of care as their own equipment.</li>
            <li><strong>Damage Liability:</strong> Any damage incurred to the loaner scope while in the possession of the facility or during return transit is the financial responsibility of the facility.</li>
            <li><strong>Reprocessing:</strong> Loaners must be thoroughly cleaned and high-level disinfected according to manufacturer specifications before being returned.</li>
            <li><strong>Return Timeframe:</strong> Loaners must be returned within 3 business days of receiving the repaired original equipment. Late returns may incur a daily rental fee.</li>
            <li><strong>Intended Use:</strong> Loaners are provided exclusively for use in place of equipment currently being repaired by Endoscope Services.</li>
        </ul>
        <div class="info-box">
            <p>By accepting a loaner from Endoscope Services, your facility agrees to these terms and conditions.</p>
        </div>
"@
    },
    @{
        fileName = 'warranty.html';
        title    = 'Warranty Policy';
        desc     = 'Information on our 90-day comprehensive repair warranty.';
        content  = @"
        <h2>Our Commitment to Quality</h2>
        <p>Endoscope Services stands behind the quality of our workmanship. We provide a comprehensive warranty on all our repairs to ensure your peace of mind.</p>
        <div class="two-col-grid">
            <div class="content-card">
                <h3>90-Day Warranty</h3>
                <p>All repaired parts and labor are guaranteed free of defects for a period of 90 days from the date of return shipment.</p>
            </div>
            <div class="content-card">
                <h3>7-Day Satisfaction</h3>
                <p>If you are not entirely satisfied with the repair within the first 7 days, we will re-evaluate and correct the issue at no additional cost.</p>
            </div>
        </div>
        <h3>Warranty Exclusions</h3>
        <ul>
            <li>Damage resulting from improper handling, dropping, or misuse.</li>
            <li>Damage caused by improper reprocessing, cleaning, or sterilization techniques.</li>
            <li>Damage resulting from unauthorized repair attempts after our service.</li>
            <li>Normal wear and tear from standard clinical use.</li>
        </ul>
        <div class="info-box">
            <p>If you experience any issues with a repaired scope, please <a href="contact.html" style="color:var(--clr-primary);font-weight:600;">contact us immediately</a> so we can arrange an evaluation.</p>
        </div>
"@
    }
)

foreach ($page in $pages) {
    # Generate page title and correctly format it for HTML
    $fullHtml = $header -replace '<title>.*?</title>', "<title>$($page.title) | Endoscope Services</title>"
    
    # Add specific meta description
    $fullHtml = $fullHtml -replace '<meta name="description" content=".*?">', "<meta name=`"description`" content=`"$($page.desc)`">"
    
    # Update Open Graph tags
    $fullHtml = $fullHtml -replace '<meta property="og:title" content=".*?">', "<meta property=`"og:title`" content=`"$($page.title) | Endoscope Services`">"
    $fullHtml = $fullHtml -replace '<meta property="og:description" content=".*?">', "<meta property=`"og:description`" content=`"$($page.desc)`">"
    $fullHtml = $fullHtml -replace '<meta property="og:url" content=".*?">', "<meta property=`"og:url`" content=`"https://endoscopeservices.com.au/$($page.fileName)`">"

    # Set active class appropriately
    $fullHtml = $fullHtml -replace 'class="nav-link active"', 'class="nav-link"'
    
    if ($page.fileName -eq 'services.html' -or $page.fileName -match '-repair\.html' -or $page.fileName -eq 'surgical-power-tools.html') {
        $fullHtml = $fullHtml -replace 'href="services.html" class="nav-link"', 'href="services.html" class="nav-link active"'
    }
    elseif ($page.fileName -eq 'sell-equipment.html') {
        $fullHtml = $fullHtml -replace 'href="sell-equipment.html" class="nav-link"', 'href="sell-equipment.html" class="nav-link active"'
    }
    elseif ($page.fileName -eq 'handling-procedures.html') {
        $fullHtml = $fullHtml -replace 'href="handling-procedures.html" class="nav-link"', 'href="handling-procedures.html" class="nav-link active"'
    }
    elseif ($page.fileName -eq 'contact.html' -or $page.fileName -match 'loaner-tc\.html' -or $page.fileName -match 'warranty\.html' -or $page.fileName -match 'loan-endoscopes\.html') {
        $fullHtml = $fullHtml -replace 'href="contact.html" class="nav-link"', 'href="contact.html" class="nav-link active"'
    }

    $heroSection = @"
    <!-- PAGE HERO -->
    <section class="page-hero">
        <div class="container">
            <h1>$($page.title)</h1>
            <p>$($page.desc)</p>
        </div>
    </section>
"@

    $content = $page.content
    $contentSection = @"
    <!-- PAGE CONTENT -->
    <section class="page-content">
        <div class="container">
$content
        </div>
    </section>
"@

    $fullHtml = $fullHtml + "`r`n" + $heroSection + "`r`n" + $contentSection + "`r`n" + $footer
    
    # Write file using UTF8
    $outPath = Join-Path $baseDir $page.fileName
    [IO.File]::WriteAllText($outPath, $fullHtml, $utf8)
}

# Generate Sitemap.xml
$baseUrl = "https://endoscopeservices.com.au"
$sitemap = @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>$baseUrl/index.html</loc>
    <priority>1.00</priority>
  </url>
"@

foreach ($page in $pages) {
    if ($page.fileName -ne "index.html") {
        $sitemap += @"
  <url>
    <loc>$baseUrl/$($page.fileName)</loc>
    <priority>0.80</priority>
  </url>
"@
    }
}

$sitemap += "`n</urlset>"
[IO.File]::WriteAllText((Join-Path $baseDir "sitemap.xml"), $sitemap, $utf8)

Write-Output "Pages and Sitemap generated successfully with correct UTF8 encoding!"
