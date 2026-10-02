Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7282344D88
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945469; cv=none; b=kqIUJNjQhi//urA6NXxF1WRziv+zsuTzlmgn9T+gWV0Gxd+zTAiVPJGCIlU/8+2vQGAfjPg3jfT1crSsLa3A6KnDXNDBzuEVN1OnR6gzS2OIY3/64JO/u3nF/itB2IShvGVfWf4dpWjTlFo6+CfiVATv3zbtVDUtrkDjHJO/8iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945469; c=relaxed/simple;
	bh=OmxZCWplAWwOsu5V/M1uyWdSkiEaQLSRhrieiV1vD1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=goL61w/XVxTejVm0p+jkO09EjrVxIBhqXKoMFemuTAd41nJITPQI0wYR0OW1aqQRAbcuLpIMyyQUO1mDQNgYmLZxFz/oYdmarYH9l+HqvzWFLCuc2JhlGE0/7nUswOYDdmtiqyf9O9kQxzETC4GshcbpoL3sleMg+cgILwkqDi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZX0scccJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZX0scccJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uT1TzvdktEC1eT/y91LI9yVzdqB1qQfdlDD+ACCdd3I=;
	b=ZX0scccJur1gV/u5UE0q7itplxvXUV5hywtspnfNK2ePrv54Vd7DykAJOcuNF8qw2sMv8n
	tqEimcvhKDnEe9Y7aLbLyP2Kgymr4I2prKcNJKTIzVZiWOlNWyNLYk6wNpM5qovEQ1tTzW
	s/Mh/2GtbzB4+GJj2EYLXxwepYRwazc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-nNU78wR5OGm14vTA-Sy4WQ-1; Fri, 02 Oct 2026 08:51:03 -0400
X-MC-Unique: nNU78wR5OGm14vTA-Sy4WQ-1
X-Mimecast-MFC-AGG-ID: nNU78wR5OGm14vTA-Sy4WQ_1790945462
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a024bce773so20486875e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 05:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945462; x=1791550262;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uT1TzvdktEC1eT/y91LI9yVzdqB1qQfdlDD+ACCdd3I=;
        b=FibkNyjE3rIMNqLxcatj+n6EqIbWmm6XOV0AcNFI6blUZLvann8BPncmANwTYT0xTj
         93XK/cN8P5TfLRUlF5V1IvG7NaynJDmd+c8cZ+QVIkS4WlUzh/+TAAcBNysGIfhsLEYQ
         Mk8uKwhA59IiYdk4xpr0KMR7sR4oJuiBkd87B3Ci6Rr2JWVotvxvgzoZbMTeooPh7DzC
         mhTQkGwPCCD+1rdailBamHTZVd9w+RcZMRgEoZGn4mCwhhMOrIz5uMoJlGKjxtzs4MGu
         zIwBBRA6pPyx5TNZoAyym83hQXbrUHYFagFpZFGuan2kiotdpa5Z0da1cvVPUZyG2nOy
         DiZQ==
X-Forwarded-Encrypted: i=1; AKwUvByT76JSLlgcmDIi4pjQqjumJktxis0eeBf0IwCsNvkLCKUR4mCMdZ85YPBxeeOopLVgF3pyY6cLspWuYWaoiSw=@lists.linux.dev
X-Gm-Message-State: AFuF++mg+uohBy7p5aEyzRnXdEwjwFEl93yyOvrkyVrGCy7MDhUQJoGl
	gfifT+oUT9PvA7tf0mIUphBl8VUHdsGVJTabi13MhSc+nzV42MSJQiiJ0DNjWwrSU4PZp4Z7a0+
	mhSg8OPd/kThu0wNCq1jA3cV5wc7B3xv7e50IJUvjcF+BZ0FOinfjMcyWf5P7tTwk6UFltw==
X-Gm-Gg: AYBFou1cO8We6QPP+mRe5bOj4JeQ3XEozWHVVY3XZgf965lRGFi8ZZXqFW1v8fJOTln
	9o0AoOPybebnZNrN7JmaJYiyl3BDDVQlCtn1RN60kOlfSeoCWY6stt3goATQQA44gnbVpUtgOzG
	syg/4UhBz8Yk9A0MF0qe0UuH+wSrGy2qWPFQZKkgZZU8GdBQsyJQtRppzA7u268VbtduZackrDB
	cxS9GU2qTiFYGRFu/VwM3eeTBt1kxZ99Gl1Hind10y7U2yImw/gJmO8AkZAUxqC7HeXU7+B3Hfx
	ZIq9omsqd/D5aY5//jPf0DfmzXI0oO06nTW4XHWPV/5xMbblaaw1jqV8QxnyuTocUPf1U9eGikR
	6ZijFh8+w3whl9D9G74jXIskNJJKTwMw8evRwAR0kE9oiCffKT0eK1DIcqnwpnSghrA==
X-Received: by 2002:a05:600c:5306:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a0275863cemr44975805e9.30.1790945462114;
        Fri, 02 Oct 2026 05:51:02 -0700 (PDT)
X-Received: by 2002:a05:600c:5306:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a0275863cemr44975435e9.30.1790945461642;
        Fri, 02 Oct 2026 05:51:01 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm82137655e9.8.2026.10.02.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/7] drm/bridge: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-4-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-4-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:00 +0200
Message-ID: <xlv1h5j46zbf.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9TOvxTdcvOi39B1Fqqxgd2R6H9bdLkP-RK1GJfW_4mc_1790945462
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The bridge code does not require anything from the simple-kms
> header. Do not include it.
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

