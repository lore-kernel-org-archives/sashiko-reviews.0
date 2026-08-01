Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED77A3B2FC6
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 07:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569747; cv=pass; b=pa0HVuIz7BRVpZvLLE1++Z/V15TjIRzvC8dWy37AL/p+zhSN4euDDpjpbAiEOBzjKmZdiUH9z+JiI382xNNmyio3W2V721ba7C7RYxFcwQeCKPTf0pBKFiHvlqZFOYjr8wmwqHWekUTkQpFRcfeG+ce/4hu5tjOLBNQMYnNjQQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569747; c=relaxed/simple;
	bh=3c7cSJmfyPQSNSMzWThpuuHDLhNHEjOoh6KtHZSmSgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rx6xvhqhx3IkTpvg+5CRS++utN7JKCq6S4Vuy8YX+HJ4xYZPHPATEa9KLrI01xAUM9unWhEHAoLo1fcLGTWxgUQU56yp1kinbechnVQSWivMLt5yocII2gnORg8V6CtaYMUg5gfK1jcGaAm0/uiLI822Dvyfaxnrzjo7YqupEIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxr8B1uz; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxr8B1uz"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1976003b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 00:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785569741; cv=none;
        d=google.com; s=arc-20260327;
        b=IV9Bqkj53QTlxlDwWQ1k6VkqL4SyQO4ijQrXEmDPiIsLKiOysiGFlMb0O+kxf5PL64
         kSWGiqSgd6oeWsYzjVLrrGmg6YqBTtMlmrl7KDDeWss6u5biId/OReacnKqSJtKU7eXk
         CHJkfq9wS/ZRuxcF5D8aXR8/ag4MHn3ulsECoVi1Nc1FnhKnAMuw7+pkLBMJ5TXQI2xA
         TkHMzZKtJArmDcskHzsV6MhHD3XBMmrI7tP5SrSmjAW3PVZSlUO9l1omMyyVKibn69yM
         B7X0orsq1gQT6VtVbUntqpjHMoFMabDWchbjCocmgjx5jK2fqpXh7NBqe4N1jHtDcRlg
         M/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o7GC7J2+xwGFf+p5+42ZnMnP7uNQVjbmbvVlPsFUY+U=;
        fh=2xfOhBJyN5MrDXDnqEqgkqZlEOPXo6XBQo6m99gnAL4=;
        b=cQizQfB0b0cSrrUWMzQXaAiERgdJddNCWKg2dlXtM8IC1QSAyJC/r+LQKH22VCBveV
         gaf2eGdVjQm2czQdQbs85D9oX3QZtFcRI9t2s6xSWuXf+YQaOgmFuUippFPwnfQ7UTM5
         PdIkPTIjdXDTSDV/B+KOSyU+Wi/XtQYsvm1fk+of2z5C0rG1xhZL173JSE1BBaP7BMr3
         gjxJL9hSpMfyszGf/65a00Eujzq4iE9maJZmUcQ+sANapeIzotpegiJ7oYysyLy7gqbW
         VOVkZcM7MwLcgWDUuJOcberyGdO5A9LJMb2cEWcng134PE8uoHEtuCLqpEk/+LSVrj7J
         lEdg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785569741; x=1786174541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o7GC7J2+xwGFf+p5+42ZnMnP7uNQVjbmbvVlPsFUY+U=;
        b=hxr8B1uzNE6E3hzoNQ6QaCEvAzIYrpYEKBfbMU6vxB3HKGt6uDhipr4iieCLjrpi7B
         A3WoRX/rVtoZpHo/WyCsOfqm0LgmgOW7k83Zzhs52J3TGyBuorWEK+rNLG5Ag01HcIDl
         SHvknIVCy81TAA6oaWFvvsuph8zwwQw3SOFuYHW3eUntpmHDMULf/MWVBCRL6LqAfqXl
         6wayMkXzgmBvpGqVEqcF+9D96q5p9WKzTnzHO799GxQMnNUUiYT51UKYwicq0w2bPy0O
         R+mqg06QRNXHQmvS130TJCAKPVLBGexZ+nfx2NF8SblvLBXB3igiVtTvnlbuY5/czpiM
         nQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785569741; x=1786174541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7GC7J2+xwGFf+p5+42ZnMnP7uNQVjbmbvVlPsFUY+U=;
        b=h81vwzjzCVDaM4DUgdH4f9TJ1Upc2PrCTBhg/SXG0ZcCugLywZG5O3XwmkREcK5PSR
         zNAumwwDzctPXgVtHHq+YViOH7rxYqJwDRocICbAxadM+WUJlWMOG85p5RGECyLV331w
         q3lon+IBBDd6VNiATi24MWKWXnchj1S8g7XUnGuxGIiZMlm/tUGttkS6GcDBv0/mRGHk
         RWs/3wvaZGkbivxtzlfdr0qP8QGQtGn51OKmMbixZ5g+l2Fjd/NlPL6DiOBsUwCH/PAv
         h5g0o/hvN8yK/cSFtoKtxtUW5AsAxSHw+/nvOK5IoIPRtmhjpMOS98GaOFeaCkR7qStj
         ZHEw==
X-Gm-Message-State: AOJu0YxELCqmlYn+Ej5fO+gHeNlm89QJ26PeKAPPjxqLs1F29dE6fH36
	Kraq1Gs5Y/8l8ZzntfJjjP39WvajRLl5GW9DYPzLWLShiPCYYbr7+lhSfiBTfY5Ct6Ws1s21LDA
	brykkWKOObBxUHJgoKX3k02QH4iBdTyiSH619TWtzTA==
X-Gm-Gg: AR+sD10sOK0mPKOu9mrZShcDVmi/cwJhA5QCRhhsMnWcZYtH8RcCQ/e9CqYI7C3Ezb5
	A+X1Ze42GdTTgFEMZNRFTXxEuSqxyL8G9HMjQdPTShdms2ZcJie210bPVaScyVHFZrg9dklAcIW
	5GB6KdsOs0B/jrE/+J2oqBchzj7XpZ1dBs4P6UikJ9PPHQEBJRMwX68TM9JDlBdVFF7MCoxhZLJ
	UfJF8nIogkthwOR4fpJkoGAu1YHouTKnmQYgay5Rql1NtjwvP+2EyNJc5/nS1H/PFcrkZ9Kdkoq
	I3qvTj6uzGQ5R8Y+wNDwbQQI2ujABe/p+NWKqaqazBQslFh1xeDAONg=
X-Received: by 2002:a05:6a00:8007:b0:848:7f56:1e44 with SMTP id
 d2e1a72fcca58-84ee47c1e13mr2202882b3a.7.1785569740583; Sat, 01 Aug 2026
 00:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260725072813.339112-1-mapengyu@gmail.com> <20260725072813.339112-2-mapengyu@gmail.com>
 <20260725074840.615DA1F000E9@smtp.kernel.org>
In-Reply-To: <20260725074840.615DA1F000E9@smtp.kernel.org>
From: Pengyu Ma <mapengyu@gmail.com>
Date: Sat, 1 Aug 2026 15:35:28 +0800
X-Gm-Features: AUfX_mycvzhEbi1USa0PGM60Pe01VOc2MAFKX3emwizdL-PSF4E-lawyn8bpKGI
Message-ID: <CALSz7m2FcQfyR3JyrmcekT=VwbGOB8BuPOoTq4h8ycg-g9W+Vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: xpad - add wired Beitong BTP-KP20D support
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 3:48=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Probe error path after input_register_device() causes a Use-Afte=
r-Free risk because xpad driver data is unconditionally freed while the inp=
ut device is visible to userspace.
>
> Pre-existing issues:
> - [Critical] The probe error path frees the output URB (irq_out) and its =
DMA buffer without killing the active URB, causing memory corruption.
> --
>
> --- Patch [2]: [PATCH 2/2] Input: xpad - add wired Beitong BTP-KP20D supp=
ort ---
> commit ec428f1a8b8e609c623920e0839f0af31cf70bb0
> Author: Aaron Ma <mapengyu@gmail.com>
>
> Input: xpad - add wired Beitong BTP-KP20D support
>
> The wired BTP-KP20D resets itself when its interrupt-IN pipe is idle
> for a few seconds, causing periodic re-enumeration whenever no
> userspace client holds the input device open. Add a FLAG_KEEPALIVE
> quirk that keeps the input URB running from probe to disconnect,
> mirroring the XTYPE_XBOX360W URB lifecycle.
>
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpa=
d.c
> > index 1616047e65f5e..5369b880c6a08 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
>
> [ ... ]
>
> > @@ -2227,9 +2232,22 @@ static int xpad_probe(struct usb_interface *intf=
, const struct usb_device_id *id
> >               error =3D xpad_init_input(xpad);
> >               if (error)
> >                       goto err_deinit_output;
> > +
> > +             if (xpad->keepalive) {
> > +                     /*
> > +                      * The device resets itself when the interrupt-IN=
 pipe
> > +                      * is idle for a few seconds, so keep the URB run=
ning
> > +                      * from probe until disconnect.
> > +                      */
> > +                     error =3D xpad_start_input(xpad);
> > +                     if (error)
> > +                             goto err_deinit_input;
>
> [Severity: High]
> If xpad_start_input() fails here, we jump to err_deinit_input which
> unregisters the input device, and eventually falls through to kfree(xpad)
> in xpad_probe().
>
> Because xpad_init_input() has already successfully called
> input_register_device(), the device is visible to userspace.
>
> Could a local user open the evdev node immediately after registration and
> issue an EVIOCSFF ioctl concurrently? If so, input_ff_upload() would call
> xpad_play_effect(), which might dereference xpad after it has been freed
> since input_unregister_device() does not block concurrent ioctls that
> have already passed the evdev->exist check.
>

The EVIOCSFF UAF is not reachable. EVIOCSFF calls input_ff_upload(),
whose memless upload callback is ml_ff_upload(), not xpad_play_effect().
xpad_play_effect() is called later from the memless FF timer. During
unregistration, ml_ff_stop() calls timer_shutdown_sync() before xpad is
freed, so that callback cannot outlive xpad.



> > +             }
> >       }
> >       return 0;
> >
> > +err_deinit_input:
> > +     xpad_deinit_input(xpad);
> >  err_deinit_output:
> >       xpad_deinit_output(xpad);
>
> [Severity: Critical]
> This is a pre-existing issue, but this new fallible xpad_start_input()
> call creates a new way to trigger it.
>
> If we take the error path to err_deinit_output after xpad_init_input()
> succeeds (which calls xpad_led_probe() and submits the irq_out URB for
> Xbox 360 controllers), xpad_deinit_output() will free the irq_out URB
> and its odata DMA buffer.
>
> However, it does not appear to call xpad_stop_output() or usb_kill_urb().
> Can this lead to memory corruption if the USB host controller continues
> writing to the freed odata DMA buffer, and the URB completion handler
> xpad_irq_out() executes and dereferences the freed xpad structure?
>

The output URB issue is valid. I added xpad_stop_output() before
xpad_deinit_output() in the probe error path, matching xpad_disconnect().

Thanks,
Aaron

> >  err_free_in_urb:
> >       usb_free_urb(xpad->irq_in);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725072813.33=
9112-1-mapengyu@gmail.com?part=3D2
