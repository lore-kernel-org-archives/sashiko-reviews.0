Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DAC4B048A
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 23:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786060401; cv=none; b=ci1oThwv89da6/wjFglHFra9xDS/Ow66jEOFQ8lWJ5jgTQubA1SDP0ef1QHy8bQBBaVtE4C5M8c1hYPAVza697jBYvIUaE4ysIw4ma5z3jbZibIrj3ylO8E/w93qOEmScADX1wdMxFKCaduuLYg3n6v8lp2g1Q+p2p+FoD1+1jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786060401; c=relaxed/simple;
	bh=k3HgQkukNBNJv/hmD9hzfSotfFQHeA0758t49VFm5iU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=smUDbiREDfeoOjYtU2G20OKqTuUrH1GHE1YpwgRR5GyKUmgicYngyLzZaB7qkkD3Oe494MsMEtnrfd4cbWJa809SFve4g9/fr+pRmER+k7WaRe1whIBAUrYdzxpWxkeAGtMeiV0pmDv3dT5kwVKqWcUEB79AH9Dl56kCnT2l/i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edera.io; spf=pass smtp.mailfrom=edera.dev; dkim=pass (2048-bit key) header.d=edera.io header.i=@edera.io header.b=qKJ1HQwq; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edera.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edera.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edera.io header.i=@edera.io header.b="qKJ1HQwq"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ee6b2da98so41508957b3.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 16:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.io; s=google; t=1786060399; x=1786665199; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k3HgQkukNBNJv/hmD9hzfSotfFQHeA0758t49VFm5iU=;
        b=qKJ1HQwq1eA2OLvIRm5+5LzWd/x65YrAnTLwngzgIAymBX0PTKzA5O1QSKYyeAU650
         s8wodasLgR5js0d8Ioetd9vk0PCWno4WdHayJdsGTRhuJixEA2GECxTzUUz2ViFuYiIR
         UUGxutU6M7IGjEfUInWrtiKV+YGvTYSTdicyTPWOOMdGCwx8aEelsqocclHhmcakJ9Vk
         YyEPj+4+rsv4n5esw+m7kNt0wpnxeSJGVLkTJRsO2k6S+M+7ZuEtRDWRhE6/MqMG96jn
         FzxmavZiDt3SQf3CFdTu0ByvPf9LanXup7kzV3KR4C4mZLl6nE1hg9pts0J+BN25OPqi
         37rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060399; x=1786665199;
        h=content-disposition:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3HgQkukNBNJv/hmD9hzfSotfFQHeA0758t49VFm5iU=;
        b=aJy1pOWF7CY0VqP9aBc/OAhniBrge09Qv2jEu+kXR5HgQqW5JTXrEDsLRamICFdP2f
         R9wO/xdqmj7f9wxarE7scROLpEsO82masoAJJiyw1815b52K0ct+nP3H6CyEqnm4+lCr
         CHyrB+KD9eNgTMnROmisfGynK93BA8FnOcpW3RauZYzZNoS72lIWzfxxXgdiEqFs9d/N
         B0nC9hvm/50lKwOzkJXg6scslx2IZXoci2ApuPfAV1fdFqPHuYt9S2E5sw/xo8QUUqMT
         HFaI+OOsYI131MOy2YUs/j3qqm5EoWBtxNROmQ6VjJW1ie1l1/Aebmmu/aw/Jh3vHbX7
         cZ+A==
X-Gm-Message-State: AOJu0YxyS/dHpoXeWPuo7jGrcgd3n5IWQXUa4GGk+4cnUT+bG55tu1iH
	2hnc1PJ4Ks0xNcOzhjZMN8QY15W1scFmom0wmgnO2kupXGbpfBdnALvXTiu/sTaoPrfdiFr6kLR
	rjsqT7mk=
X-Gm-Gg: AR+sD13Y5d9EprSdzI2xdNfeTIhNDXCACluol6QLdrdLIab2A58qGBan9zoahDRwSAi
	tNJyyAh/GBEwDH93aA0sLd2ZrSIal6RTfRKoJHCUd4FD7qo6Kulo50D46bBKZ65k69KkG6eJUs+
	GpJeO6ssRbV1+Nphx5QERsyOCS7oKUSwymUCipmi14UZ3uKw1HTNBCCXItSCUARNF0nTRdVvWyA
	B484wPCKCjzacgzwbb1ukezhP0T/Upf1hjahKgEHs+CzXqSOPpz6BdRCCL+hCvVhZboGmKIARm0
	lMc6Eb/YVxFkWH+xHDe/VePRaGv5/9qBE4Rwebdha4lEDpTz8e5GfBhOzMUGTqcIqci7ffUfzOC
	Ivb7FufxKuj6HifhjiO8SGRZWkQvoP8PrGXV7vMb366hhs+rxa5aWXZsNkNzOpaULTPwjeum+n/
	qPGbkUzGmEd6ggPn9sIRPOW8nS5hlUtIIxX8eLFFxbj/sK8rGb0dJSpZCRNEma
X-Received: by 2002:a05:690c:7303:b0:81e:514b:1b98 with SMTP id 00721157ae682-8201bccf693mr116095477b3.7.1786060399007;
        Thu, 06 Aug 2026 16:53:19 -0700 (PDT)
Received: from StolidWingnut ([174.80.170.224])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f0e64324sm527997b3.19.2026.08.06.16.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 16:53:18 -0700 (PDT)
From: Benjamin Leggett <benjamin@edera.io>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/virtio: use the DMA API for resource backing on Xen
In-Reply-To: <20260806231002.27B4D1F000E9@smtp.kernel.org>
References: <20260806-virtgpu-xen-dma-v1-1-e499b345bbad@edera.io>
	<20260806231002.27B4D1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 32.0.50
Date: Thu, 06 Aug 2026 19:53:17 -0400
Message-ID: <87v79mu7pu.fsf@edera.io>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
Content-Disposition: inline

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> [Severity: High]
> This is a pre-existing issue, but while enabling the DMA API for Xen PV
> domains, does this leave guest-bound transfers vulnerable to data corruption
> with SWIOTLB bounce buffers?

Yep, preexisting issue, but not reachable via plain `virtio-vga`.

Only reachable, AFAICT, if `has_virgl_3d` is enabled. The missing `_for_cpu`` sync
is pre-existing since 8f44ca223345 and pretty orthogonal to this patch.

A correct fix belongs in the completion path rather than at submission,
anyway, so it should be its own separate patch.

Happy to do that in a followup/separate patch, if requested.
