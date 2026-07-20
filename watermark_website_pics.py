import os
import shutil
from PIL import Image

# Configuration
logo_path = r'E:\EndoscopeServices\logo_transparent.png'
web_dir = r'E:\EndoscopeServices\Web\EndoscopeWebsite'
prod_dir = r'E:\EndoscopeServices\Web\public_html'

# Image file basenames to process
target_images = [
    'olympus-cf-hq190l-colonoscope-refurbished.png',
    'olympus-gif-hq190-gastroscope-refurbished.png',
    'olympus-gif-h190-gastroscope-refurbished.png',
    'olympus-pcf-h190dl-colonoscope-refurbished.png'
]

# Watermark parameters
logo_scale = 0.60  # Logo will be 60% of the image's width
padding_scale = 0.03  # 3% padding from the edges
webp_output_size = (480, 480)  # Standard high-DPI resolution for the website

print("--- Starting Website Image Watermarking ---")

# Verify logo exists
if not os.path.exists(logo_path):
    print(f"ERROR: Transparent logo not found at {logo_path}")
    exit(1)

# Load the transparent logo
logo = Image.open(logo_path).convert("RGBA")
print(f"Loaded logo from: {logo_path} (Size: {logo.size})")

def process_directory(base_dir, name):
    print(f"\nProcessing directory: {name} ({base_dir})")
    
    img_dir = os.path.join(base_dir, 'img')
    backup_dir = os.path.join(base_dir, 'img_backup')
    
    if not os.path.exists(img_dir):
        print(f"Skipping: img directory does not exist at {img_dir}")
        return
        
    if not os.path.exists(backup_dir):
        os.makedirs(backup_dir)
        print(f"Created backup directory at: {backup_dir}")
        
    for filename in target_images:
        src_png = os.path.join(img_dir, filename)
        backup_png = os.path.join(backup_dir, filename)
        
        # 1. Back up original PNG if it's in img/ and not yet backed up
        if os.path.exists(src_png):
            if not os.path.exists(backup_png):
                shutil.copy(src_png, backup_png)
                print(f"  Backed up original PNG to: {backup_png}")
            else:
                print(f"  Original PNG backup already exists at: {backup_png}")
        else:
            # If the PNG is missing from img/ but exists in backup, we can restore it to process
            if os.path.exists(backup_png):
                print(f"  PNG missing from img/, will regenerate from backup: {backup_png}")
            else:
                print(f"  WARNING: {filename} not found in img/ or img_backup/")
                continue
                
        # 2. Back up original WEBP if not yet backed up
        src_webp = src_png.replace('.png', '.webp')
        backup_webp = backup_png.replace('.png', '.webp')
        if os.path.exists(src_webp) and not os.path.exists(backup_webp):
            shutil.copy(src_webp, backup_webp)
            print(f"  Backed up original WEBP to: {backup_webp}")
            
        try:
            # 3. Always open the clean original PNG from backup to avoid compounding watermarks
            img = Image.open(backup_png).convert("RGBA")
            img_w, img_h = img.size
            
            # Calculate new logo size
            logo_w, logo_h = logo.size
            target_logo_w = int(img_w * logo_scale)
            target_logo_h = int(logo_h * (target_logo_w / logo_w))
            
            resized_logo = logo.resize((target_logo_w, target_logo_h), Image.Resampling.LANCZOS)
            
            # Position: bottom right
            padding = int(img_w * padding_scale)
            position = (img_w - target_logo_w - padding, img_h - target_logo_h - padding)
            
            # Paste logo onto the image
            img.paste(resized_logo, position, resized_logo)
            
            # 4. Save watermarked PNG
            img.save(src_png, "PNG")
            print(f"  Successfully watermarked PNG: {src_png} ({img.size})")
            
            # 5. Resize to high-DPI web resolution (480x480) and save as WEBP
            img_webp = img.resize(webp_output_size, Image.Resampling.LANCZOS)
            img_webp.save(src_webp, "WEBP", quality=90)
            print(f"  Successfully regenerated optimized WEBP: {src_webp} ({img_webp.size})")
            
        except Exception as e:
            print(f"  ERROR processing {filename}: {e}")

# Process both website dev and production public_html directories
process_directory(web_dir, "Website Dev")
process_directory(prod_dir, "Website Prod")

print("\n--- Website Image Watermarking Finished Successfully ---")
