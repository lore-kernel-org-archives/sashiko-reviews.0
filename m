Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0795208A1
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865988; cv=none; b=s2a1CPGMdMxrU0sJugSil2hLhTEIm4PmtAMgWFmFRQZXnRPOK7AyL9NRJHlRtovpGExhbKK9bypzzQm9OoYYw7OCNn/aHTwzsfPpInjQSg22COs+wwvIaIyrwGDVi9ExA1S02E7KAamWYA3ynciiDcSKuXlVQq4Db0mkv1dYUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865988; c=relaxed/simple;
	bh=y592cWDD7sh9JPJn4KeHW+g6gg94dBAe9nlpopS5a+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rv4wxTBtpZCT4BxGM11e4mzgHb0yUguS1GVx3jKcIKS8NRgDBWeY02htai/usiJ+tLdf0NDdC1GFkM9FMzNbvXkmn/Rz0RMte0k1Geil4txBNInktH5ktznN9XWH2ULXE5PH9xSw7mnu99GVJosX5gwi379Ezk52oDHvDpjUL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bnu0cgts; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bnu0cgts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790865984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CuGmcOB5B7OU7vPcQ5Kxs9sP8F6GWHF+e8A0rz6DPVU=;
	b=bnu0cgtsDC7TTD+g9P2qdakhJ4ghf9AvIsR9zUYcPjpjlwY2dDe0IKvPlsR5FUZhmJ63hv
	DnN8QkTzQSCNKun2TwM0RzXrbKx+rwLmDAWpM61ah0Ycp5UdIHfHsRZ9UkSOsjVebobEQo
	2D+cBp6+Ec2871uYcMyi0tfZOeuzeqA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-1uvq-vu5Nze284kRhDjQAg-1; Thu, 01 Oct 2026 10:46:23 -0400
X-MC-Unique: 1uvq-vu5Nze284kRhDjQAg-1
X-Mimecast-MFC-AGG-ID: 1uvq-vu5Nze284kRhDjQAg_1790865982
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a020cf06c3so5071735e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 07:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865982; x=1791470782;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CuGmcOB5B7OU7vPcQ5Kxs9sP8F6GWHF+e8A0rz6DPVU=;
        b=jaCuNuzWApB0poW8L6pFWFM6MdmPC/oTG7J7iyvt977wTexHme8VyZcQyUvf/u9dfV
         HMwlujLPLQ/0UXPeWzpXBRi8021cnnaAyi9O0eOWbTvlQ4dir3yKv6+IiLlpGtPtp4iI
         4uktAwY2EKqvuBdt+Ap0YX1BCcYYCboHCd5lf868jBoVI31YGWOwqb0o/iv1GAVdsEhS
         sn2p1I+OvcLhWDpGnZgm0J7eFcVt9M8XSkb+FIEASKMdnBidaVy/9XJomyYdzBu3bKb/
         WOw3EKo9PcHovHxx5H/KerWXDojL9MyQbmPpTDjXgCiwkZ218d5JyUWBtJFtwmQKeARk
         tnag==
X-Forwarded-Encrypted: i=1; AKwUvBwLNraxVXpJf+LUul54FNfJ+cm36hxpUoYhAj+zE/7IB8z5GGn/v1XWx5F9PSsGmDQmltlv6fHC/AHSn77A5YA=@lists.linux.dev
X-Gm-Message-State: AFuF++ndiKDSom0XTMKfmNep+SkCYXMU/0ZByTeyvwtiXx8tzxDoPmKA
	ycbabA1MWqxJYuFXXKIR6W4nfNBbmiVsvZY1qkLkDqXan4vOOvRFrkxZI5lvVsvgIqZLvOTCBZ+
	thmAbdFviIcSzJCaWgGcKwHxSPPbneP64xicQ+ywgG0iF1dh4inzjE6IX9iIk0lRZH5+2Hg==
X-Gm-Gg: AYBFou2S4HP5dkXTSGi1LjX5sFkC0qtKQCKa/P8L80cdH6H2yTlPIiAj4WizwqCggJA
	WsHXHrjN0J7G2GcbtxYE5ziVsubcJY81Deh45HmO0F9cw0sytfwb3iv59Dfuo3Ts/ku15eZ/GhG
	MJBAM9iTxmD6eh+rj2lcTnl2r5QdqmMB36Ym6zz4yDr2+Qaaien90QuIucq3VkPH4aFz9Ov6mXr
	JbTspmpk8I79hzO2UwlLoLbL+1WUNa5Jn3VuEacaQoZC0P2AtQ5B6NVGSW9fvPjahBSqX4zl43I
	8YYzi8R8dVWUF0/3eqNWTogP+hVeh1W4wvJYCl+2X0pNxhvvwuV1uJ3NjF+ISeGxq4fVWItJNMM
	PiJwUFEnW6njQHMZEH0DCzQDEOOq6c46ZRGJ5rjStmakbe1wtFGR8kgLv8ZRlxGve1Q==
X-Received: by 2002:a05:600c:4e41:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a01ad9e5d2mr78126055e9.2.1790865981637;
        Thu, 01 Oct 2026 07:46:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4e41:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a01ad9e5d2mr78125495e9.2.1790865981098;
        Thu, 01 Oct 2026 07:46:21 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm59955425e9.6.2026.10.01.07.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:46:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, longli@microsoft.com,
 ssengar@linux.microsoft.com, andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/kms-helper: Remove struct
 drm_simple_display_pipe and helpers
In-Reply-To: <20261001133736.802604-3-tzimmermann@suse.de>
References: <20261001133736.802604-1-tzimmermann@suse.de>
 <20261001133736.802604-3-tzimmermann@suse.de>
Date: Thu, 01 Oct 2026 16:46:19 +0200
Message-ID: <xlv1jyo1fphg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RcvP7pY3jnX1FsaPi6CL6Y29VtvW7GElvJ4qVsv4qCw_1790865982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> There are no drivers using struct drm_simple_display_pipe. Remove
> the data type and all related helpers.
>
> The idea behind struct drm_simple_display_pipe was to provide an
> easier way for writing DRM drivers besides regular atomic helpers.
> It turned out to be more complicated. With all drivers being updated
> to use atomic helpers, it's time to remove simple-pipe. Also clean
> up the related TODO items.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/gpu/todo.rst              |  17 --
>  drivers/gpu/drm/drm_gem_atomic_helper.c |  92 -------
>  drivers/gpu/drm/drm_simple_kms_helper.c | 328 ------------------------
>  drivers/staging/fbtft/TODO              |   6 +-
>  include/drm/drm_gem_atomic_helper.h     |  28 --
>  include/drm/drm_simple_kms_helper.h     |  56 +---

There are no more users of struct drm_simple_display_pipe but still some
drivers include the drm_simple_kms_helper.h header. Latest drm-misc-next: 

git grep "drm_simple_kms_helper.h" -- drivers/gpu/drm/*/ | wc -l
21

So it seems you need more  preparatory patches. For this patch though:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

