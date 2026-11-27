Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772513;
	b=r61ZZTjF+ZHiO3OWHCPEstvUFiO7VZkJ6i2klPCexUPilDQPTTrKksUyM1/4FAnASNoU
	 oliw3dF3aia4q84wgvCB/uczCxASXrEcCbzK1O+bsbNI/3Qf4uUrLearr0cgpeF5YGLa3
	 0/zLjWN5n1czNYEFkpfIq5BJylwY6tujMxTwpCyjK54VVEdzJlS+IoLMRxQ2IVo1mtya6
	 Fph4G8qoPC/S/5OkQd8vBZK1g2+qTap7tIxb/8nw5RQla5ieoif8aX5K8ou64ykvSj+xy
	 H58BC4rgwYGWTRwy2KMJUiCGzjU8EjBlbLfJ5OVTqe3zRkr9oHOxfxiPlRbRVU/zRWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NVj64znoMnEV0DTb7YzEgwh9pLwFWMenMAghgpiawWk=;
	b=Bu0yAerm6lvdgwALKyhCJmYQRuF8eVHNaHwQSSNjA9/VnvJGLPeOHmxRCUtXDOLkKgx7
	 BATfXmQsR2hpPE4FlzwtKcEC5XdHj7T5kZhCRx7J4SyzTz9S4orcQf1u/pF9EUmUzXv9J
	 +hp/rp2T6g7a2RbuDnJut7SbPrIlB9g2IUFrwBB6hC+4YwhxSUmx/KCbtoNBAETyTPz8U
	 jnvmFAbrvhFkZoqiRCoY7fhtXxSUViebQVBh3VwYspNA4ADu3X/QJRRXH+Y3MNcOLhQeS
	 bGYrFZGxxi3V1Ra3iTbucrI1dNf2vHIWGGXi4sq4DmidlIwUR6jyr0g1vKue6inPctg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qv0FYRAs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D5606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 09:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238D5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qv0FYRAs
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f052ae3c86so42686535ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 01:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772512; cv=none;
        d=google.com; s=arc-20260327;
        b=p484rFxvMPiXAZb8KPZFatMCj+uaKQ1VyLSTLBg2DUEbH9xLXGd6hUuhZrWpXOfE1X
         1pHhpdSU50n6xDgO+xF4BmMRUa3ofqTtIi8fPVGEO9Wznyr/HnoPuUsnsxXcGXVj/nkj
         qIzr9GWVqPCRqpvR8k8SwnJvC1Z9cHS0qPjYcLDhOO+ADfxk/FCE3yNqzm9f2Bsi+N/m
         kzmazetgQLU9glxlyXE13aSHfV8aGe1fzWRPAof1EOXKQ/3qySp75nbueVH4sLDWQK7m
         XTqyWJzRjZcoLl7GEFIM9+FPK9noXrVx52pPBLqYhSSj/HslA/g0vkfDMuAkusThsgsL
         kOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NVj64znoMnEV0DTb7YzEgwh9pLwFWMenMAghgpiawWk=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=Oiwkl3AsoBHGpNM7XwtAJpWU/+K7R2GJGBDLnZSNZOiKmlKMJTlLpzZFrtrUqxNKtV
         lk3XhBew+kOA20LtGAqyLw97Bfasc4fJInYPrRbcfaW5HEPCJmKRiNgstk8RzTvcGwk5
         z3+3ondoxoFC+rIAiXXGnj4JCVe1ipR5zaEqx+y10vNqkQ165Ob4WJtxDn7v0NjUgbR6
         8bgmUNu2ZH9LN4A6Go1B8mEsAmT2MBMN4lFvT/djJ5qLYdOeRCTXy51EbIfWTdMVIvjg
         8FucAkye982D9JGultiGUh8Fe+R0ij9hbNVVRGnnfHtN86PlLJR2+WR15ruh36lafT3J
         rkig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772512; x=1796377312; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVj64znoMnEV0DTb7YzEgwh9pLwFWMenMAghgpiawWk=;
        b=qv0FYRAsBTipticKGimeD2+n7kEDCGroQ7L8n4/ZCgU0W7GSnl/baWFNdJev8it6ky
         qPZNw7cYtSSsByKUPp07GH4/DoszRi45pvV0w56SoEeDemju1TuMOCY+9lowzbp0iqx5
         X1KNjHLvA2t/FFITRWxvzNGK6+HCmb2z3p58LXNvqqdk1lXRTi7NvogO5DfbpQcLtYs/
         t5d39zDeTq8FZLz+VqYVf19br1QynkAKrXvzzWSeG5EIRDFcy5eWirBhbUBfXF/fiLeD
         /WJJ26r6+ra+FGCJBnSdg0CjwMZi/klw+o3Mw45aLf0SZaRW/DbU0UqTXcIDsuF6ZGcq
         StRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772512; x=1796377312;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NVj64znoMnEV0DTb7YzEgwh9pLwFWMenMAghgpiawWk=;
        b=kci/6wYF3QOazCUMp8nOvcGoR7x0YtHXlZB2codWU7eW20Ss9JOOWDDpz5GIQBoc1S
         8UVAJMudSBarlWONXwM3OEsNCr9LgL78B5uU1EwljBZz8Q4iE/PSpTejG8/pX7fA8GTs
         SnJH+9z/FwtMaI1jn+fDl5//pqDY6x5jyMEh3/0v3i/E915f4zpPv/T6aFzz2CmHoLp0
         0mIfoH81u7+/h6sSEqATdFpghpBXoe1ofAD1l4qx5GUYCIHBwegQwLay5W6VAN9zyxMe
         1fndjGSXbYsSXrid8Efwp6G+zlTgkOqotQSUJo3lHXzD66e1OdnKEL5PcVwvlG+OH1vJ
         vWTA==
X-Gm-Message-State: APuU4Z927m4wq0KDu5laKbznFD7cDn7Sr2L4/1yTXqgubJvL/ZyCsw50
	vJtxXhGNAjPCs9GP0v33gskfj24WfJFZHadpQOj4LzsZkvScVyLhDmbzp/BUh5FrYvH2yf0AfZb
	r5pQyN4UeFhJs8idwsjH0wK85pfwWbjJ1N5/a
X-Gm-Gg: AZFdTZfiMJahqksag3TAPFBIc8nuy057vCpPlq1g4UMNDiZtX4jxLss0tfTvbBObY9Z
	edf83Uyer/J7P7PwSPwK8lRFssKIk9WpHO/nXvWMlGo4pIsOhj4EspX7O3j0HM/9NVt+Y//6QYq
	neVFUYp4d0dkJx/4nI+MgOpoOvLOjGJw0ByGjP5cSoacnaNzEF8n+QK6vZv7ewJ0vbjKmEWDel5
	lGNbnVQ+JPk2GtVez04cEEqo2nHxJli+a0Yw0ypZZevN9IuZLGaVcjS4XPGxXpGKKt+Rbmjdxxx
	jeusN/PwokGxwvQL40fDUrGTKBfahxB16KSg0S4DrYanG2TZ5ciJ9+oggkIClJe3mvIKz2ez6Wo
	rMTfU/0tqhF0C1UyD/j83I/DBy3iAj3hKOTIwnvq/YyD3PV61ifoxEnhlt/3I0spv9mZHLUS4p+
	+jJyqFdyUqFOk42AIO5zvBENfortXr9Dn5ZlxGo2OI4iGHx/xD2EWnIG6aT63CxUksNXmmuA==
X-Received: by 2002:a17:902:d2cf:b0:2ef:d79b:680f with SMTP id
 d9443c01a7336-2f03f1767e8mr264809025ad.15.1795772512312; Fri, 27 Nov 2026
 01:41:52 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261127092345.12383-1-phucduc.bui@gmail.com> <20261127092345.12383-4-phucduc.bui@gmail.com>
 <sashiko-outbox-236980@kernel.org>
In-Reply-To: <sashiko-outbox-236980@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 27 Nov 2026 16:41:40 +0700
X-Gm-Features: Aa3M54pbdy8oealmu543fJS7IeojBrLmhZhw4cmj21G5RRhvG8LHoPEKXBQyGz8
Message-ID: <CAABR9nGuLNyE_y_9zM2HT+FYsexoUzJWgtDybE3tvgu-NZT9-A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: stm32: spdifrx: Enable clock before setting substream
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> This fixes a bug introduced when the driver was added. Should the commit
> message include a Fixes tag?
>
>   Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")
>


I don't think it's particularly important for this low-severity issue,
but I'm happy to add the Fixes tag if the maintainer thinks it's necessary.

I've been getting quite a lot of stable backport notifications for my
previous patches,
so I'm trying to be a bit more selective with Fixes tags now. :)
