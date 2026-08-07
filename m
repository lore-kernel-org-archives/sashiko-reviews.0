Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1446B3B1B4
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 02:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786071320; cv=none; b=O0qRBzn/ucjNWmau2XV3J+Zuy088PJijM8W1U4Lazc8bEZ8gG2tyQsPINVx+qy09dXYZks3O6m9liLx2Z6WjXuLIUiC+x4rqD1A9RaJxkLMCsgIV9knFcfdjNclGT4eDsaRvM6zf47C2ojPD5/DRJK/sqBezrSZ9Zr4vsNjVeFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786071320; c=relaxed/simple;
	bh=rD0P/EwWw7jwEPK55gnVfsYkHWCAigVS0mVtp0HL//Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=XuSVqdHQv0QyGLB6r/TvMFIZlA27Nu40BzGvQjlctDMVO2R5roEQC3Ntq6cmLLoPiEh0xKNIFLDDJ9nCVl/pu4g03vMhpGAq9m3+uZ+ZPz2h8dCy8I6zj+Z98WKDsh9WQoApeSp69OchjOy7l+70z9tXTdeD22P7vucyUphu2n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edera.io; spf=pass smtp.mailfrom=edera.dev; dkim=pass (2048-bit key) header.d=edera.io header.i=@edera.io header.b=WNAqCNB6; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edera.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edera.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edera.io header.i=@edera.io header.b="WNAqCNB6"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8200ca16f26so43834947b3.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 19:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.io; s=google; t=1786071318; x=1786676118; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rD0P/EwWw7jwEPK55gnVfsYkHWCAigVS0mVtp0HL//Q=;
        b=WNAqCNB6ncYzEXb28K16WewxYX9YLkdr38PBaM78gfgpLin7q4nn/smRDmionSr5C8
         Qv82Qf/9jHE/mZINWL6WTVaVHVB1gEIQf9UoWKDrr5G6E2r3WJhWLpmlCkpdGzA42vO9
         loN/YFH0sxD5g4Pzpr+TzNol53HfmJZ3tNlTtQDhKK0rkh/HHREND0Y4liNTSDF8BY7r
         02C7CnGKqTJN6bwPGtit6Ej1iUbq9Ejqly5BrHHbx28FR0+fNmDbqT+PCPA/ej/kBatd
         CwfwMGVvbCmmXSz3GJfG0M3gguWVUdUW1BbqNaKraIbbROOMQ3z/l2GwgSGX8LFUUx+c
         ZI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786071318; x=1786676118;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rD0P/EwWw7jwEPK55gnVfsYkHWCAigVS0mVtp0HL//Q=;
        b=VFFkx1n/neD4F6QHAlN2B9irW78y+qPDMj04fzf1y8npx7YIxxL+h8xFlfDrc/aNSy
         rfH0Q1v7xIPZwBMHfvlCb0kYdM5cc0gE5B9VwQRgBt5a3DpeDTYtefdYB7Njf4cUHAyj
         meazOKU7z6JzhpIBltO/8x9iT9Cae7eCh5S++0dcRqqg7TrZ5gJHgcJnLN50hbbgqOio
         GyvM6V+eexRAsKJ7B654hVE8QF4C7Utz1GK4dD8D+lxm4yJSjQoFJIpS8jzmm2tgq3sR
         YbNFZEkuPR9VIytKJ8byttWM73zdv6sO9EDU5YoE9tWoVNXMztuURhLk7xgGdruQBDnp
         0srw==
X-Gm-Message-State: AOJu0YwBEMAlGcOmoO23kZnATT0unIu01c2O+dNpDs8Y80Tl0zEQYt2r
	89oR7YFYvdIBP8USyzXqWHDigx0LUnECilA5ocQXejwwOVKsK2YrG5C7wFXfMegfODpAFRmEua0
	tEzG2syk=
X-Gm-Gg: AR+sD12itKBIZiG5E09QuHeMiKyuBW2fYyIvfieN9YrxPBnOPhB//QlGaPWkH9tOfAM
	P0lH0mUFd1ou57XN9gVpZTAcQv01i4w4+nlg2zWUaA+XBog9X4GwneDmUbOwZymWS7Je6GwgPkl
	+KZqTiDVkn0ZEVCCNEGjmaU/oO1vcPjauloFYBALHKwCu0xqfU4/jibPoeiQWuL9b9wbyYJTSOv
	1q4swtjVl64NFigY8mufx70VUdnYdYjNzUrKRvz/cLHfDQ2N0iIDRWU8mYQOKlkK18mpKtRCYPz
	lTx+uhlYDG6b2JvlRLtV0viWMgktT0YX1rAnCBUjAZNFcvQ5Q0KXqUAZ1qBJf/SPKQuqqojfPLH
	ulOfMIIF5ViA6VAmLve+Kr0Cg1Fd0lpR9SxM7tyAupckKfrb6xw7JZUt7tSLiUvMrEVvZSde7cO
	jPA5qSgAEkNU66j42sfJ7vUAYBXbC/3lVnu8l9ByXG83ZTirYL7ZU+/OSPnsKg
X-Received: by 2002:a05:690c:6e12:b0:81e:e313:2ed1 with SMTP id 00721157ae682-8201f08fd34mr121177527b3.8.1786071317695;
        Thu, 06 Aug 2026 19:55:17 -0700 (PDT)
Received: from StolidWingnut ([174.80.170.224])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f09910b2sm2600087b3.16.2026.08.06.19.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 19:55:17 -0700 (PDT)
From: Benjamin Leggett <benjamin@edera.io>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/virtio: use the DMA API for resource backing on Xen
In-Reply-To: <20260806231002.27B4D1F000E9@smtp.kernel.org>
References: <20260806-virtgpu-xen-dma-v1-1-e499b345bbad@edera.io>
	<20260806231002.27B4D1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 32.0.50
Date: Thu, 06 Aug 2026 22:55:16 -0400
Message-ID: <875x1m8wrv.fsf@edera.io>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> [Severity: High]
> This is a pre-existing issue, but while enabling the DMA API for Xen PV
> domains, does this leave guest-bound transfers vulnerable to data corrupt=
ion
> with SWIOTLB bounce buffers?

Yep, preexisting issue, but not reachable via plain `virtio-vga`.

Only reachable, AFAICT, if `has_virgl_3d` is enabled. The missing `_for_cpu=
`` sync
is pre-existing since 8f44ca223345 and pretty orthogonal to this change.

A correct fix most likely belongs in the completion path rather than at sub=
mission,
anyway, so I=E2=80=99m not sure it makes a lot of sense to include in this =
patch.

Happy to do that in a followup/separate patch, if requested.

Ben
