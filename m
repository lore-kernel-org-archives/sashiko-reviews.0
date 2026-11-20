Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157493;
	b=cSmz7JibEAab47bMF2IGrFHrdpk1gvW/olLcT+ouYqOJ0Ok0yhh/1jC8W9NF59kRhYAW
	 XmYaAwfZfJT6Dh+ctkdHDdXc8aAyP3/rrf4uVEH2ukeNf8A7nnbQMAIsrpTV59rxsQe6A
	 /9gPpjnXMCfIJI04u+ZOwSN7G2u1HWFcQ6ZjfeqKgP47ryTH04Pa3/Rq94Mqp5pllSnf6
	 TQ9jM7AVflx/8SIMhcYr8GVuzE/UGCwKzzj6lt1sbpxlLzgGTZyzkrlVMGmEebSepJpi4
	 aaR0yg16P+jkYe6/ujM1s1YaOrapIF2Ro2n54ndGWUl9D2z9C1FUrW/tG9IlsXejT4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PtA8qFFBXG6iEUpmFm1DFbbkNSGlt5cA5Pbfh67zRN0=;
	b=d9Kp7iYOCXcvnwKfR60qFx6ZY4ymvo8AO8iM4ulkVk2XK9ZJS9XWVNGtiWRjA0N8QXem
	 AUdroqOyy9raUmYIl9zyEaiLjgRvHBO0CuvCwAUrkAtAWknrzW5Lk/oB7ijDaqVAYlFqm
	 co9CWHLst6O6kmfVKfjaEUYa4ybIb7cERaMUx/BCtlfAWYxyTofHYkuX4XGGfKdc4GLkY
	 nNpIQTubDeZmFJ9gRjlmmyRHpkdGs5S3sk85xXQ5RdOX9wbjPnzu/mM630yp7I5yc0qGg
	 Bnkd6gt7jHZ68vd37Av++ZKkDRSImDFkoyeDb2Kk6DaLmMwRY8A7uQDb1fwaeO3ue5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbbVxorA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7EA606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 06:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC7EA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbbVxorA
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6df5e315bd1so545846eaf.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 22:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795157492; cv=none;
        d=google.com; s=arc-20260327;
        b=Rs/g0bCeE6GoX9kiBYBsrUx99/k9Ng8Xs/DPers/nj1foqlUU3b2JiVgum2tNLwYsM
         f9b3BWiHuNJ9acvB5EIIBRet/n1rZpgbNjPJKEX0Lh8a27++8he9+89488vGMa041PpC
         clL9s30izNwFj38kkCFatsvTwQYfeY6LR14N5RldrJKJGnG4rvW6toB1OXX8A3NbqHpX
         kx/zfTmhHKVk5OduSMraIUXAj4FjBMOOH572HZ6JmUcTONb4+Rc//CugrXfxFGdv2lZI
         DzBRnjRwPPzsQmsQehxtY3EpZDrWEJDDkzmaS6cMr7HmZTGiat4l/tkg+C8EfLU70tmJ
         uNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PtA8qFFBXG6iEUpmFm1DFbbkNSGlt5cA5Pbfh67zRN0=;
        fh=49eUD1FfaFecCk3B4hl9I2qWLpwAymh8Hz5yScz3fWQ=;
        b=hoiTVhfMEM4Ikr+6Mhs56J8udJqr7eU/MLi7JGfwQW6vm1ComT/N41AW7Hf2qYDycp
         vkxv9U7Br6MrGAzrGaiovZv5b5nfMofLNQZbEJVheG6wEHgcVkdJcZLmrgPDh2RryNHC
         q2nfs5rS9SIrD6FMvwjaoyY9A+GpF9T8/GG/m/ToZJaNDmrCuTuF3QxwW3Vx1fm+mCnj
         zEahugjo/rr5dd/o07hd16nYIcuLeQ05Iyx0qa3mUQE8LV6jxebc8e0yXdYxaMJFXAWB
         U2KhUwr5/bRtBj0hT/1aKyXOUawS4d08WjIxC87bwu7joAeDC2yczt2gUAKq8FR3bb2p
         3ydw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157492; x=1795762292; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtA8qFFBXG6iEUpmFm1DFbbkNSGlt5cA5Pbfh67zRN0=;
        b=XbbVxorAm1QbgMPqNLxZPJTR6Mv3Fa1JCn78SSUgsoy6+F/RFiN0rrrFmNp27kETXZ
         4BT25PlaRnszoz+kskxTizgWBV/tI76iLQFNxlY3eQIHMmZa62+AANy+iNE2wZMK5u0R
         vw1L9A7OkCgMzaEPAoaeV2UJXvV2q2u6j478ID0g08lvazDM5Ii++4qjfraI6NusNnD0
         AIz2ApRXQ99b3xCdZKT3h4etm7GdNXA/UKmqb310eAjzI/itEwbCevy9AL8CBDLDgL9C
         DChAmd3PerUfbqmInrs2O/8ErYtoiPono52OV+RQhR6XeBvjYB23ZgfvyeUHh+RoRdp7
         +v5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157492; x=1795762292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PtA8qFFBXG6iEUpmFm1DFbbkNSGlt5cA5Pbfh67zRN0=;
        b=Fc0hmus3x7P6SkiJE+WRNyCFJh23UEDsTi0F4ryGob5gY7bjJpDdcV5v/JioHelrXI
         DO3QX3AEC4et/Xwv0+SqJAlEdcNtv6SvXUC1yYl6WfwgGhtFX9xw6TfEYSkmw474zlQ3
         mfCrzlbHBVFKMS8dz1q9UpqOMJwOfe/4seLYcWPOR7oBc1DBSh1C1cGAk5ulXnpSHExC
         f+QaJTYM+yQzM7QVlorScwnByS6UtYwp9p+mQxYZV2oMq6GPQCcac8fISk4srX19Xg6O
         +i1uotnHXN6FE8B9MLu79FW/hHuNz3RU6FhQjs0iZUy+LzTOQC4kkU9P/aC9bVpMazqk
         vt6A==
X-Forwarded-Encrypted: i=1; AL+hErG/yzFYVdpLRHcsERGM9lSkZlkeE8EwqwBzNiCETr8Mb+PODk7TlQb6XoeS0RjYxzASV+SwDCOsqknsswUVgqw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9u8xXXIXuLTRs+bmGbUfjtdcOnMIBOUtMM/sJd7Hys18GIOpB+
	61pdn+rLjP5CrMK/jNnkLgoFWpk2jcV4UJSWXZSIAD6vCEax29EYcN16r3RLyKqY0DQ1hUkdP7u
	UIZj3w8heb6VEnOkSmzLO3nwTNdVLHOM=
X-Gm-Gg: AYBFou1diByJNyU+wujTLJJyg/i5iKo8WI/cglrF2TrPRLB25/+JAPHhTbO1Y85kyYA
	3NZYvwbWZJCSDmCMNHrIEvxLDfO8A2Pff/SjYWfiEPnP2F+B/2plDPW4V35Ml6qyCxYvChkHhK0
	913hBa2uXcqCG2OR7kSL0cbp+VoAzRxwDYMMdItyx9DvovgKzkdlpRZbz0E3BSziVevabjX9LoE
	wINJmMTLYrwV8oo0VNqmYg+Z9pa0FqO5fmhmEUoVIZVyIZMkbPfMk5gcPPk79eVGUGokcyRjK+e
	ftvmdEPg2efG8YPMRpDMZ0R+UegNe1sXhyv03I1kdWLVPznPJmzXQh8+Cnx3gIkUWM0rE5ggQe/
	gs6dbebdMNAxplYmJqVBBfuTj10DxP5jEnhqkYaxdwz9BGevQr5t7X/5818TceiXPf+CcrsIBGg
	d+VqET34fb1/9VdA6uGjwsPWEIMIsb67I=
X-Received: by 2002:a05:6820:61a:b0:70b:960c:53d2 with SMTP id
 006d021491bc7-71b39293479mr2191361eaf.1.1795157491577; Thu, 19 Nov 2026
 22:51:31 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119142114.152052-1-tzimmermann@suse.de> <20261119142114.152052-10-tzimmermann@suse.de>
In-Reply-To: <20261119142114.152052-10-tzimmermann@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 20 Nov 2026 14:50:55 +0800
X-Gm-Features: Aa3M54oSQae2g29PSYOCxYYXAOYr41DBB5dj51KvljQ-LoxuIq1mgzPJn0qEf_8
Message-ID: <CABOQOSWQtK8mxAR0c9HDSc0=j_hzPz1hYHDk-XF5ERcfdgq0Ew@mail.gmail.com>
Subject: Re: [PATCH 09/11] drm/udl: Synchronize pending URBs on each frame
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, sean@poorly.run, tiwai@suse.com, 
	patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 14:48, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Wait for in-flight URBs from the previous frame before sending out
> the current frame. Throttles frame rate to USB limits.
>
> PC display usually runs with a refresh rate of 60 Hz or more. Sending
> out URBs for each frame at this rate easily overloads the USB. This
> results in display lag up to several seconds. Udl currently avoids
> this by limiting the number of URBs to 20 at a time. This prevents
> overloading the USB, but also prevents udl from using all the
> bandwidth available.
>
> Solving this requires more flexibility in the number of in-flight
> URBs. The exact value depends on the framebuffer configuration and
> the available bandwidth on the USB.
>
> Before removing the limit on the URB count, add another means of
> synchronizing the frame rate to the USB. Do this in atomic_begin, so
> that the USB has the maximum time between sending two frames.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_modeset.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index bbba1dee8e4f..caa0a117e3c2 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -329,6 +329,23 @@ static const struct drm_plane_funcs udl_primary_plane_funcs = {
>   * CRTC
>   */
>
> +static void udl_crtc_helper_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_commit *state)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       struct udl_device *udl = to_udl(dev);
> +       int idx;
> +
> +       if (!drm_dev_enter(dev, &idx))
> +               return;
> +
> +       /*
> +        * It is acceptable to briefly block in this call, but
> +        * having it timeout frequently indicates a problem.
> +        */
> +       udl_sync_pending_urbs(udl);
Using usb anchors might work better instead of the completion I suggested
in the other message. usb_wait_anchor_empty_timeout() could be used.

> +       drm_dev_exit(idx);
> +}
> +
>  static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_commit *state)
>  {
>         struct drm_device *dev = crtc->dev;
> @@ -395,6 +412,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
>
>  static const struct drm_crtc_helper_funcs udl_crtc_helper_funcs = {
>         .atomic_check = drm_crtc_helper_atomic_check,
> +       .atomic_begin = udl_crtc_helper_atomic_begin,
>         .atomic_enable = udl_crtc_helper_atomic_enable,
>         .atomic_disable = udl_crtc_helper_atomic_disable,
>  };
> --
> 2.56.0
>
>

Best regards,
Jie Feng
