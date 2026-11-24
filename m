Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.130
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795485898;
	b=zLQpFfNMGi6p1J3lNpGIj+5X+XMALIBosr8amcRlci0jSsnbXVW7EGaO4hwXo+MlT6tf
	 tiv0TUkmARFaAFCi3eLPEiO6sWLPP+8Daf2hq2atQuv74yaHfthw8xuYEWj4hkNi4gEbr
	 b2K3C099g0UqkEokN8NzeJ3X9K0ccQMf1nA2TBqN6XhXU/gywZe9G32GMtmYTN5HP63Pv
	 5MmQo2NGxoU+yEr/ZkovJvUi9qeHGJMlsyAn/gKZn5CPB6qW5Za2sFeMFM8nOvOvMMWEe
	 6pIlBmWjOvkSU9Be0EW8YY2qcQxW3Kls3xcJCo7VnNfBrzdV1aZo4f9pHIatupUkP7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SsF+tVR2dZZjjdYGZuSRze/PIAMVBGDvDbNbw1sJLak=;
	b=hpM9iG16Qf+CHkZlCKwL9SmxPefbnivZcL+i6WyhMF7AkNHJ+o/UoAzhZar/6Usq8a9Q
	 H46GHlaFYh/21buux/Rz/1CAQ4VAClIXY1O0+cs8KpFn9uDKH5Z+uZXigGdn84yVYMXWx
	 BA4UaAsBzsTmUgTJMShntmyCd2ylBt+bSKcQ21qmgt5vGOEQwmfp1mMTo9DojRimnuXb7
	 OiCFXW0U3mIpegBoacnUFT7H4Zx8eOvNOfH0/ZHXR/uY1fma+t/KxeUw0VZXH8xx41gxN
	 cka2iOvIwv3OTxob1OJ5AS7idetJNZP4C82+N90mRAM91kYUYNy1IyvqZqfauqxiDcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pa1a8Yu7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF27606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 02:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF27606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pa1a8Yu7
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-8629ff88e68so1573796a34.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 18:04:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795485896; cv=none;
        d=google.com; s=arc-20260327;
        b=BoSfE/gHcza8Euw1kOHmOcYyqqN/9SrM/5FH1gVY+f8zCB075TAI2fsnkh2uoiM5D1
         1M22Dh6WlxTFjcXFcV/x7O6Tks1oamJ9fImr9S57feMfgcS4LcyHMzyK0LcyMgXtvinR
         Q4OE1ypeEtNmKI85sQA0DQSXZSvgRrm5euwam2JFFNTMpNBYy1lLERhRa9GZeFBc+Z1j
         cuw6fH5D1PMHmBDAcuyykcsDMCKrXohG0PL9KNkoSBJegLaBfYIwtUiLKUTzPNgSjvyi
         m+rQUusmP+c1xxFOWxcnAyX0pa1Bz02O9h8bdNnpS2Ua8j5muSHC6f3buFRiRkR9vv94
         s5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SsF+tVR2dZZjjdYGZuSRze/PIAMVBGDvDbNbw1sJLak=;
        fh=jvwteOZ13ZpHJbbEfYMqN+OKaE9ZZd4YqlB0TnQeToM=;
        b=A5mBzLR2D8/T4BACH/Rpf+NPnkxLKYrYYvBcT/GH+6uz56hCNgZtbQPg8yupWrNs8O
         Vj+fa8OcE4mVDIkBosexfIKzfaF/wPsVjaYkKe3iYGpnWYAlkQTJ4pXRnz1HH4lz1SPR
         A9+uEdxVfHMoT3FW+mCkScxJK2OuhU1AIblu2o8oSTSRUff6KJq43zFxtfVqtRM6ZELb
         VEQ998eCz+8pG5drbW7leyGozFpFoUw7OR/8/3qg8tYx+CQRLX2unq3tRhf4uZCN2/Y6
         dTy6DN5tMWvtAQ+PfstXtRVn6ItJXj0k+okSnUT4CHg93PljAxI2pgZpOQF6qVVxEg08
         ATdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485896; x=1796090696; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SsF+tVR2dZZjjdYGZuSRze/PIAMVBGDvDbNbw1sJLak=;
        b=pa1a8Yu7YjlBmkO8Bug46+pHNg3ozRMt0fUKw7MoOsMlTHjBYcs6D+1sUfATTM1a5N
         mtZk+WX/VZ1gw7y+HAV/VxRuCC33E1bRR1NGf6IjNczkKBFaCSVIAufiniGQ4Z7w/22f
         cWM6xVRwVkfqfHSdDFNuWr27K8PxNnych7PHp5cGrD7K2FbsJFygcjmVdbZ6Zj7Jaf+e
         SDDhTg7AZd4MVqRVg3TsjL6vPkDkYmZ9EG3OMl+cRt1qK6DRfCv4vkCNXyt6mtQTXoAi
         I1anuYYWSvug3xTOibtIGpilaSuIPYLdSbDCWcmSClnX7HtmxLpSbQqcYr7iy9r6kTGn
         jtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485896; x=1796090696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsF+tVR2dZZjjdYGZuSRze/PIAMVBGDvDbNbw1sJLak=;
        b=DjdyfTJnCLwDdXPAcX1Oj7asRbvWqjFUgDpyokVNGp8EXcKIUhlw+iHr8WjLvBj2HJ
         4bvVsLq6AfQAXvDKR6RyEqlYeatj2OnS5wjn7ox6eCxm7LiHRi7wJI0RY7aUW6CzGBLH
         qP0ZRX1B6ICA70aKZOUFducuE9xdXTXlZkgPvt8cvq/6LY692ZFEiZdVr9mtwjef1ppB
         Q49iMdYsbC+/TEVtfpQglXg4x7RlUC4XbDFbZVBfVMfTwTKK+oetBcPYIfjytPRg6pfz
         qQ6AoZ/pNX0ZPvpn9iuxu2ruUEP1DdD/PWOedijmilUL0HR/tfX94kqwHBlmepBruESU
         XByQ==
X-Forwarded-Encrypted: i=1; AL+hErEBXT9LwlHnyf1Y+h3GWqbW/QtsHy4/+LYqecIuJpMcSLdJiz1feNrWQgLz+iIrq5BL/dfdq21IChuWO+dNiIE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8QXGAQYnE2n2Es4lFgFaQjOIWQqKlAfhW2GU+wADHpvtv3m+Ys
	CqkzO8iU0YX9G8bO5yevCceSb2wnmXlcRTtnI3ZkuTm6myvyTrbEalD9VCv+pGvDDedI1lmOj1c
	ZZDmFLNGQT/2s+36nNNtFIHh4oAhmhKQ=
X-Gm-Gg: AZFdTZck3LpI7hC7iAx+ahnGOcGEx6FuQb2c1zNDjR22cEDgB8l3/Umc9fWDMS6biXd
	BlkQ+QEBZjiYy5nv8DTy4eJa9Mrt3W5+/iwMl3npNi9WiIH6VNlS2MkG/8S/27HPLQOhN9dWWdv
	9OUdytte9LmjfR49kHGAscLEPLpIFxfW7xHMlEOgu2xFCP2S6l1CE9flSTI8u7zUhD/L2RgvBpI
	pTag30isnfnsHYsQogxZh0pw+enTSIwCl9iFHIyL42l1mrqyYC7yfwwLbRWBnmSlRWAA6v88h+o
	6vwCNop2fvmYtBQ7sjnvPFm7U4Hbqqz8phCVXyoks8XhJWTxwmDwR+1e9t+ahfkaT7qh4ZEJy4p
	o+kQ+7Zyg7zpj+8i5S8WfVvHE1W87svY01WHC+p5IEWPmz5barItgoC1dZruQls3E2lz3BPPZUZ
	7IbrX+zBvKkm4eXHAgCQ3Knm3j5zoX
X-Received: by 2002:a05:6808:448b:b0:573:2541:1804 with SMTP id
 5614622812f47-57a0a20ac94mr14111097b6e.19.1795485896484; Mon, 23 Nov 2026
 18:04:56 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <179545322647.4.683470932650691650.b4-reply@b4> <20261124010507.90151-1-sj@kernel.org>
In-Reply-To: <20261124010507.90151-1-sj@kernel.org>
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 24 Nov 2026 13:04:44 +1100
X-Gm-Features: Aa3M54pb-4ILmEklgmD1c2iD062twsVtwMwCSlytUWUvsxSnv-_pzV9-1H4xjJs
Message-ID: <CANOyQmFCkqfgQLda1EUADP2fVx_o6g+w8RuTAV5ugJ_sP3OkyA@mail.gmail.com>
Subject: Re: [PATCH 14/27] mm/damon/paddr: support REPORT_MADE type probe filter
To: SJ Park <sj@kernel.org>
Cc: Lian Wang <lianux.mm@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	damon@lists.linux.dev, linux-mm@kvack.org, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI SJ,

On Tue, Nov 24, 2026 at 12:05=E2=80=AFPM SJ Park <sj@kernel.org> wrote:
aid if that will add something that we need to maintain long term,
> without clear use case.  I think we could revisit after we get such reali=
stic
> use cases.

Sure. That makes sense :)

Thanks,
Aveline
