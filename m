Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361523;
	b=uLO9GJaJjd7Hvf6iPnVZR3lqXbrk6nzA7t4C3CCKq6+80NQfXBz641cCRfYCAy3VZ6w7
	 RlCd3HykhXSEiBukYYavxYnt1hjarsfOQjblM6avTfLbMS3OIFpVAyzcN6z5nsGGROTys
	 bJIb7kyTlyZFoOYCJ9vzSxi5yxyv0H+7RRlFecadX1y6EvrHqQRb7Za4XHSSxl+R0dDw3
	 L4SK9O4WM/OTaGI1pXN1Ee8vFHYw7LfLHAZgUAF0EOuxvy5vISGUskiJgoEDLSm7hDXiL
	 kYrsP5HIahr9AD6Xik9XjB9kgvR16pgPkCghyRa5LSCVZNuBR5axK49s+EC+XNaA5Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ju9s0MMeU7Y1w3PQtdDV4OLUC0KytEL7nT4mcgFsYlE=;
	b=lpnWAXXqkD77UshUUA3NguNDO78UCnz/K3THjpAm3pTQnIIQ75Ky91fzCEXBi729n8cq
	 ll5Rk1gwuZuicqGXbTCVs0EGDiXxswQQBpU6Bc7tdVUOLCQJRAlRvrJjSrXCvZevCajUm
	 RciWb6p0O6FMnJyRWtibLtfylceWyU1PzPlNt5ZfSfttxzRStUYp5urMZY7JdbpaRNaio
	 2lML02ZP5wlUUV2bjPZvnOvzh3IFxzfQi0uvEueA7z8KitB3VMoH37UbiY36wlXGe6HdH
	 yndSAX4UatRicC1kOep9lTFyIxxyLuQScL6MhRZcJpsqTV3b8VD/GsM0ZD1WUd9kGDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDIPTwlX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DDE606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 01:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48DDE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDIPTwlX
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2003713a91.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 17:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794361522; cv=none;
        d=google.com; s=arc-20260327;
        b=ALPVMJ5cLWInti42m817tx1wfC5x2YBVSqFK03TyGfhJc0b84/jaJh7vKNX8Rs+iee
         OCCv8uAakTxSRw1a3jbvLBxU1IHMh2i5Ku/LCh0AKoZf0kc0gFaGgXcpY47+8vzmlYSP
         YlfrcFkDr4MTvg9a/WjkNqxDMtxtCEXY6+SgakTlHE9wVVKJTwMS3qb+nfnQHylHRZor
         xuhL0rLn/tRCj37itaBYefxI1s1sborGoI9OT7rNUSDrZt9bRE20ZqNxmqrwiOUZ1P6a
         z6D+LbRYbd3SD/p3OJq9CNlRMXbSARw6fnTkaWTKaqAM3kfklNHYaibt9CKz/1pLW8SR
         Um5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ju9s0MMeU7Y1w3PQtdDV4OLUC0KytEL7nT4mcgFsYlE=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=dCGLBxOVvMKv3DSMtDAv1LSRvc2job7WEgiu/ymXSVZX8mEMqwABF3a2VrJ5xIHgZr
         uR5MPbg3JYoZHfSBpjb+BCmiEOXzMMqw1JkLe9QW431a8u4aaZVpU9t5CA+9iXQ/h1Wo
         lSpsov1kTDT/uEYDTkD87mB1z+/ibvUAzeCLQ+Z0TnPfuutrAYpP+7YRMRL/XjFnSkvQ
         nCZgYX16FPJSHYqpOjdoQI0WS6tjgNHYAIXpG6lURU/2MmvEhCT0bBzoajxNhb+2Vb7e
         WHgqAJXER2bF6sTR3O5SX8zAe9Uq636Q01wp18QJXO2zqWbWqISc2YQLOudX1fu5KWVM
         D0eQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794361522; x=1794966322; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ju9s0MMeU7Y1w3PQtdDV4OLUC0KytEL7nT4mcgFsYlE=;
        b=KDIPTwlXhyXBM9jeIXErIUZ6wgL3yN0/VmSasiHUCLoD68jaLlSYJqhjl31qtHhOTW
         xpzznNybXCpXu234XMb6QPTH+PVZeBbilxPabCt3QuTXC4I80BFnF447tz3PnSA6yxbp
         n8AedBVkjAqmhCvNE23GfmMxCQniKDO7hCizA8g7rpQn9Ka1xUMeR9pen3QKMgWeTN3T
         DaAoQKMcLnLIhjlJo770jE8y7XMAg6t+AVpTN2f+d11/Z2BiX7TIEXPMOV69VnUrBoUn
         92XKG17+sRlyOfyP2SFMDrDKo3rIUdTnhIqRyqj31n+vqpjQrO2zml/kKIq/EEdk7Bw7
         NQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361522; x=1794966322;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ju9s0MMeU7Y1w3PQtdDV4OLUC0KytEL7nT4mcgFsYlE=;
        b=mNgXmA74WEJAOLJohkIENFxlEbyHJwp1Bb7FrroPboto/pYMOs+ylC5BT9bRIACQh4
         NtiEAxnfThRt7IEuOTxzIog8Fbes4TCqZ1McZZW1+Jc/oHN1iafFwODsMCS5/uxttALn
         w2VnGAlGRPN3U3t5n5Lq9RsXC2nJmU9W6lUWocFm+aXkadhWmSN2TfyfI0I7Hv3rcF6Q
         ZZRBBUOuD96Hq+528X/yeONw6BBCAZswRwMfPPzdY1SKWwFb2y6OdgHBzvIRfnjBzI46
         WLxTtHevayu26Iz3p4LJqXVXLEF+GoR1/fGcReH6tpIDJZ6s3ZfzyuOpt4nOPYKwbMJl
         Nc2w==
X-Gm-Message-State: APuU4Z88vCIjhwVhrrNHG+BOqj+cLtVabAkD8E5zwo7zoXA5KUtkGqwD
	qGkyKivkr50nlqyau8o7sZ1tNcPvkhEGaUg+/Ef8ag7zBPs4YdmFRwCc0/t0ahVT5ET/4JeB1HE
	Otn/3qk3oK3Ah/x6iEObK4wTRgCSbaLtBprvz
X-Gm-Gg: AYBFou3gZfRp+ZlnsTbiHpe5smnf8v8Mq+Knk7KPkHjGpA1CMfGjOUJKtDI3sFhixrq
	BtJNV2EtM06q/eAwPrYbzktaQ120qisxJpHCUtQxfcejMrHhJLw6UUrZFk725PzXrDo+D3AHkxa
	g35c1W9bLiZWdvt06Ohfm6jwFuH98bIsa6ECcRzce2zTGL5tDMNGzRznJFaDGtI8gt5aV8INqQ2
	+O6ogrU5tYM4Pu4vORZbn1jSdSS8yvDKNivej/aUIVZ/GHouSuaetoUkQLs1KvDUXcUXmbrFvTY
	GHO+MnW+Umh2fSlbeD3l2I5luQV22hhun5zilFfUBzvzwq0QVF9DXEPNR1zfjomo5O/EWEjBe1q
	HwirX6d+vNeq3PrnvgaqIIou8pAFrBynUR/K1oKGTKmNKYlqeqOS1h91R4Zec2Vf8kVYuzc3a8/
	olA94y/oRlS8u5aHspXkdyByt/PsE9SxYCezUXYfjKAW37Fsh4pwdH6DjzfFr+W3uoc/Xt+g==
X-Received: by 2002:a17:90b:4b88:b0:3b0:d0c5:c110 with SMTP id
 98e67ed59e1d1-3b182f45179mr883244a91.56.1794361522497; Tue, 10 Nov 2026
 17:45:22 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
 <20261110095525.504660-6-phucduc.bui@gmail.com> <sashiko-outbox-206833@kernel.org>
In-Reply-To: <sashiko-outbox-206833@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 11 Nov 2026 08:45:10 +0700
X-Gm-Features: AclHuK-kPTPgQfmc60tjT2iHYfFGRxXNQL8R27UwPHlPQqdF56VBND9txVrlVgk
Message-ID: <CAABR9nGqVdrGYD8mz5bLLkXgqcAzD65H88iD0pddb9gog0aC8g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ASoC: dwc: Propagate optional IRQ lookup errors
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> > index b0d3413c27d2b..0d2be2d8d31ae 100644
> > --- a/sound/soc/dwc/dwc-i2s.c
> > +++ b/sound/soc/dwc/dwc-i2s.c
> > @@ -961,8 +961,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
> >       }
> >
> >       irq = platform_get_irq_optional(pdev, 0);
> > -     if (irq == -EPROBE_DEFER)
> > -             return irq;
> > +     if (irq < 0 && irq != -ENXIO)
> > +             return dev_err_probe(&pdev->dev, irq, "failed to get IRQ\n");
>
> [Severity: Medium]
> Does returning directly here leave dev->reset deasserted when
> platform_get_irq_optional() fails?
>
> Just before the IRQ lookup, dw_i2s_probe() manually deasserts the shared
> reset control via reset_control_deassert(dev->reset), and later failure
> paths jump to err_assert_reset to call reset_control_assert(dev->reset).
> Bypassing err_assert_reset leaves the hardware reset line deasserted and
> leaks a deassert reference on the shared reset control.
>

Good catch.
I'll update the error handling to ensure the reset is asserted on this
failure path.
