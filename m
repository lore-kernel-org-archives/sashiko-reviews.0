Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE6F2571A0
	for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 01:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791682915; cv=pass; b=GZhasMtArW18gDg5sAlxWWUQzhjWD3t0Ajusl86qgA717an5vP6bto/V75ZpnAP5vgrtagIBCDwQ14H7eCtBa2mCdg7WNxtMPKGCDyhbHuFfxgO5GliR7YEULVXyT+1KXtDsGUWBgU9zXx4s15sl0Gm+vCvfY2iorCZ3xyhE458=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791682915; c=relaxed/simple;
	bh=a+S6iXUXzShXzubhMagWvie9aXwYAtsnVpzohR+ZRkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nURWGah8iyzb7uOO+v07wdbWdXw6CYw6OcgcnZ9bNROl23/8WydNYZpPRtXwj7/NIgdLlIaU2yPISf3PjdZKVx7ImLJdcqkttDcgvK439DmGL9A9h8PGxdBWINp6oeIJrzPwq3yp6HM/jhSfOX6fUkeb9lbtoaw/J/HsZuMNpcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7NIojj7; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7NIojj7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2df8c28a0b1so3897935ad.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 18:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791682914; cv=none;
        d=google.com; s=arc-20260327;
        b=NQQRv+AHXb3JlAv6Oxp1RK6ggCi/A/h/GvRIM4Cix/QuGG75HWuB1ISZgUilgTWar7
         Zg6xq2JbwvpM2fQXXQCRtBjWXoXnMisi/EYCNb0E7BnstIb3lgWO6+D969XF0kD1V5lX
         8Yq801J0qVXErTaY4W0CGYMOfWgGcIFKgR6xuqJ6nAgC40jpQBsoMTGpFT77HeFuZmNk
         fJmBeuFdu06V3N+eFnYNDjuZl6c/W+Q0ozMsAkFbQeXwDJ7G2SrDKpaUOdAAngQ08tK5
         PYXSGxLOHvyyMmpu0C8bz2pSFBwGzQuId8+qX/8wLa5FIIWgsJMkK8TDnhkBImhutQVX
         64Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NiZf56Uim4TT6iXbRIM3U2wYf4exyklNf3pNuoRHTuI=;
        fh=lf19Im3R71RYDh7+wDBu3MNNLlURWrK7Rcoz5mJpFWk=;
        b=AcW0Rr8BCVPRV8XATZc+h3YDrkSkL6DdiAFwY9pHXChlHKTjZrkJAzeZbl9+u9wDff
         GJHIgBkd6EyG7VNx95Q7NxF+Lu2GzkZd6+o5W6rtcnTGgjp+HlKeIddWotB36OTOeDEB
         rHBp1i0E/L8aJI3XFUmufsE13TfBQT8syCha2c/aMiEy9o1Qb/4GNpBkOCfuYx+uCam9
         pqxHCbxbhLrLfi5yBl98KQet+BWlvVJZZHei6gmwKgvScqbCqb8EL0zdvvYBEYVUwpen
         2XP/yGNptlgYxuMExTMeXba4jmYPh5OXbzz2lT0CO5Jzysny+oZ7WZUtVUyN9epkFhme
         fY+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791682914; x=1792287714; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiZf56Uim4TT6iXbRIM3U2wYf4exyklNf3pNuoRHTuI=;
        b=W7NIojj74bmG7MJnhEYO1LeBR31g6XSu7n2btCnIOST5lFhgnAb7ROhiZVO06KMSfC
         L90NZrceXR71KyS+Tnmmno9Iq6KQQrrWkxfpRK61aGmrrzpMphG9XuVcI3Fvl1fA1+4k
         cVa6LpVsN0JU/GXWkmmSRphwqkxSEJE9qC5aBxdt1Xn11mYAdfBoKBtc9+jdTYtTzhpa
         u+Tpj5nOpZozMZF2MD/15CrVu64M6dmO0lp6Zc73LrXiWgqh5slR5Q4VV2TSMO90yntc
         ZCkjqhbgly0UgpNN5zLMgSVcKZxB5g6FRACD7V481d9If57fe3ESEtFxPSoSKQ/um9s1
         xMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791682914; x=1792287714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NiZf56Uim4TT6iXbRIM3U2wYf4exyklNf3pNuoRHTuI=;
        b=PGiMQMXlwcGlF8FjsBWyk1mbBf+IV8g6FddJbE9cbOFTUDN/j4YsRTMBRP7YBmA5id
         oB0FQ69desYcmLYyBc8TP7eRWW8IW6zHvo+se3vQCRE28vrl9lM+wuj4rABmMm0EHT+0
         XWOmO2XaSYObNZ6LEK2DLeMgjFfhZDZ0GtNu/2jDo2IGoZqJOqLbRT+QaXRvnMsz0XTW
         4WDuj4VQvOpifNEnK30NnxYGmhXb3d1GHedPsEAsd73Sbk3sa5JtXusmzH63xXLHejsH
         pLl0cX7RIQnZK2hsEOuT38A4uvR3Ge6ZznLBDee6KJl/yslI+/qROqvW2tImbC0C83y2
         6TNQ==
X-Gm-Message-State: AFq9FYLjGm9SWUKSHWkCjzKMyC2n1+ou5N75VkhTjd2fz+TYecUyBRZq
	QzqhITC+3tkMt3dg0expGibVyoEkrIvD526epfu3Gh75mOYUbelftBtQlJMOFcjDSU025PR0t6O
	QLKBkA1SP4KfV/nB8Usf95G0p0Mqlw/cAnQai
X-Gm-Gg: AYBFou3mU0IVoxh/8mSrkwBsdbJI8NdNONPdF6ByiaTfLE80QRV9W2NYjGXMTB64nvU
	B2R33ovpvIn9UyjNjDcPd82bt3oj5IJMzIHnZAJbkF7xX9HFLLKqys2xJ2N+fIFUYXUCr3b8Q0y
	wESWSoetkiAvYbyZaCNbAiisCeutx3lqcruXK/4F4DWE2hn17r+zK+9GnQ9dwabkJ1skzROxxG+
	El6rQ0bDipMllNItD9FcYyIXNiYhCzuCkR4URjtAxAGQMy3oqidtJ2Lafv9C5PtuooNJ3/O0NsH
	dtRT6iY4IeSQjz3zUDQHnHm8OVew/AoVOa+eoh2KAiwIToGn4jK6NoCMlNzU8VIJZtPc0lHWPqN
	gkztGPkxHvvh82Onh+HREeafjtV3rsXbGJjR+N2st+QO49k9Sj6YrFX6DxoulKnIGNS/bZO34pk
	o8jN0cmXZ2jXMghCpVc7yCt7w6
X-Received: by 2002:a17:902:dac3:b0:2dd:c100:7cb6 with SMTP id
 d9443c01a7336-2e842abe6e9mr47983795ad.50.1791682913773; Sat, 10 Oct 2026
 18:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <sashiko-outbox-164068@kernel.org>
In-Reply-To: <sashiko-outbox-164068@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 11 Oct 2026 08:41:41 +0700
X-Gm-Features: AclHuK-QjEu_VAQXcaV6bZOPL7kHjp0kHpv9N9xREPZm8mCCDGSnjyOHWmNvNow
Message-ID: <CAABR9nFB++tUxLm4M0cB_y9CXxA4QsXTUkS0wKGbd5F9LMrP6Q@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> Does this error path leak the dmaengine_pcm_runtime_data (prtd) memory?
>

Yes, this leak is pre-existing.

Looking at it further, snd_dmaengine_pcm_open() already calls
snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS, so
the second call in msiof_open() seems to be redundant. Removing it
would fix both the positive return value and the prtd leak:

-----------------------------------------------------------------------------------------
ret = snd_dmaengine_pcm_open(substream, chan);
if (ret < 0) {
        dma_release_channel(chan);
        return ret;
}

snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);

return 0;
-----------------------------------------------------------------------------------------

Morimoto-san, Mark, would this be acceptable? If so, I'll send it as
v2.

Best regards,
Phuc
