Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3633909BF
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865535; cv=none; b=piJKQ8ySy7zw7OiXg0ynwxRSMrEFyjqgLhM3WWKujJvvJ582OTGIH5MYR9L2pp1Sn+Zi/EMOYLbMKto0qV0H4tocAM0Ghdnuw7p5/RkFLmU0kYm+fMZrHBP/SDwiGNnOf4iTy4zkN+rmjtfPT9cCFlDhB2cZKo0tNZMjSaFDxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865535; c=relaxed/simple;
	bh=TP4jI+wG6PBqBKAosooF+4rrhoc5hNQtPHbUvJ/nxic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DUgSMGuhyJEA4H0wlvaJj7FUFsGegN4OwGvMscpZJTGpmRD9erbCGjuL2mgf1Np44eowTDAc5d3hsF96F4YNIOWt/hsNvUcTzG+k4wsJeR8Gq547COaFS+dbpZ3TuyUzktcb/jEay9VXUmTwmL5W+s22GXA35CefSwbcfEDqv8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J5TPUfqt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5TPUfqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790865529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i4xhRQFt/bWT6UALcOITRzeSEDfb1ACELZHI8/ear74=;
	b=J5TPUfqtrtqpeS8SlQLjzv3vhrZQdFt09DaMBP94eK/YbQB2f0TRRn7Uw/OTIzX1pxI5r3
	ZLumVB0WwfmL9B+zV394FspL1wqlVAwXGDUJ75ujzTrNlSTUh3cY+APEITL89jeovZUJKY
	piixZs0h17ThkR5Mm/lqlJhsvUjvd6k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-t1bLDUQ-Nb6kRR-Vdg3Ktw-1; Thu, 01 Oct 2026 10:38:48 -0400
X-MC-Unique: t1bLDUQ-Nb6kRR-Vdg3Ktw-1
X-Mimecast-MFC-AGG-ID: t1bLDUQ-Nb6kRR-Vdg3Ktw_1790865526
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a01c621dc2so10879955e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 07:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865526; x=1791470326;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4xhRQFt/bWT6UALcOITRzeSEDfb1ACELZHI8/ear74=;
        b=Z4sIyfvn4lw5LyDLWmdDkdH9ClhlKlZLoaXo63ttfbRJAa8WXp99aV/N7dDzM0dSFx
         oV56B8HdIQ97+pRP5j1xbLuNBkrqQYjZf4kpsakGARgYhgs05YUN8qSSfDfao2of6TsU
         m5LWj6zgyjO0Jef0/2Gl3gdDdNytIR20CwfulN4jGVbMIFx1ldGt6VvPScazYZeclQDC
         m2t4o3bhfSdp7Lzk+iaOtNcZ2ToyZX5S3RBNEnCco6EcxiJHfZsU6syN5JhIKxX3kjO1
         UvwMFVG5Ed7v5A5ajJsnRMdQc9tMchl9VoIYO+EknM5B64AJ3ibzQihNU+O+uSeSKA4y
         m+AQ==
X-Forwarded-Encrypted: i=1; AKwUvByfgeKqoqgBasKZLLkqbu39ti56BbyttKS76ooyj9y0fjP0ZdsRUTaftVeXHp5ryMw6p/WJqyahkV5+PPE+1lE=@lists.linux.dev
X-Gm-Message-State: AFuF++k4Atn+/lTFJBFEu90Xg+E6IwOKlxmql8zLbl9I2fasVP5BJQw8
	9Z45p7kg9t0wJyHr8ZcmsEWP0Fv06/gM25K8emWtxqD1ar4jdkXutVa67TWxcIqtqUHHeiF7pyg
	Un+qXOvkAs0MqZiaMZ6mdrywoCqw5mccOtchyWUaKzqzWBVQY8KyKL18UtZIZH3u++gsCYQ==
X-Gm-Gg: AYBFou2UJKmaGHl4vWZTu58YRqiqSlfZON5G8545tlqROKt2ppDRpzqBjCDVYJw5V3q
	w7FaIFBqnNQssnME59O1hBd/zMFQkswKJyJqbx2riErN3OHtcSUYSykglTHmJHRa6u+WLeSFDw/
	xpkvLk3A+Ji07Fym9hkSZwv9HAk7spQMIcDnWIGsa2LJeajvqde6uk+jetEYDhN3PmFB48D4yHB
	ExhmDvviLsbLVoVsT/SWniXYznZ8S4UbXZNS51Jg1OvWLb8RCAFhFV4/TOG4/mpI6+/EWHqO0M0
	3QQOVRRDXfMRJ3g38khnbzMrfQQIGH0HDZt/rBvxIDMHjs+uIAXar9ZqMnwSMShHL3rL3vapv+z
	Rk1rPEe+4jpBIbEvle3ApsP9xUjfYEKNOIQqE6XDb26nJQBey8eYOjaEOy2zymmr59g==
X-Received: by 2002:a05:600c:1f86:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a01b135eccmr80506865e9.35.1790865526381;
        Thu, 01 Oct 2026 07:38:46 -0700 (PDT)
X-Received: by 2002:a05:600c:1f86:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a01b135eccmr80506425e9.35.1790865525833;
        Thu, 01 Oct 2026 07:38:45 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023ebe694sm51117505e9.10.2026.10.01.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:38:45 -0700 (PDT)
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
Date: Thu, 01 Oct 2026 16:38:44 +0200
Message-ID: <xlv1mrsxfpu3.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JTDRpB48gVoUbShfjwDZTuuAZUU_A3YwwHYC7n4PStM_1790865526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

