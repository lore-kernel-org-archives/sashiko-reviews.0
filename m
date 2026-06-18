Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2273EDAD6
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779605; cv=none; b=Enpo94jW3Uf6PYTr4jUm128O76okszkPnzNZ1c9q6Dj45FBk80n8t414KsO6QZWOtmUA0eKxOw5/9f0Opx4LFALxAxmTlnkY9KUHRRlEktTKRmX4iIi8hznKB8WNfdk98dej4dIetydS5ytFwlHMUoV7EicBTWUja7F9FfQvE1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779605; c=relaxed/simple;
	bh=v76H2FD+cZQGbYA3goj0IQWAE2ubh/oEvvY3ydCbt5E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ERSLt6ifH2myzZRKcuU/XmYnazt92Xj+JzwXCgDTGW4+tB9kCfRweZjMHRbXQOCVnxMf1TtZvIQgNE2EfyIbWcJTLvGqWvj9F1l8lQoN3Nm+r+ERRPf2hdubJKxWSdxng5oMhmH9nusG8ltg8jva5zPgBdFaE6yHsVvWjJFZ8ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CAQ/J1hj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CAQ/J1hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781779603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JBl2ts2yYWW7grI0RMNRI+ZePWjfZxzm9ZlftbJqKkQ=;
	b=CAQ/J1hjnlJj86eiyH8DEhO4B3jb+yHsLY7spLiKFjASLLXrNx3iAL108gl9S5fb5cmq5D
	Hi/ZiNEtdhoFZSjT52cj83ItCWUiSTLBX1gqEXQ8cz2pOTwhVT/jDpAo2RE02gn4wmbbXG
	phGksWwRba4dl9w9VbmjZD4RbWjdNew=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-S0_FW72gNWOKA91-jvHRaA-1; Thu, 18 Jun 2026 06:46:41 -0400
X-MC-Unique: S0_FW72gNWOKA91-jvHRaA-1
X-Mimecast-MFC-AGG-ID: S0_FW72gNWOKA91-jvHRaA_1781779600
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-462c1cf9003so781722f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 03:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779600; x=1782384400;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBl2ts2yYWW7grI0RMNRI+ZePWjfZxzm9ZlftbJqKkQ=;
        b=MKFj9aJ8qMQKKIAMxLD/EzOH5ayZ39j/pIDRACMf8xesi3LqDOBiP7q2pJSgCP3QUU
         IoPQFlMYozzjG4tNwz7WW8CGCpWwnMutoDeARTsmCXDyzf2MKrylZepVC7/g6JmAA87f
         PnAn3H0RGvzIKTeIDjQtBOI1rbpHjgLPk8M30ati53pUhwDEn81TSjMPi/XgRe4YMflu
         zSe5I8QU7ALNlfvkY5hdcRdV+lG8p35qQ53hZeMafD750SjXsv0WQcrQ/iLdpvaFpDva
         PP1u59tm3JFuyXekXtHXpB0d6ArKqPHQBQfNZ5nIwYoy9m4sQHLhcXMe5n1gt4cAL/jk
         maVA==
X-Forwarded-Encrypted: i=1; AFNElJ9K3hSEE72NXV7Q4sGM6QehHuAS5d+Wg68RuHoCIiZICP8/9+h5/XOFN/MhnTVLfQ3kXIB1Nn6sp1l6mUFEZjs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfdto9yCBKgNMi0+Qmuln9iMxMp87JI2VgULZ6zPR0T+Wqsv6Y
	Di89ORcZ0hysIClOB1bbJhwOQb2pbHGlU72BmdMGcTRagsu8zQAlB1aFUcOFp26g8kQvunkHp+u
	XqrTVXq6PBa/ssnSQd5YeNeoB0vl2zn7+PYUu41n7oRW3h9J/MD4+9atel+BFLli+2hlE6w==
X-Gm-Gg: AfdE7cl1h49jVi/7lGz7enWYnlxPiCjcjKZqjFY9jXQ8XgEvZM/vqIyYA+RUA7wpL5P
	HAGlUoxkdk9DRU3QddPSi+Yps8QakQHA5xxWYdikmD+ymY8LWarFyAajsST0DriqP+4crUd78ng
	WSgkXS0s+gHNLNDf+7B/4F/2uQvzWGaEyJ0yDAtYcE++sU5iggz8vN9Csvq9kckFkg9VEjsVcUG
	vfyCwGOhrNqdt9gamil7aOnLE840+g29BAqvf8L0CfkPX3ydZkHmwYzWeBfM9mYEnUQ3HJ4viT8
	PwMB9cgME0dsA/AfdOEJO8JJb4nXsHhkhFo/ao4PZR58O0yhfzmUuuC2oCR8S/Ew12RmkySeTzx
	0ke4IQ5VxGghfsWFL7mpi0t9ZcJgc3E+c8eUVJ1yQqRS/EvRatwgYhiX1UXbLk+sMplqoYQ==
X-Received: by 2002:a05:6000:4602:b0:460:70d1:c75 with SMTP id ffacd0b85a97d-4623f3e0a31mr12353283f8f.13.1781779600418;
        Thu, 18 Jun 2026 03:46:40 -0700 (PDT)
X-Received: by 2002:a05:6000:4602:b0:460:70d1:c75 with SMTP id ffacd0b85a97d-4623f3e0a31mr12353226f8f.13.1781779599890;
        Thu, 18 Jun 2026 03:46:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c473bsm66965343f8f.28.2026.06.18.03.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:46:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, Sashiko <sashiko-bot@kernel.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/sysfb: Avoid truncating maximum stride
In-Reply-To: <20260618084327.46567-5-tzimmermann@suse.de>
References: <20260618084327.46567-1-tzimmermann@suse.de>
 <20260618084327.46567-5-tzimmermann@suse.de>
Date: Thu, 18 Jun 2026 12:46:37 +0200
Message-ID: <87a4ssjfci.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W65ZXLk20Z_w7OHGQl4gP95Yed9d6z3mtIKELWPxF9Y_1781779600
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Passing a maximum as 64-bit type to drm_sysfb_get_validated_int0()
> can truncate the value to 32 bits. Use drm_sysfb_get_validated_size0(),
> which uses 64-bit arithmetics. Then test the returned stride against
> the limits of int to avoid truncations in the returned value. A valid
> stride is in the range of [1, INT_MAX] inclusive.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/20260617114016.5A5991F000E9@smtp.kernel.org/
> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
> Fixes: a84eb6abe2b6 ("drm/sysfb: Add vesadrm for VESA displays")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.16+
> ---
> I've added Reported-by and Closes tags because this is a pre-existing issue.
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

