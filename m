Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3278E332EAD
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730956; cv=none; b=H6zNSvXk+8sB5EtoRFap6KXHCcopX7kr1SdHtmuni4eXmt5AW+HJFCk+WBI1Jlze5gf+v9bzRi7bTaJjtWd9osC/x27IbMHByIXJ+xWsgobRchOE1XVIH2TabLJzlAAaX6NbQe6hLL9eeCWbbrqs7UOJxzpE2h2Tlufh4Fb8tsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730956; c=relaxed/simple;
	bh=zjh5mpPt/l8KeG3MwBmajn6B5tOyg8JTogBMs1zgZGA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h0dch/cQQA4bU6q5PkFmALacbjUDgslA7ywNBzwdCC6FfXGQ9ZG10se+bSkiQmAAcpn8fHByVyBOlERKJz3wJs1UxQRUsbTuA2KCauOmvYy2/CfDrup3SNapRPbh4dd/ugGCShBPKwBO7OqwkkWZOd8q1i83j2xuJeDn1B8Xrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SNrswBqn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SNrswBqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782730954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V08Udq0tZlJLOccj0MLLEN1U44SsQfheARIHuvO4nm0=;
	b=SNrswBqnEknwZk8HZJIplMUuP3dZENJZ3blltZ5F8ZoenM1psfWUTQxaJg9KahD4oLmN9z
	c8U3MeoZjaFVDk2l1URvt707eomqdWtXoP1Eos3Zs7K44WR+bQFADF+SMsoyq6DIc99MSQ
	bvWak7yfEImp2EKjRdG2ltnsIYJ4S8A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-eJujwFmYMpW4fo_fLEqhog-1; Mon, 29 Jun 2026 07:02:32 -0400
X-MC-Unique: eJujwFmYMpW4fo_fLEqhog-1
X-Mimecast-MFC-AGG-ID: eJujwFmYMpW4fo_fLEqhog_1782730952
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4932f0fdcebso20199855e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 04:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730952; x=1783335752;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V08Udq0tZlJLOccj0MLLEN1U44SsQfheARIHuvO4nm0=;
        b=JCRsFOxdxofRUycWwKdPKIHvzoaZB0fHJ39cUiQA+r0lZLIkx7cdcw/y4d+4XSX36X
         Yl8Roe9FLW/ZFB8PZaYvzNquwmroZNCTPxVJA5r7mjKJ7JBF8edOP2zlxUJcvwgGTeXB
         VWL6ym5jXAPS8/TmNtqyE7izBWXZcT03sy6U8X91JBIs7muerD2fKOnLst7iCjNg+NfX
         bmefjK1x6oOsP5s09x2NNEWkGOFHlQuYm5u93C+Pfgc/rccZ2Lc/EAp7luGsEnI6njcv
         K6vz6MWl8aAke1Er+XZD4r0+X5KZY2jfIwVOPDvqGnriR/WXFropyGXa/pa1ZKLY+Iuv
         4UZw==
X-Forwarded-Encrypted: i=1; AFNElJ/NRRQiJ3Hk/1Z1URjIe3Oe5oa4JbY1afd2CXIlBlqTVjlklKK/AgBtTmtwLb22j90/0UUF1urTZV67h39ZDCY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr0WzzhwIIctwa7fXgwMmo1EvBIVSU8Cm720Gcmn9ukRYuR3IW
	vTqv/39L+BvRuKHNShsBywUDrfSDihWI4n8H9/ASEFF7245RxejpJD9MMsCVVZLc7RXpQmS92qx
	4sofIVo4uyYQf8onKTgjKIUUKy1Auvw/ksFqiNJe9YR+xIz/z22GrdhzDN4MKTWKqYmF+dg==
X-Gm-Gg: AfdE7cnr47/TDdTYDdSVAEwdNsO2aHuGSwIyc8xmhYXbi2fAwUPMeF7zIdEMDP310iW
	lMWO3Asmwl0BOeBHmQggyBmYW+WeSancnhNyV0QTaxSbuOrhxHsBMfymYWuWDl31ea/1vL1xqm+
	Nck5Zh707yLp9Z79PB4g2X1iUmz5iclJdwkr2KQ3bVSjPz5DM/1MnKrW81qj9kl4IQK5M0h8ieI
	IchQxmsOpt6jLZpWtIEJfVFxOXU/GbN6t18NvEnhf4zZmaV7kxjmCjtS5QfTelLtaHlZhrPPE5n
	Np+Z/fnY0/8UshHU0QF/2EdGg1YAe+gZketxYCyBZ3AAI4zy1yGV6FMKc1SiGa1lADfj0K4AE0x
	xM5AgdnhJ3BjQktu+D60JOfUqEJo8G4OosXH8+0qQ4j62LqJFA4U+2ci1/+uhSEAgvmDvVg==
X-Received: by 2002:a05:600c:3b28:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-4926687e77emr234847825e9.20.1782730951693;
        Mon, 29 Jun 2026 04:02:31 -0700 (PDT)
X-Received: by 2002:a05:600c:3b28:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-4926687e77emr234847085e9.20.1782730951162;
        Mon, 29 Jun 2026 04:02:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268f7670bsm300917355e9.0.2026.06.29.04.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:02:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, treding@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 rayyan@ansari.sh
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/7] drm/sysfb: simpledrm: Various improvements
In-Reply-To: <20260625094509.157581-1-tzimmermann@suse.de>
References: <20260625094509.157581-1-tzimmermann@suse.de>
Date: Mon, 29 Jun 2026 13:02:28 +0200
Message-ID: <87h5mld2yj.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TYnFfKq3afH9KAPDQrQ48oXrS7QA8gAG8qExskGtTaY_1782730952
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Patches 1 to 5 improve validation of the values provided by the
> device firmware.
>
> Patches 6 and 7 improve support for panel orientation. There's a rotation
> property in the DT panel node. Read the value and set the connector's
> orientation property accordingly. To do so, patch 6 moves the existing
> code for parsing the rotation to drm_of.c. This makes it available to
> simpledrm without introducing a dependency on DRM_PANEL.
>
> v3:
> - use shared helper for parsing the panel orentation (Thierry)
> - fix framebuffer size checks (Sashiko)
> - minor improvements
> v2:
> - further improve input validation (Sashiko)
>

The whole series looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

