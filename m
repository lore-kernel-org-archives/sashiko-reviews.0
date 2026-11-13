Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794543153;
	b=N4UUYfqJp/XZkfJ512MkN3AoQy1HM9rncgT/+InzTGwunTYYRBqWemGPTaO6Dm0qwR0D
	 OLHe4H537MXYtYWzixGMBWbGTgO7Cksc0Z1Pj0x5KYVC7BudIp5vJ538aQB9tj/d09hGW
	 e34BVHGcqaNCzhnyXf0Kh7cxWjBxGN6KVk+WSQ0GWlsx8rc1tgyVlO3t+adYqLy2r6laK
	 WzjyiOc3l7SKZZLUIYIXg4UfoRpvpIon2EdcQRgOEvIWanNi1mP8FUdXE9CYt4sgZUZ0X
	 OBa51OAgpovgga9oj498AcBNakWsqc/fFRzTtMaJP6cN0/3vcW3CCbp2ir0d/doeUyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=nCgmRaYxEgo+SI8l55N+Zi055vVLjhQIc00v9kfFU80=;
	b=mMRDmAMUbprkCV/NgUJ7Jr8EJtqQ897R4GUwgr9q3IZKqFc44qQJEjcnm+NXOCk5V/jQ
	 NZ+LGHJrpBxapSqQLOgX7Qj0mT91lBGKpjWJru6d1SDONDBS9aD90jniBgCFoMDOCAsjA
	 PSD17pquqFUMByOC5I0K7iuT4xO9CTt34rcTm7O2ziaTMfVSd6IXZ2DZ6SrOazPG6oFD1
	 ezw0NRZ/OQf6+N00/H5QOztFqbTF1Oj2rNUzosI+NXZNYCYh39tdSvGskTfmqJ+MKq5lI
	 1Uztbj+KV6z/M6RuAIOeFhAGBAoJsF44LRqAx384DVLGqroz3NCwfeyNQ9QQ6Xz0tzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0Ub5POW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68B2606A327
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 04:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C68B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0Ub5POW
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ea138a3497so2843065ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 20:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794543152; cv=none;
        d=google.com; s=arc-20260327;
        b=bZYnJdNRXxebDlsfs5TXU1A1YFm1UDHKNUkx8NpCex3otTbpeaXtFSNI6tgvlhnPtF
         RhaEkBeB3nC3ZTIAC5LTK2LqslBRmKpVejBCmSwr007CSE8V1srWqQk4uRDhsMoQvhVQ
         ZMhO8XkPqt6pGzrCATigJEZV5YmfJ81hJWgFesemTGoZlxIq3IoaNzrajsb0fT1/XQjV
         bGOub5zNqi0uUoySPMet3wP0nzBzCKid+DYT7I5DA/qiSpIhhZjSF79yhWSCxUY6kaCh
         GOMNQarLN6lghaVC50uIfARkQE6hVKtMGaL7dk6Pj/C6Z9ugCPZJB5FEMO1q7ZOf1C0g
         O0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nCgmRaYxEgo+SI8l55N+Zi055vVLjhQIc00v9kfFU80=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=N6phFvdgOA4EXjDy5hncWeWvhW+duobekNZJvtt+EDPRhZhJFOgPFypk0p1i8RHu1J
         FthAxKBZcn6Ljq9p+7A+xThjYDdCqTVV8YEwohgSd9JlnOO84EyAGW65sIDg7EBK4Qa9
         u9khTeZSiIK/B2rPotUGlXaRtdS+H0rZNpY998mhVNqUF0jApRVjrqfPgx4uwmJGnWfn
         UIcAT1tyxbazIRdoRpDlzYuJo6/TE4pVkv9rJzc1xFXEKXO4Ynk9mMtIBOWqXprtANbz
         slaewH27M2EZnLJNtBECmEKW96vIJLwmPs3+iJJmkaRBn68VOpLkF2CmFKeddAcl1Mf9
         K5iQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794543152; x=1795147952; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCgmRaYxEgo+SI8l55N+Zi055vVLjhQIc00v9kfFU80=;
        b=C0Ub5POWi+T61aik8UdhueTgcOcCFQfFYBgQlZqFjWTeVAT8C5sZKGLHOEX/N8grXh
         3pHLfvwMW0ewE7STgiP1+k48nw+OtbvmkWftaGEhc4b0KnvOvucDEMprt6HoLtGlwafS
         am5IJge6zH7pY+bG5RWSOad/1EBXsflOMT5DH6cgUVMtWDeU1wq1ATXFnakeP8V7DuUs
         dXFVUrnEJjOYwD6MdGWqAjQc6sKsjhKvkK29XbXglI8t0R6XzJ8eIJachoEZBctHsa2b
         1xP4H9OK1r5FVMI9T7+Kod+GrwC/uCA20CGQgRGU2GXSiGC3PuTQXzQRc0aqYFWNiBXB
         27xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543152; x=1795147952;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nCgmRaYxEgo+SI8l55N+Zi055vVLjhQIc00v9kfFU80=;
        b=xlDxu3HC9GtGgkrWeFM0TVtas+UJVOk5wUF2wGyTGCAC2yIhgOv4vTg95WipBE+7i0
         L+vr745t1oq3fEUvtEiV9Gr4sdjYU5y0m8FvN2E1onY0yEdBHYAW4RgXJ4YO3t17N8hO
         Fw2YBnmCVHqN2UHoJpFA/nE1k1wNocBLze+XdX9diZ7QTAuEP1kM8Xrelo2RYeo+Ar0j
         mFDazrmDC+/NDQ6sr95BYNxy9NsVrLqWFirTN89z5SPS4xq6WJBSMj6rT/N59SfIpU1d
         9nHhiMt3dPsJ2akWs3Vsn3Jz2la1MI2GASxFfkRWccISD1b/uikTSrtbi1l25t/wto9T
         zwmQ==
X-Gm-Message-State: APuU4Z85Ie399u2bfhxUzRkUwTqXCVoCa1bCcM63Odw0DDWk43C5t4Hj
	LdqdSCCPlyrf3EVt1ELe3qU+8MhtRqjz7HHT2OyV/7MbQx2tN3XvNZIYIDarMNrJsGYYTIdTb47
	HfAHABcvvt9OXhS+yxpvbrGQBq/0B6rt53ERL
X-Gm-Gg: AYBFou1kdcUGGIu3JHeNt9CAyJkfCQjiwHyNV7rkXqH8o9tlEKjmU6HhTy82cv1lNlw
	rsjbYUrcvLrXBllHnTQyG6GxehO35XETrrHrP5OV6Ip1xvWzqfihfeinCxdCh6c+3BEDvpNE1V8
	ZpwpUp1vXEoHy/YKUIYhnwH9g8r3L1/40qizFA2cJ2ISr8Oaa0UiEFwZggOmxb5GyiKBF7E0vP4
	MDcmopYwZmECGUy9pbfO+erWIQyBCnD4eccjrMLIMsJiQIVsMqxCIYV66DXa7hZEzfRkjoEU6p1
	dFw0aNOLpFBTDh/0UA4ft3JDcKm+e+aBirkNzHEt2GdCbTms6Al9xqTpeRFn05UUBUdfSZYvAbn
	204F4pf8xBVqJMMu+eXBbdOFcQXZlst76VGLbjNqF7UXhgURFx/QROnmnE7S121ioVe2dMzwsSo
	JI4tf+ioMg25DpBltNN4sZ9YwpEQapmXx1WrZeEuJFIy7ZEIWG
X-Received: by 2002:a17:903:1c6:b0:2ed:2e3a:1faf with SMTP id
 d9443c01a7336-2ee0dc772cbmr13160465ad.47.1794543151902; Thu, 12 Nov 2026
 20:12:31 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112105116.32274-1-phucduc.bui@gmail.com> <20261112105116.32274-6-phucduc.bui@gmail.com>
 <sashiko-outbox-210986@kernel.org>
In-Reply-To: <sashiko-outbox-210986@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 11:12:20 +0700
X-Gm-Features: AclHuK-EzYz6_0u6Yz6Hrxu43cxUaT0UCJf819xej1Ox7hyEl1KMsad9G04Ad8A
Message-ID: <CAABR9nHy59D=zQwQbLP6eVT6bsZ3Db8vo2-cKHDCdqkS42TiJQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ASoC: fsl_asrc: Use devm for runtime PM cleanup
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> If CONFIG_PM is disabled and fsl_asrc_runtime_resume() fails here, does
> devres unwind end up calling fsl_asrc_runtime_suspend() while the clocks are
> still disabled?
>
> When CONFIG_PM is disabled, pm_runtime_enabled() and
> pm_runtime_status_suspended() both return false.  If
> fsl_asrc_runtime_resume() fails, it cleans up any clocks it enabled and
> returns an error, which now triggers fsl_asrc_runtime_suspend_action().
> fsl_asrc_runtime_suspend() then reads the volatile REG_ASRCFG register over
> MMIO with all ASRC clocks gated (which can cause an external abort or bus
> hang on i.MX) and calls clk_disable_unprepare() on clocks that were never
> enabled.
>
> Registering fsl_asrc_runtime_suspend_action() after the !pm_runtime_enabled()
> block (or using devm_add_action_or_reset() after devm_pm_runtime_enable()
> with the !pm_runtime_enabled() resume handled first) would avoid suspending
> an unresumed device.
>

Good catch, thanks. With CONFIG_PM disabled, a failed
fsl_asrc_runtime_resume() would indeed run the action on a
device that is not powered.

I'd like to keep the action registered before
devm_pm_runtime_enable(), so it still runs after runtime PM is
disabled. In v2 I'll drop it with devm_remove_action() in that
error path instead.
