Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48C63B52F8
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 11:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534098; cv=pass; b=WokEwAecBZjfRtozKq+WqGqPczRTF44QwYPwQPYeZ7gTU/zEoSQ7hYZqa8GLvrQ4uQfxc4+q7NWRa5x3wTgICz2ofnKvn8/yuHYBEs4ZiO89v229KRt/SYuYLLosBoP+X6EE2Cqp3sZscI277kvmzEDcmOwMW/q8RYNb6s8+8CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534098; c=relaxed/simple;
	bh=2rFGE4qfBernJcN/gTlI/3NpT6ke01djCdzhEcA9pVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOBfY5XGIVgKWZp0phPL9iffLcxIcxPh4tQfs6rbxseLstxP571ZdKg3tO5KD/BT+mAGjWlQy/JTK499X4OF6OrucO/a2RJvSE+SzogcWJKB0XG/8+yz/V+2TcUidRCPAxrAZ0tVKqGEhalfWJJzVgCDkBo+xXVgU+tpH32p4PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO35d377; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO35d377"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1020503a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 04:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786534096; cv=none;
        d=google.com; s=arc-20260327;
        b=DZ/0NKMl+FmYPIKiD8D/eCnqDriW7SvP8wTYLthi6FyEo63ZMfe7R4YRZoFOvkfEK5
         v/gw8xFjR0cTF1nqmI7Q9IxH3hutBhqqzLlxZNaERv644RgfBp6WMobcGxAYuhZJnYB4
         rfdcnZg1p7LkoGDSw811CzpYZBSsYRIHQmab462kzCtprjyBCnKPezZiy+Ia0dE5JT6g
         d29pdhZpeDv9vuIA6LGwT+RNuu91CpscgnVitTvcbWpaSKBHTCJHjgXHnE+0msuEiqHi
         MEOXfAROVYYUXWqT7bJmbaJfBj52rasTMngy61lhLclGnukVlc4dY124ANBN+pfjcdUx
         A+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ciG76+KQ9pkjJMs5bmm5Wc7sSbVFbcyhCTB47xsSC/4=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=mOdIbswlqYI8rzxikzSOlNKELu9tqsbIk8E7EK2k+cR9o4QyRm0Q+U56xU7SA2nKkY
         U3QWzC2ugi0RAjoC7lCuxOfZVR+q06vL1tDmBhGOe2w0B8ZQ9k+W+NWQmt7D1MB8+fb+
         sYRFyVK66eOCz2oJyBAHAgpQ+U9v95bo6ZUNXd3wghD76Lbxtk+TrrD8ny9c7P8dSvpO
         yCKKVEiou64HUXEvQpnK96xKjksL3v+SQDVz1LQpSTPI1YF1FuuaK9p85ONbbIEEqA4y
         jwVh18Ke8OYl1VDmODd3lFN9TJiWsBrBv9RsNHNEavi6ZuH2DecJi3/HZ08xNK5u91+x
         fcZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534096; x=1787138896; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciG76+KQ9pkjJMs5bmm5Wc7sSbVFbcyhCTB47xsSC/4=;
        b=ZO35d377tup5//fQ+IwOdQOcitAqVd3kn+QdLvhAqgkcyPG92EzC5B3sw9RDjHaOza
         YyBJe7eFC8G86HRukVNfkjWFmYCfn5eGSRtkHKLYlcNO8YUDM8jw2DPdBchYbsnhSWXS
         jM999ili0jDDRZJsMfROSHm9gjyGt2i2WwD34dLqzU2Rr570sKJHJ4hXa+ctPDKJDfg/
         6k/AYRIbCTSnE70V4cj9VUglObZpTVp29lIdzfHBCWoQgetIRe/JirM/QPX+FsnPGhsi
         tryk3bzBaIGqBdfBQhb6pRIBOg5fR/kgPmea8YJzoiBsdWThdH03/RbJv5+lLQoGGApf
         YCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534096; x=1787138896;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ciG76+KQ9pkjJMs5bmm5Wc7sSbVFbcyhCTB47xsSC/4=;
        b=CvSsFxEcpU1PlLE247m74aGg5bcqWZApGBCO3FHKI0eFJNw35coHL/GVHf+JB4sGtQ
         kckKM6eA/TKasFtbS9o2zm/rEjYT0xivAPrMZos3HRrJn5yXFtEUg6pwvdGlAxfmBO+G
         LT839948NpA+VgAg4S8d9nZn/cN633+CAjbTB7wd8zBLhBgzmmkDryJo8IY/EBHX/FnQ
         90rz2IP/8ZS2RgShrJmecDt79hGV4v/kbsDAo8bhYy2O+vQU0D58/MqxZAI7wGkaKyJ0
         sK7RuOPOCbjT35LksWwsRrv/4w5l3Ac73Y8uR8RLSeuj9eMHdmRM/edAiPAq4xxClqio
         xGZQ==
X-Gm-Message-State: AOJu0YxKb2ff+TpP48Lp37E7tqMKw9vplZB5tWyRz+b6en29Pgv3gZcB
	GWJfGa3sDF79D9MqgjqU1PwMJISfoGwuL7MNLO+a4/D0eZd06o59URgfjZAHf2UxADywKqTn9XL
	4woPNcGb/G2B1lpLdzeRcMh9KlD/hFnckS3/j
X-Gm-Gg: AR+sD10SrsflccRq9byF56nTQQxovdicBQa/t4meKbDO3uhTstWOZJ3sAFrzSpPgC+H
	1sriBZvcs4LShcHvz+xou3f/LQoWchJNAJ0cvs9XZBdn5AMqDYRohxDheu32PLYesxBGuKCvzhs
	0xNtnKBOysWyrm9zkFzWEXz/9TXJtzBq4qhgx3+pzY752Id3tOaY5748hseLT8Qdty8/zjhvNIB
	03OjInhO09y4PS+jMgBdWaZau4WV+6+ZIF4paF8S2VI509/u8dazSrwC5y0u/3USr86o44vLdBJ
	7WYfeBRe8CoWB7G1qV6bUQGoYSdLiUq0KzUTqrDS41H0ZCNkBe93wdcfXpe7zQQS9JKZExz8gzu
	NyuP0ALVspwVvyUXD9trZrBn9qJS0AgslzRHCk6mp5TQ/lnqY7jQZU9+D
X-Received: by 2002:a17:90b:3c50:b0:38e:8050:e63a with SMTP id
 98e67ed59e1d1-393014230b6mr4960578a91.6.1786534096017; Wed, 12 Aug 2026
 04:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812101418.37966-1-phucduc.bui@gmail.com> <20260812101418.37966-3-phucduc.bui@gmail.com>
 <20260812102938.D4E101F00A3A@smtp.kernel.org>
In-Reply-To: <20260812102938.D4E101F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 12 Aug 2026 18:28:04 +0700
X-Gm-Features: AUfX_mxppOfJDeDuODBCk4keCHLpvRYa2z6NmDB-C1PSyXw7Xu2FjUDIo_zRHs4
Message-ID: <CAABR9nEzo9pb=mLhZ2nyDuSYr=qDcgBZDzMUqptyvDCG8nLgTg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messages
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> Are we sure the underlying functions actually log these errors?
>
> Looking at devm_request_irq(), devm_snd_soc_register_component(), and
> mxs_pcm_platform_register(), they do not appear to print error messages when
> they fail, except in very specific edge cases.
>
> While the driver core will log a generic failure code on probe exit, does
> removing these specific error logs cause the driver to fail silently at these
> initialization steps, making it difficult to debug which step failed?
>

I checked all error paths in the called functions, and they already
report the corresponding errors,
either directly or deeper in the call chain.
Therefore, removing the additional dev_err() calls does not make these
failures silent.

> [Severity: High]
> This is a pre-existing issue, but does returning here leave a dangling pointer
> in the global mxs_saif array?
>
> Earlier in mxs_saif_probe(), the newly allocated saif context is stored
> globally:
>
> mxs_saif_probe()
>     mxs_saif[saif->id] = saif;
>
> If the probe function fails here, or if the driver is manually unbound via
> sysfs, devres will automatically free the saif structure. However, the driver
> never clears mxs_saif[saif->id].
>
> If a user is actively playing audio and the driver is unbound, the ALSA core
> unregisters the component but keeps the PCM file descriptor open. When the
> stream is subsequently closed, the machine driver's hw_free callback invokes
> mxs_saif_put_mclk(), which will dereference the freed mxs_saif pointer.
>
> >
> >       platform_set_drvdata(pdev, saif);
> >
> > @@ -857,16 +855,12 @@ static int mxs_saif_probe(struct platform_device *pdev)
> >
> >       ret = devm_snd_soc_register_component(&pdev->dev, &mxs_saif_component,
> >                                             &mxs_saif_dai, 1);
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "register DAI failed\n");
> > +     if (ret)
> >               return ret;
>
> [Severity: High]
> This is also a pre-existing issue, but does returning here cause a
> use-after-unmap panic if the clock divider was initialized?
>
> When mxs_saif_probe() calls mxs_saif_mclk_init() for saif0, it registers a
> clock divider and an OF clock provider. These are not devm-managed and require
> explicit unregistration.
>
> The registered clock divider is passed a register pointer mapped via devres:
>
> mxs_saif_mclk_init()
>     clk = clk_register_divider(..., saif->base + SAIF_CTRL, ...);
>
> If devm_snd_soc_register_component() fails and we return directly, devres
> will automatically unmap saif->base.
>
> Because the clock framework objects are never unregistered, they remain in the
> system. Any subsequent access to this clock, such as reading debugfs or a
> machine driver interacting with the clock, will dereference the now-unmapped
> register pointer and cause a synchronous external abort.
>
> >
> >       ret = mxs_pcm_platform_register(&pdev->dev);
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "register PCM failed: %d\n", ret);
> > +     if (ret)
> >               return ret;
> > -     }
> >
> >       return 0;
> >  }
>

I confirmed that both issues are pre-existing and are not introduced
by this patch.
They are unrelated to the error-message cleanup in this series.
