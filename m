Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71D3A1681
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910754; cv=none; b=MFaYmKaHW7I+uM2s3UiDSFoJPxrkQEno4mhlvM5F86b1VP/o+9A0/ljCuqSWb0eqgm+OGPU6U0iznOTtZQnTEZh199Jxxv1IL2KMUxW4B22M07UIV07+ZIYpQv+URF82XleavOhJDiJNguP6tqP8PlbCVaXp89eR/6OsTkcA0L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910754; c=relaxed/simple;
	bh=HhFYgwfn9YoJCL6/aKNCuWD6pVyw/IJsAnQESrIwRnw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rNC84W+gjRVjkOfiZ3leS4l5/n0yPPbKeOsf0OQloM7TELpW0Z55x4an3yjt6odvSCdUaGtVGnVr+kMpPdneeIkCEyQ1l9TtoZm0mYO+pG85wqKIfM9r9Vl+sq5cTbP9sVLGTJMYRWgdksELQmDvZ8cEP2slGJdZkPgaW4jjX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZQ3/grps; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZQ3/grps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782910751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ur8MN4EUxYcSiX5fbETtL9qCHrgMOm/kmA+W0CQuFpI=;
	b=ZQ3/grpsECYQexc3hXQcNoJAlD2FBoMa53j96SY8oSGTASYj4KntK9ulTEGe1crR8yBpa0
	3xgua7hg60XAICths+pVsGcyOZTNs8dMB3WA3qjBjVe9xpXizbR1i2bYfvNZzXMya296pQ
	l28xSxO/3nSxom+RViF4J0S9hyG1f0Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-4CXPZNprObKBROYeLZ_P_g-1; Wed, 01 Jul 2026 08:59:10 -0400
X-MC-Unique: 4CXPZNprObKBROYeLZ_P_g-1
X-Mimecast-MFC-AGG-ID: 4CXPZNprObKBROYeLZ_P_g_1782910749
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-470cb859d96so429747f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 05:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910749; x=1783515549;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur8MN4EUxYcSiX5fbETtL9qCHrgMOm/kmA+W0CQuFpI=;
        b=Lt0XzpuJwZ+JIFWau6z8L0MuLkhpRffk3hYMFkngABmd0lh0Axrrn4bq05hxoKwZRA
         ZK6vwXHG/v3Uau1moyuM6IkcULOY14wP/KOyfDDNXm+J89Q208oK829dZDYd1w7fy9JK
         B6Zj9xYNRvFHU03lreVjzAYsZdAByk93q4fZCnjzZgbsrBwqW9Rcr1M8JPL2KXrDL+AB
         NRUJBWJX9CbgH7CW+nMJIaz9Ba1KLgQCOC6+kgokSLTjXIDD16l57VeoAj7prbM6zwY4
         YYQk8xtyS7s0NHRdc9kt4mXalkIwQ5ftiocp43zJb9C7O0yZT/V1s9iHsXJQi/rfQVvL
         RV6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpkZsmf5b3B6QXpbHzqhEbaZxtv0l2IkEQqbbGEgmgNicFU/1X+Zu/QRQbSYRvRxvvOtgSGGYuWsiRf0eOBxDw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxU4+s5tEa40PXzMwUFjv/EwfO65qxK35m1qMNXk/ZZVdpORNvL
	VggQCb7neJW+EY6xaJRaoqWdKtd4IvIwrU4uwIY23RhaHchdQ1exv0xyladzBm/xtxh42Fc0OQD
	w0B7wrPKcA32cCdU5YMdCjtxyHJQ7LnuFVl3OYagv+0DKGdlJ0ZTCYB2OEJR2NXPzvbxrRg==
X-Gm-Gg: AfdE7ckHu1huxzZqI3s+rmaji8OcWO1CrrPTKtiD7yqLvVkgQ1HbKHviKbN5KlpTCRR
	UzkxY3l3gA+CaVKYyVwxHXLElanl7KQXU+lYh5Q4P01MdrNGihetHNe43WFxK0wD1l65n0XQz4g
	EUFJF2W3h0Y87B8wec72vYhlr+HsZpyJHEEDuS2As70hSJyqttMCUPKBJa3Aa9sHgdVe6bQ6AVh
	N6LuVvQj9HkpeYvqHC8vJpol82kFLv1aTg5dtzKo8/lq4QHbBJyqaO83DHPIN0cyjE9NmNXGJB3
	VOCVyKpX5pdKNrw+1bL96teG/1C5hcbo+0/++VitQ0xXbQd8zETKuid5dMDZlkliEUTLG5rgos7
	Q74bxBLeaBkPVrswXWwd6u/guMyJ2sSC+8d54RuY1y8kJWCtc9L14/qnnd0ht2riwzj/yYw==
X-Received: by 2002:a05:6000:460e:b0:45e:eaed:afd2 with SMTP id ffacd0b85a97d-477b075db6fmr722962f8f.0.1782910748713;
        Wed, 01 Jul 2026 05:59:08 -0700 (PDT)
X-Received: by 2002:a05:6000:460e:b0:45e:eaed:afd2 with SMTP id ffacd0b85a97d-477b075db6fmr722908f8f.0.1782910748219;
        Wed, 01 Jul 2026 05:59:08 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cde2sm17027364f8f.20.2026.07.01.05.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:59:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, treding@nvidia.com,
 neil.armstrong@linaro.org, jesszhan0024@gmail.com, dianders@chromium.org,
 megi@xff.cz, igor@reznichenko.net, mwalle@kernel.org,
 dario.binacchi@amarulasolutions.com, jagan@edgeble.ai,
 laurent.pinchart@ideasonboard.com, lujianhua000@gmail.com,
 agx@sigxcpu.org, kernel@puri.sm, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v4 3/3] drm/panel: Use drm_of_get_panel_orientation()
In-Reply-To: <20260701121055.192475-4-tzimmermann@suse.de>
References: <20260701121055.192475-1-tzimmermann@suse.de>
 <20260701121055.192475-4-tzimmermann@suse.de>
Date: Wed, 01 Jul 2026 14:59:06 +0200
Message-ID: <878q7udfxh.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rwkDvl3BwYNPN-y9CcUjuoJ68PIPOKKAgdl4fLYJweA_1782910749
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> From: Thierry Reding <treding@nvidia.com>
>
> The old of_drm_get_panel_orientation() function was replaced by the
> drm_of_get_panel_orientation() in the core DRM OF helpers. Replace all
> uses of the old helper and remove it.
>
> Changes in v4:
> - also convert anbernic, chipone and ili9488 panels
> Changes in v2:
> - include drm_of.h in all drivers to make sure the new symbol is defined
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

