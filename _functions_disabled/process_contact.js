export async function onRequestPost(context) {
    const { request } = context;

    try {
        const formData = await request.formData();

        // 1. Check Honeypot Field
        const website = formData.get('website');
        if (website) {
            return Response.json({ success: true, message: 'Message sent successfully.' });
        }

        const name = formData.get('name');
        const facility = formData.get('facility');
        const email = formData.get('email');
        const service = formData.get('service');
        const message = formData.get('message');
        const recaptchaResponse = formData.get('recaptcha_response');

        if (!name || !email || !message) {
            return Response.json({ success: false, message: 'Please complete all required fields correctly.' });
        }

        // 2. Google reCAPTCHA v3 Verification
        const recaptchaSecret = context.env.RECAPTCHA_SECRET;
        const verifyResponse = await fetch('https://www.google.com/recaptcha/api/siteverify', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
                secret: recaptchaSecret,
                response: recaptchaResponse || ''
            })
        });
        const responseData = await verifyResponse.json();

        if (!responseData.success || responseData.score < 0.4) {
            return Response.json({ success: false, message: 'Security verification failed. Please try again.' });
        }

        // 3. Prepare Webhook Payload
        const webhookUrl = "https://workflow.ezzones.com/webhook/form-submit";
        const payload = { name, facility, email, service, message };

        // 4. Dispatch to n8n via fetch
        const webhookResponse = await fetch(webhookUrl, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload)
        });

        if (webhookResponse.ok) {
            return Response.json({ success: true, message: 'Message securely relayed to n8n workflow.' });
        } else {
            return Response.json({ success: false, message: 'Failed to relay message successfully. Verification passed but webhook unreachable.' });
        }

    } catch (error) {
        return Response.json({ success: false, message: 'Invalid request origin or server error.' });
    }
}
