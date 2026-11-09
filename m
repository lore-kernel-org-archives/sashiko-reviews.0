Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794200489;
	b=qjLZ9FankE1L2N1V0I1d9dp2/LoULMoRhmBC1HMSxLK/A5B4Csa/wzFu+K0KWf9Psp+Q
	 wN/uOjpCM+7o5AnB806b/Gv+QbSJWQYBU42mrTd8isVNGj64dqGPCY8VyWnjOem6J2p5U
	 m2vDrQpp+/rC/7H+aotikWypZE8yNq8eeuAkOUsBvlQSTFHkv/7P8rLrdnyPrQDOlP6AI
	 D/aixd8rfIcKK4HH1+GbU58gDDX8bzlAZtF8/5TnxaRzu2DVzN8KOvJiAGH8rd6In9cqe
	 2GO8qkraRr7aYm+GLePZ79vrR4nvcvaEpkG+H+2dU9WVX0lvAlBTatUU0HLAdU2i8cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=gkMIpScCaOHHTxz3h31CJ9cN+FPf4BX1WK6GsfzWcC0=;
	b=ZLq4S8X74mcoW7efBUmHIJodSTipG0d1D/6xPa/dx4WUsWTs2tDJuf7fGEzDl3pDB3vb
	 0n8HsbXLySnoeKN2R49QxFvmpdD3k05zVAHXAQnLiIjFmBKLDE3mJ/kLhGNVGe7GcP5jv
	 UnplQzF2nbYCaXRLmDp1BnZZ21ABGrCQBNI/dijCxEnLV57NjnpxaTFQGjfmdyWcqypJ2
	 qwkf3lUl07yDLivoncWiY7aXWv+6fzK+hxHldNF25sVJAKXQYUpfny4N2+4QfEgDtr982
	 KFBgOJdFpe5kuzj+hn0ZdcG+5QUP501FEp5RoI1FOGMJT2Xbuq++o1LegvMI9XwcoLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHLUcp7N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57846606A322
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 05:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57846606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHLUcp7N
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so219522a91.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 21:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794200489; cv=none;
        d=google.com; s=arc-20260327;
        b=KBr+Uxklo227eqKMOz+tsmlb1kPU7J6XWkdPC5nUxyEsTYeywVXBRhAn4cAiiBCXKS
         lCUzSXL4xXBR2wx/Jqsktdc4Uoz8AQjFYKRedfm8Bvrl5PDCKT+ekAo+NH0PJsuuRP7Z
         fYZNdPYRPyUtd8+iZEV2h4iH8SYnxib+xkXPVCz4B5uh3cz2y5/KpZEXRQqLqIwa2yE6
         7ZElj62bv1GqCQkKnZjRj+iOBnNpcyoJPWieD/3m0J29KUBEG591kQGow/bd1bGozaBG
         uR05xlBmBTQ68bB5xD14FUTKU7HS+n+9jp/fHwNxMu6EpEXqd97xr8t6K3Mbp9WfmcNX
         BxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gkMIpScCaOHHTxz3h31CJ9cN+FPf4BX1WK6GsfzWcC0=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=Q5wQDFKXqqPtERPUN5Bukwe56MBSiV4UKN372BlwUsfH4JudEWnM5hHpsJKEFF1ZXV
         KaYFJHJAHpp1PnmcuSzX08qU5xDwx9OJvku4hqPB36pPAQnEOF6LGmMiaogpg88Duz9s
         j4Vugt70jOXelz1Lgp4TVYzXY/U6uPrURBN7v1hzC3CWrmfIY32KsGCqNfT/To+MQul0
         U830qCsVDSebwbpJeZqo0vS2b5mT+ADwF5K45ANSKjS8tVH2sEqN+TPzkRlG0JDKefPT
         fr0ChWy9Np2UQHojXTT/EkPfkLWz2s6RAa1Qh9ArwiV6EpBRlR0/UG4R97FGhyAkOC6T
         K3Zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200489; x=1794805289; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkMIpScCaOHHTxz3h31CJ9cN+FPf4BX1WK6GsfzWcC0=;
        b=LHLUcp7NgMqXUB/IpewDZ3uwj70qOFpmylisM0v79tZlMNPMjnShVVAH9Il+JGPAiy
         gFpmsC6r3uXQCN3vnSQocoQJtRNwDZb4TjxTMznrWF/VKD9vvUtKxd8bX+i+unDYREvv
         MxzRpxZ4RKWa8tMhnyjPho1l5fwUaer6EbahsWcck8lxkAEnFjeqiiA2tfYovXtBxIbm
         PLE2eTvPRpzle4GAO12IN45ycWkd+76fpX2KfXxWOCQhctymV4Oy3mLwdpfjMafeVBl0
         /sRd8imo6OM2t/Glglis1QalhPW3pFGFy6HEd8AQYMXcLu5056BkuEe6dzOzCm3sdI0P
         h0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200489; x=1794805289;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gkMIpScCaOHHTxz3h31CJ9cN+FPf4BX1WK6GsfzWcC0=;
        b=YiQonrhicA9c+DQU4mmFyIfKt0D4UkWJc46y9nFG2vhN4ByFT3PKQw/Fqc+0oG1Oyg
         yYlgyxlivQwkBWYZZVBgH//Ij9ZOE4d+SdPpmAZSy8o973kOoEkw60poF5LhSFh5iq6a
         TdfjFI+h6Y4lNK131+iWkSTmDcIGJBNh+93fNUq5iXSiVgZZLAImIH8LCAJlHRwRpVp2
         LdlxoFC8l+CO4t62urg1Lj505yrIeonv5Gr3cjGF3yfGTYgmtN6SujtEl9J+p9MRci2s
         VPgF4XRhAz51Pkoie5mq9zzy7P8nXlNAv/OVRVA2AZr5yizy3DIwzPIiu/D8bOd4pDZZ
         VLoA==
X-Gm-Message-State: APuU4Z+6/gpSs1ccgGKz1kwbWlaB1TfyOnyZvYs2cWC9jFDdjGamwiR9
	ag5VSL5mSMSX7XU6DLoKXl+JYaAlg+5iEPqJXVfVtAXwPcjzLsIRsDZHPXjB51p+T/JYb+NIXzR
	u/6oo5MBvY8yChv2PLPqx7iNHkTFtPRvrYmL4
X-Gm-Gg: AYBFou2tiWF+2w+uXQadiaXjTaoY/Op/NFMQcbpiUEDNbDVJN7n1zKH4DGF8VqUe1ZU
	XgQhDXVE/LDlQaRzRde7K+cmqkugopFPaoV4JXTOfcPMSkYb2nER8doSeWpB4O7KeyhP//y14E0
	QG3bXke3GQhr8HkRKR4nelhKO9VVLGlV5fTxJS5cF9kb9SDalwXBG2JccM2gZSnVMVmF8NQgwdF
	+9huchsQ9ZB1j852G2pGd0DZ1ZGDHa+g36yw6h+XyiKAai9CqbLulSEl5FZcEPg6LXifcw9UNPf
	aWTlJWdxr7b/kJP8p30gJugCeqTQ9jYkcuqKYts7Mf747fA3lUrA0AqAZZ/CzaG8TWJj+9f+udm
	+Xg5AhOlgTROrjWtxfFnGZRAD2M3mpsdSrRIZ0IklVXkmi95BAQtdJ5KWIcvWtdhASEe5NePxLF
	ZbQH+cC8Oah0xvW2UD8QcsvXLGmZNvuP1u1x8QyJeeFlfpWijK
X-Received: by 2002:a17:90a:cb93:b0:3b1:4018:bfdd with SMTP id
 98e67ed59e1d1-3b14018c05dmr1328463a91.7.1794200488303; Sun, 08 Nov 2026
 21:01:28 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106112940.53550-1-phucduc.bui@gmail.com> <20261106112940.53550-6-phucduc.bui@gmail.com>
 <sashiko-outbox-201333@kernel.org>
In-Reply-To: <sashiko-outbox-201333@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 9 Nov 2026 12:01:16 +0700
X-Gm-Features: AclHuK_O0wbrzQKBAOvzzwdSeKE-pl4ntwv6Yz_1ad6WU0wDxVfnxKoJwNwEAAU
Message-ID: <CAABR9nHrU_x++FxAgw=q9-WA6h-GieLMG3sAVuj2s4ijVygKnQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ASoC: dwc: Remove redundant error messages
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] ASoC: dwc: use-after-free in jh7110_i2s_crg_master_init()
>   [1]
> --

This is a pre-existing issue unrelated to the current patch,
so I'll keep the patch scope unchanged.
