---
version: 1.0.0
name: Endoscope Services
description: A highly professional, trustworthy, and modern Australian medical equipment services brand specializing in flexible endoscope and surgical power tool repair. The design communicates safety, reliability, and precision through a clean, light-mode layout dominated by deep navy/slate ink and bright sky blue and cyan accents, with soft container elevations, blurred backdrops, and subtle float/bounce animations.

colors:
  primary: "#0284c7"           # Sky blue for key branding, active states, and highlights
  primary-dark: "#01689d"      # Darker primary for hover/active states
  accent: "#06b6d4"            # Cyan accent color, used in gradients
  dark: "#f8fafc"              # Slate-50, page & alternate section background
  dark-2: "#ffffff"            # Pure white for containers & headers
  dark-3: "#e2e8f0"            # Slate-200, borders & subtle lines
  mid: "#64748b"               # Slate-500, secondary text & labels
  light: "#f1f5f9"             # Slate-100, scrollbars and minor tracks
  ink: "#0f172a"               # Slate-900, primary text and heavy headings
  success: "#22c55e"           # Success green for guarantee indicators and tags
  
  # Gradients
  gradient-text: "linear-gradient(135deg, #0284c7, #06b6d4)" # Sky to Cyan
  gradient-hero: "linear-gradient(135deg, #f8fafc 0%, #e2e8f0 50%, #eff6ff 100%)"
  gradient-cta: "linear-gradient(135deg, #0ea5e9, #06b6d4)"

typography:
  display-lg:
    fontFamily: "'Inter', system-ui, sans-serif"
    fontSize: "clamp(1.8rem, 4vw, 2.8rem)"
    fontWeight: 800
    lineHeight: 1.2
    color: "{colors.ink}"
  display-md:
    fontFamily: "'Inter', sans-serif"
    fontSize: "clamp(1.8rem, 3.5vw, 2.6rem)"
    fontWeight: 800
    lineHeight: 1.3
    color: "{colors.ink}"
  title-lg:
    fontFamily: "'Inter', sans-serif"
    fontSize: "1.4rem"
    fontWeight: 800
    color: "{colors.ink}"
  title-md:
    fontFamily: "'Inter', sans-serif"
    fontSize: "1.2rem"
    fontWeight: 700
    color: "{colors.ink}"
  title-sm:
    fontFamily: "'Inter', sans-serif"
    fontSize: "1rem"
    fontWeight: 700
    color: "{colors.ink}"
  body-md:
    fontFamily: "'Inter', sans-serif"
    fontSize: "1.05rem"
    fontWeight: 400
    lineHeight: 1.7
    color: "#475569" # Slate-600
  body-sm:
    fontFamily: "'Inter', sans-serif"
    fontSize: "0.9rem"
    fontWeight: 400
    lineHeight: 1.7
    color: "#475569"
  caption:
    fontFamily: "'Inter', sans-serif"
    fontSize: "0.85rem"
    fontWeight: 600
    textTransform: "uppercase"
    letterSpacing: "0.05em"
    color: "{colors.primary}"

rounded:
  none: "0px"
  sm: "6px"
  md: "12px"
  lg: "20px"
  xl: "30px"

spacing:
  xxs: "4px"
  xs: "8px"
  sm: "12px"
  base: "16px"
  md: "20px"
  lg: "24px"
  xl: "32px"
  xxl: "48px"
  section: "100px"

shadows:
  sm: "0 2px 8px rgba(0,0,0,0.08)"
  md: "0 8px 30px rgba(0,0,0,0.12)"
  lg: "0 20px 60px rgba(0,0,0,0.18)"
  glow: "0 0 30px rgba(14,165,233,0.25)"

components:
  top-nav:
    backgroundColor: "rgba(255, 255, 255, 0.85)"
    backdropFilter: "blur(20px)"
    borderBottom: "1px solid rgba(15,23,42,0.06)"
    height: "74px"
    textColor: "#475569"
    textColorActive: "{colors.ink}"
    backgroundColorActive: "rgba(15,23,42,0.06)"
    
  dropdown-menu:
    backgroundColor: "rgba(255, 255, 255, 0.95)"
    backdropFilter: "blur(16px)"
    border: "1px solid rgba(15,23,42,0.08)"
    rounded: "{rounded.md}"
    shadow: "{shadows.lg}"
    padding: "8px"
    linkHoverBackground: "rgba(14,165,233,0.1)"
    linkHoverColor: "{colors.primary}"

  button-primary:
    background: "{colors.gradient-cta}"
    textColor: "#ffffff"
    rounded: "{rounded.md}"
    shadow: "0 4px 20px rgba(14,165,233,0.35)"
    padding: "14px 32px"
    fontSize: "1rem"
    fontWeight: 600
    hover:
      transform: "translateY(-2px)"
      shadow: "0 8px 30px rgba(14,165,233,0.5)"

  button-outline:
    backgroundColor: "transparent"
    textColor: "{colors.primary}"
    borderColor: "{colors.primary}"
    rounded: "{rounded.md}"
    padding: "14px 32px"
    hover:
      backgroundColor: "rgba(14,165,233,0.1)"
      transform: "translateY(-2px)"

  button-outline-white:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    borderColor: "rgba(15,23,42,0.5)"
    rounded: "{rounded.md}"
    padding: "14px 32px"
    hover:
      backgroundColor: "rgba(15,23,42,0.1)"
      borderColor: "{colors.ink}"

  section-label:
    backgroundColor: "rgba(14,165,233,0.12)"
    borderColor: "rgba(14,165,233,0.3)"
    textColor: "{colors.primary}"
    rounded: "{rounded.xl}"
    padding: "6px 16px"
    fontSize: "0.85rem"
    fontWeight: 600
    textTransform: "uppercase"
    letterSpacing: "0.05em"

  service-card:
    backgroundColor: "rgba(255, 255, 255, 0.8)"
    backdropFilter: "blur(12px)"
    border: "1px solid rgba(15,23,42,0.06)"
    rounded: "{rounded.lg}"
    padding: "36px 28px"
    hover:
      borderColor: "rgba(14,165,233,0.3)"
      shadow: "{shadows.glow}"
      transform: "translateY(-6px)"

  service-card-highlight:
    backgroundColor: "linear-gradient(135deg, rgba(14,165,233,0.15), rgba(6,182,212,0.08))"
    borderColor: "rgba(14,165,233,0.2)"

  highlight-card:
    backgroundColor: "rgba(255, 255, 255, 0.6)"
    backdropFilter: "blur(12px)"
    border: "1px solid rgba(15,23,42,0.06)"
    rounded: "{rounded.md}"
    padding: "24px"
    hover:
      borderColor: "rgba(14,165,233,0.3)"
      shadow: "{shadows.glow}"
      transform: "translateY(-4px)"

  product-card:
    backgroundColor: "rgba(255, 255, 255, 0.7)"
    backdropFilter: "blur(16px)"
    border: "1px solid rgba(15,23,42,0.06)"
    rounded: "{rounded.lg}"
    padding: "28px"
    hover:
      borderColor: "rgba(14,165,233,0.3)"
      shadow: "{shadows.lg}"
      transform: "translateY(-8px)"

  brand-pill:
    backgroundColor: "{colors.dark-2}"
    border: "1px solid rgba(15,23,42,0.08)"
    rounded: "{rounded.xl}"
    padding: "12px 24px"
    textColor: "#475569"
    hover:
      borderColor: "{colors.primary}"
      textColor: "{colors.primary}"
      backgroundColor: "rgba(14,165,233,0.08)"

  process-step:
    backgroundColor: "{colors.dark}"
    border: "1px solid rgba(15,23,42,0.06)"
    rounded: "{rounded.lg}"
    padding: "32px 24px"
    hover:
      borderColor: "rgba(14,165,233,0.3)"
      transform: "translateY(-4px)"

  info-box:
    backgroundColor: "rgba(255, 255, 255, 0.6)"
    backdropFilter: "blur(12px)"
    border: "1px solid rgba(14,165,233,0.3)"
    borderLeft: "4px solid {colors.primary}"
    rounded: "{rounded.md}"
    padding: "24px 28px"

  contact-form:
    backgroundColor: "rgba(255, 255, 255, 0.6)"
    backdropFilter: "blur(12px)"
    border: "1px solid rgba(15,23,42,0.06)"
    rounded: "{rounded.lg}"
    padding: "44px"
    inputFocusBorderColor: "{colors.primary}"
    inputFocusShadow: "0 0 0 3px rgba(14,165,233,0.15)"

layout:
  max-width: "1200px"
  grid-gaps:
    services: "24px"
    about: "80px"
    features: "0px (flex layout with vertical dividers)"
    process: "20px"
    footer: "48px"
    contact: "60px"

animations:
  float:
    keyframe: "float"
    duration: "8s - 12s ease-in-out infinite"
    description: "Floating shape overlay filters for hero atmospheric backdrop"
  bounce:
    keyframe: "bounce"
    duration: "2s ease-in-out infinite"
    description: "Vertical indicator jumping movement"
  transition: "all 0.3s cubic-bezier(0.4, 0, 0.2, 1)"

do_donts:
  do:
    - "Use the standard blue-to-cyan gradient text for key section h2 headers."
    - "Maintain high backdrop blur transparency on cards to support standard radial backdrop overlays."
    - "Provide explicit :hover shadows, translations (-4px to -8px), and primary-blue borders for cards."
    - "Keep mobile layouts clean by auto-toggling dropdown menus inline on tap/hamburger click."
  dont:
    - "Do not use solid background cards in major layout structures."
    - "Do not deviate from the core blue-cyan color accent systems for primary buttons or links."
    - "Do not use sharp corners (always follow radius-sm/md/lg variables)."
    - "Do not skip scroll-triggered viewport entry transitions on component lists."
---
