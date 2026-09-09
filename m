Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A935328DE
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954281; cv=pass; b=dJ0Zctlt2IJbrEvANsE3tZo077Om3MThDNRk93MdXW3NIf1KWY+w/VVVGnvuvDbGzaecydY/dWvFNzsgA1QqC34EgTxhUrDnNk8iOWQmOqCZonY1vOPOPmTLDE3PM0RuDwZRUfrX7fePyfJPJgpm1L2BBcGLuFfSI6yS5QpHe+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954281; c=relaxed/simple;
	bh=TiHdvofftLkGJ1d4Tmmtmp05uTxczhnU5MgLLIauK+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzO6mFOG1kWRhOVPtnBgQBVIY2GXW79ZWbFbFCz028wh3zvry4TYWxZlB7CVDp9/2esOJ41LM7anRD+/zaNapCETSYLFoTFdPG5acMdQzgZcM5Lt7lxnC6iuX2MQRJNOpKXX4KGureWupLJrjiuACpfQxfbVMcajZS02rkOUa2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=iy3uSiwy; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="iy3uSiwy"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76798a2so7794611cf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 04:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788954278; cv=none;
        d=google.com; s=arc-20260327;
        b=iwclHFUT0k0GBsF9J2hc9QLcs6Zjg7/aFq+Ena7fmhuIIrCKe8YLaIoE1dlEnCr6fl
         jmy61uIfC2gStA/c2iBUf8/A9KABE4hUuQb05LG8HSm0q9koIpv9/Df1d69HxJ1OSAlS
         G/NBVjcnrNvtwPjdALxLTPS0Tdnhaa1VPcXfgFoBNS0Fdp6br503VPeQSFhvZuizAxNv
         Hb7jGAC17KWHawPe7vqq666R5tlsxJDzYNo/nM1+gaIAKrjXnFbBqJ5WgL4Uq9nJh5oA
         0ow7OLNi5EvFw6HmVSvIaeRJz7RxoAqpn4TYrKv+bgUfjObfsSW+IHtV2gsYVSyDgjt+
         p1wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/N+0yVy13tQgS5+ScpnESpLk/uyTrS9jGVGpFKTxRCA=;
        fh=fbGfEABCdfOo7U8Z/t1cs4VFAILXTg8mtuxKB5PNo0c=;
        b=nRpxY2HT+LSlJ538cVA5LrJOeV9eR94jF9N/4GUoJWYmChBSysBq7MK5OdpgVFwS9d
         1E5DL8csVvCYb6UEGFzhUAdCekMj/SP/Ozv1d9B+jTkONCGkmsUBN0ifK8oy5tDMECIh
         US99w08ZMVxvg9aYlqB+4y7Va2TINLEuDvV4+8n0OTAKbmz7Y7sZXxuarPQGoSsunS+a
         AW7Cwo/D/JSWPMvDT7BtDzjT4ML6e8Xwsidkn+oC8eYRlb19RO+tndo4IKI6XYUE0o4F
         bxb3TA2oul1cG0CvE22BBbWvjnc+Xglk0ncom7R7gen5qzWF08p6i/yIyNI+WHfZJZlw
         K+BQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1788954278; x=1789559078; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/N+0yVy13tQgS5+ScpnESpLk/uyTrS9jGVGpFKTxRCA=;
        b=iy3uSiwyvLhFojMCw6INF3qM4X209pqmqBINOsZqSdLJM1kWvTpx1saRweqBxkz+SS
         5oKKKJ150Y8l8uZVoNeELVnOAP/tNZWtvhLb0lrsCYwj6Fz46hbE1c5iM54QL5/78Vni
         FWcvCpuG2mzbNcH5I8hAbkQfxV49bMz4sLmMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954278; x=1789559078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/N+0yVy13tQgS5+ScpnESpLk/uyTrS9jGVGpFKTxRCA=;
        b=fSAaiSriV2H7wwoXSBSLeZKA/hOeDDTIAJmzsQCczEyYVrE9lbfoJZh2WIbBoaQZg/
         PLtyyg+U5d1izSsLbdhQOgCwyEW2Stdi9OUDP25nIe/AOtAfnT4g9yeNplS7fWIcbDeP
         8RtS2F3YJn99duh25ZwhcpeKiNnEDGsgxYsqoLwOmgSkzzRWnQ9Kv40V0BzR1jtbudu+
         ImN9Big8shUliHEAISPgMa8OzSvkW56yt+CdeAewLxpes1BpkHDr8CIpT15AIbzTY2NJ
         d6q+swNSuEJspRUAfWtVWu9gQNzMC4WzVY9GGAj/UJkWVlWnlmzdXiNBdhpj5U+zzLz4
         Jk6w==
X-Forwarded-Encrypted: i=1; AKwUvBxGMovK7Ku5kxFFULvMgP3BEMBxbXbT4SvwXzDyj/ABiRHgBB0oz4yVmaGCbKI5xeyaHeNjWofk4JfnYqAUiWI=@lists.linux.dev
X-Gm-Message-State: AFuF++mmdF1BbxGmQGC57WblhTiaAWdmn9HDWaN4L+PCVB72IZ22xaSW
	4dloEPe87dRAwXSEfEf6IqIBQ57gRBHLseN5bdQIeZ+1knsQ0Y9B53zLC0lI2NZTn7V2OhgkVh8
	Ft7Au7kel1nzVl5rk7KC3hl+6f1ZCZ6LoupfX06kPBQ==
X-Gm-Gg: AYBFou2Y8bwl8fRx/movGYTox64/IuyFyyRhnBrZnGshwAjud52hXHGEbWSfABm86aq
	AaQGlqsvv895l8o2us12Wla/tSvYmd3pJIaaBhkP0wDmemzzcV0QLumdieMBWVi8/jyKmNXoq+E
	U+hUAhxr65itAbi8f72UPczvxPVAKJc2NrD9CKkeaT6BJdC6GZsWKAnmJTABg3jn4xX3TSVJ2C5
	ULPL8Q8PTyVACulTAK3esg6jGreSI13e4FVzXMxrmiMXt3SZcoBkAh+MH8qLuipkCXqc44eV2MU
	J1HwMPA4rAp9L3l4ah0aAB85uyILm14oZYi03etznDCVMBg5inPOs2k+7nxMyKZVtc6Uf9+BhiT
	LQ01Fkylk6ae+
X-Received: by 2002:a05:622a:308:b0:530:42e5:f39d with SMTP id
 d75a77b69052e-530913734b9mr126064511cf.25.1788954278478; Wed, 09 Sep 2026
 04:44:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-5-mika.kuoppala@linux.intel.com> <20260903152224.AD48C1F00A3F@smtp.kernel.org>
 <178878748003.179185.16833574173741290547@jlahtine-mobl> <178894801687.37859.4186888279082797860@jlahtine-mobl>
 <aqEzHQMrI8p9XVcu@phenom.ffwll.local> <785085e8-c9db-4d84-ab55-3a8caf9f4a35@amd.com>
 <178895308548.62143.17472983986994555742@jlahtine-mobl>
In-Reply-To: <178895308548.62143.17472983986994555742@jlahtine-mobl>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 9 Sep 2026 13:44:26 +0200
X-Gm-Features: AcwNN1V9qQ9dKCqab0SB2yrcU61pfAYqyf8l3R94yNLcs1Mbssj6NoYvC5wSIfw
Message-ID: <CAJfpegv_qh6u+GSFuPp8-PDXLoAqVWwz+kkwXv_zsxyL1PnkPA@mail.gmail.com>
Subject: Re: FUSE deadlocks vs. copy_from_user() and locks (Was: Re: [PATCH
 v10 04/27] drm/xe/eudebug: Introduce discovery for resources)
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Bernd Schubert <bernd@bsbernd.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Amir Goldstein <amir73il@gmail.com>, 
	intel-xe@lists.freedesktop.org, fuse-devel@lists.linux.dev, 
	sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, 
	Mika Kuoppala <mika.kuoppala@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 13:24, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:

> From my position, if userspace is injected to the dependency path for
> resolving page-faults, with potentially unbounded execution times, the
> timeouts would better be asserted at the FUSE/UFFD side and then simply
> failing the operations with a bang if not met.

It's possible to set request timeouts in fuse, but it's not going to
be made universal.   There's just no good general timeout value.
Whatever you choose it's going to be too short for one case and too
long for another.

Thanks,
Miklos
