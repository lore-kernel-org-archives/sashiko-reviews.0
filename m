Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793950535;
	b=XOAm1VDrwIkruIpv4bkCvetP9oCdESkBA3qq2pAjkm9H5NsMMYSrI+vcCGVXn+Z517HY
	 2CIiOGVQ0yCsmFPslFmbFYH0DLpT9aSWbRPjjgmnROK77j7sjDl1vr2iaP2YgKfS8TBHZ
	 EtvlNlFQyyxqu/DI2j9mvShu7BGnF3aKXxzjB+u5zp43GWYu0+5CrGlwlAoaKnByeiCqW
	 WvOFkAouXQc3pJBpBVgn8BsSlnnU6D6SaFybo6v7FZuqTo3g40/Eg1f7FGFLrh7uh9U0Y
	 XGW80hbaA3Fbv2Kt05Jqw0MCS0P48S345C35/ZBUdcqPD+dtXNxvNgXwgETaYPcoqUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=7ptbIZ/iYk/cUsLSNwK54InvG9cKveVC2qE/NSlCtAg=;
	b=jEdMjX1lssL8w/PXe32vSIvHwUG2TfDTPONNNXpAnNylIj5k6TM4fzge4hQTbLZRiTjA
	 m1RpuVcmbQ0lWLzXPUjo8T3Gelj7e8n+mQBvtGvI5/6SwCgBINAfs1o8N3E4Cf3cGEWdA
	 LOI3JBK5/3bGftP43P4RtZyvLdMmoC/2NDQoSkKDrrE0rSfV6JOA37RMOJOjdpSMHPKsu
	 Q27ioJoUBHt8V2gQqOKui1H3UAtB221foDWG+dThydqm0Gm33/Y3HlIi6VFyLfFY6raki
	 FXrpC63LW5Aom3cp8hnFB0ZL4D/HTrf780emI9NgBZvfy87sZJUnZOd63bFQEkW1bww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rDpwwyVJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC41606A328
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 07:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC41606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rDpwwyVJ
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so164212e0c.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 23:35:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793950533; cv=none;
        d=google.com; s=arc-20260327;
        b=Le8RlaxV+2Eal6BgS2XBP9Khqnd4/h+9NMyzPmJL8xfFkgbO+/IxpofMfNN8ASiVNc
         UxU2+Ul+n0JEKPpp9O8mQJ3lwkQAQGbCEweYyOWJBcNktxJqTXraYF5BhTvy2P+1l7Li
         xzv6SeFbUChuRvvfjIdICO8kPw/dnrOrHpOmV9Bg4omV3TF5Zw7Eo65sNK+Rt3w8RrSj
         mgLnNI3OKoreoMcMeIfSUQWOvSajNXB/50TlhpAr8oSg/hFwANOUxpTi6r5k1cHW9CFl
         2JZc65ybmbIP142ofuyGMpAJ1PPx4o52EqencCAhaL873KjLIa2kUKQwynaxVKoMtr0n
         tMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7ptbIZ/iYk/cUsLSNwK54InvG9cKveVC2qE/NSlCtAg=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=jCwfp8T0g5hOgyfi7dXt7MvZgEmj0Jc5ZP7bu+4c1WnrwxbAIUSh/+hoNBdiPrNPnJ
         uxE2sGYxPeGbv8wY/7THQKC2YH7yABzFTfoaXrISPYuRXYUDH6O9nzmV8X8cEjAIXi7z
         LYsDVZSAJSMS5A2oTlFVaB1ZolUOlWtaS7OWagUjMnXDGdMJTvtX8Ur24FzwfVXjzSTu
         i+5sY7GdQgH6XqX2cHsklABMtlmv57CNUgH10sPwdHzQXbp0Rt80Rgo+tRkcu9l5hVAp
         9kpUZkn7lQjth0ltteiFuYxa/sSNiqztNlAvd1VfNCrEpnigCS2vPYH/p9MWb8+ygUQF
         Dslg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793950533; x=1794555333; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ptbIZ/iYk/cUsLSNwK54InvG9cKveVC2qE/NSlCtAg=;
        b=rDpwwyVJ9rWZPPKapjXIMljHCzYXSLEZLZpOjxvog8AIbx/TWwyacWrqGgvL4UBgix
         DqvY6Nvq4dHqsLspHn+WVr54Vp54sKsouITpBNKd3IsfwRYXISqI1yXUSg+vkpj/ljBR
         vcoVT0W/OmaRzaoZ+EhAcGe2ltTrVcFmmI+/kNLKYyt++3pBfMo8/aokRM9Z/Q+HZF1t
         P8C4HveyNinYxITNgvm9OpX9LMRfcWhIeVH+RMJMdnMlQPy7Rc5+jvJR2CIVLZiXgRc+
         HhsIkCg38n7WMkk7+A2lE16weuYcK5nTNtVri+92NaMHhxhcMf+UytdWshuTXtCp+SHD
         uLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950533; x=1794555333;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7ptbIZ/iYk/cUsLSNwK54InvG9cKveVC2qE/NSlCtAg=;
        b=E1rfhznsxP5F/7qmHcvi6BLV9Rcg2st5e3vXyOXhcGMhuIVIaVcIkRqGQltv574Q5x
         W73F9x8tAZHzWzuoINrx7A18SmP7T11JTvvZMTBvDQbN4Qoz6tClugAhGJMzzn8q1SKO
         304fGESwLtcIbtWwHfVgH+n2BO+wrxzLCU+Cc+YEy1b6CYhgm6dCbo1PxVQ1DfE7j5ZC
         Uds7AUH66B2q08eoeyxfoXE+pvXrZ1zgAOIdPdcE38eTXg+8lciNHcKYISjVwobp7o9T
         gK1lUYdG9GK8rh7EcJ5tzkaW+tNdMnu2KfjgRTN8NDXPpV6M6K1PgCkYhwk4qAaJ5C4F
         KTRw==
X-Gm-Message-State: APuU4Z8f4MqS8jQtLfbRM7dsK8SM10WDa5VoWdYNKQDWFPI7Ck6Ikv+U
	vSOXKONytTWkU91ADpBlJ8/ZsxQM56MXWoawD2wmDNYZPJeBRMJoW1XHErxEZIsMvmNSDs79vP6
	rx1m/bnqVxGIIrhZ2gr3FMceEmPgQr5St26Lt2fu4oFZ5
X-Gm-Gg: AYBFou0622DfxM0cfwW+8Qo+N4CZbJMHK7QLoMhh0JXu2kHfDtHNXaB2g/0sCJeO493
	NCKFdrjgoLtGkF/06fyWfGvSUhFLCQUCO9QKt65TvEZj2/m2P39wYN9ZdxnX7jRWW84nshKFG64
	zthIIE/QxvV45uXLYqITsnBgRuiKFkxt+nkzrBuuR6yVrsLrnYPrEDAKBS6MrgTtOjnOenysxej
	kdYS7wrShZXKLhMUmRsPWy1fJoZsU3IZ6ZNc5f+XrlGLoNB01zbIf6bjNopHsSxBjFexux2caX5
	lcEngnzAhoXymSkYkjmU6pyN9wtB+pU4ak5lsv9G2nymvFhgjUXzPax9en3Kp0+qLUJqdZyscth
	/i6h8JmK7dSz12mCpAILoeKWNcMyg1MX8zST9TX58iesrUJ9WZKZjoY/MfwS4pt0hZxYh3i0=
X-Received: by 2002:a05:6122:1d07:b0:5ec:c3ed:7d99 with SMTP id
 71dfb90a1353d-5ecc43bb9camr883031e0c.6.1793950533575; Thu, 05 Nov 2026
 23:35:33 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-amdgpu-dumb-map-offset-v1-1-7299d94ede11@gmail.com> <sashiko-outbox-199163@kernel.org>
In-Reply-To: <sashiko-outbox-199163@kernel.org>
From: primecoder 99 <primecoder8@gmail.com>
Date: Fri, 6 Nov 2026 13:05:22 +0530
X-Gm-Features: AclHuK_2NbDauhK1vtY44LNfDgnkfJZczP0ASKl7ziRTUuqXw8aHM_GaounR8o4
Message-ID: <CAPf2aH3ZEXbiukx-gGqJq6Sd9_B2qQmcbLNf-Knsw-U1xYg6FQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use drm_gem_ttm_dumb_map_offset() for dumb_map_offset
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> should amdgpu_mode_dumb_mmap() be folded directly into
> amdgpu_gem_mmap_ioctl() (or at least made static) and its prototype
> removed from drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h?

Thanks, done in v2:
https://lore.kernel.org/r/20261106-amdgpu-dumb-map-offset-v2-1-0abfb77a84b8@gmail.com
