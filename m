Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893742FCA7
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212026; cv=none; b=tQCG6oKXISDpKxydEZaHTsmvYwJf3s+t8cGPSzMFf0SaEWFqO0Lp2DEGo2vcJyKVZWHwKIiACn8eDQxfr0yuYoDVqwJEX59RnZ0cuSyKI3pqv5pj2QwxtahBk4vQd9Nd4FZ5va84zkxekQQaKpAIoU5FezNYhFcVRH58uiH/iMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212026; c=relaxed/simple;
	bh=GEYRtdVKJg3gQgx+1tH57F94eyYInzrfNCOIAu5Iak4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A3rSRYYppdO9JYCaqLs0YpvSmrqhx3ZVP+EPYZE3QNW+911uDrBbnp2e0E9Iblgd08hkjysjO2FohlycdBgpTX82t7B7YByDm4bMFIzxUo1SzfEblfPge16czejtLwVOIonm44sBUOkEOoW6Rzyi6aP3gFb42zfvE/GanpiPBEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Lk7otTPr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Lk7otTPr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49546c690ffso1720015e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 07:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784212021; x=1784816821; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lxE5XZQtOH+yq3837rq2MGs0Vy95QDtnOg1qhcM8VUw=;
        b=Lk7otTPrJJT90VAto5obx1PY7pqOoF2oYzf5rEiJoHavlIaytTjyiasW+FPUTuYvtq
         P0WqJWB5BKXoJ2v+E/MYwdQOtTM8kRXQierFI5Im0Wr29ev29983gqGx/aeNEm3flCYL
         kVPURU9fLaZSfide0jqk7BwjOmWZyHMhgm9eVIZGH1uqGSBdbXAdgzmgAO52jwDCowb/
         mKl6XboTBmvyV3uqSQpL4wI6NLmZ6tB1tN87sZaDzR7c8ii/Yo1GfePMzWf9/bed9zTd
         /oZjqEEdtpGIQwPR3YJyYNdYktOHY4dJQ33rjeMmYG4JQIykeisvUJ/vyxE0Mp+HgxOI
         K42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212021; x=1784816821;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lxE5XZQtOH+yq3837rq2MGs0Vy95QDtnOg1qhcM8VUw=;
        b=WwhgCu/tVFl3bw9mayI682lZrnMOM43YQRkr51nW7BePHL/cnrjAn7385WFcqlc882
         lXqE5FdAyGlV2q0TAGdwPIVAx52TSmxR10itS7+/L4OHSyvVjyTX18JnPR+wDUjS6n3I
         1uLLX1wiHxmdezBh/nkodWXq2/LOeqLlzAPBd032jmSXFVtqQU4btbcNoWymqQBLuBfH
         33kBSdvwLWrQri2oR0ETPMdpuMnr6Hrg0Zjx9isAFk9Bm6i2NtKzkmwv0Sdvrpq4My6S
         CjGphZdA5aoz0J/4IBUc+0v5aujlH7mmIxxeYqtmqA9q40DGjefEfcs89qUZ5dP+9Wax
         UT+w==
X-Forwarded-Encrypted: i=1; AHgh+RpwEm4WqqoLNkh9ZNHH4EqoezPnp8izIChm+elfgl3YrM6gtcN+JewsEVZU/mnEA0bQtogfE/vJDegzYPdlY5A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdjrFqHf4zccsUFYZ4NW4dANKTCydta+D9pJdQgHdHOMuRFM3I
	Fg1k98J6xgV3gpjdSl8V/suVugTdE6rBJ7t2k3Fha34ANmzYGfMroVlJPqAP6fFC29Xtu7xn4ly
	bT52v
X-Gm-Gg: AfdE7ckxz+nCqdqKbzzm+/5YQ5AAi9jucyYACF+vBTjE2R+QO13HnOVPCZFvg7Co58X
	ElEinBNAei46Ngt7qhv9WG8lM/KyxMXbo/HBYGnGAL1POYvOK0cRIQEXP4+fphu+dC3hrI8xskz
	LfAJnHDB/1+4nSBaS5Tt3TzTPwFvWqkyAm3fzy8bkZGpCwLnbyZm8/3A6fn5Je0xXChxIPn0RGz
	FtUy0LoC2QavwOsng9hK3/tr9yaDZ5cFN97TwUEUk2ctc6vDP/kVatApWvoaxtMQk6xXwIPASed
	0g5EpwypQoHujWprHtpQpqIZ78nq0fi5ASW+FIDVidRlguCKBDr8ltqKWnZpYKun8gSjk6gVSWA
	Oi9aO2iyk8Phv7wTwXQb5wbR02a37fmiZMZjwWwPN7Bh17lGYpSq4gDqlKMaBJKbvXKq67Nfo3L
	B/RBJt1v1k5f8=
X-Received: by 2002:a05:600d:6446:20b0:493:e034:a3b5 with SMTP id 5b1f17b1804b1-4953c27ab18mr65173875e9.24.1784212021209;
        Thu, 16 Jul 2026 07:27:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9758:7353:c342:aed3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c704bfasm134422995e9.2.2026.07.16.07.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:27:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: "Linmao Li" <lilinmao@kylinos.cn>,  sashiko-reviews@lists.linux.dev,
  linux-amlogic@lists.infradead.org,  neil.armstrong@linaro.org
Subject: Re: [PATCH] ASoC: meson: Keep link pointers valid on realloc failure
In-Reply-To: <20260716102544.8B7681F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 16 Jul 2026 10:25:44
	+0000")
References: <20260716100939.1381759-1-lilinmao@kylinos.cn>
	<20260716102544.8B7681F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 16 Jul 2026 16:26:58 +0200
Message-ID: <1jbjc7f1sd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 16 juil. 2026 at 10:25, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Unbinding the device causes a use-after-free because `meson_card_remove` frees `card->dai_link` manually before the devres callbacks unregister the card.
> --
>
> --- Patch [1]: [PATCH] ASoC: meson: Keep link pointers valid on realloc failure ---
> commit 677ad75f5fb5a578b984e744f26d24b961c89685
> Author: Linmao Li <lilinmao@kylinos.cn>
>
> ASoC: meson: Keep link pointers valid on realloc failure
>
> This commit fixes a potential use-after-free and double free in the error
> path of meson_card_reallocate_links(). It updates the card->dai_link
> pointer immediately after the first successful krealloc(), ensuring the
> cleanup path can safely free the memory if the second krealloc() fails.
>
>> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
>> index cdb759b466ad4..38c1b2ae227ff 100644
>> --- a/sound/soc/meson/meson-card-utils.c
>> +++ b/sound/soc/meson/meson-card-utils.c
>> @@ -52,19 +52,18 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>>  	if (!links)
>>  		goto err_links;
>>  
>> +	priv->card.dai_link = links;
>> +
>>  	ldata = krealloc(priv->link_data,
>>  			 num_links * sizeof(*priv->link_data),
>>  			 GFP_KERNEL | __GFP_ZERO);
>>  	if (!ldata)
>> -		goto err_ldata;
>> +		goto err_links;
>>  
>> -	priv->card.dai_link = links;
>>  	priv->link_data = ldata;
>>  	priv->card.num_links = num_links;
>>  	return 0;
>>  
>> -err_ldata:
>> -	kfree(links);
>>  err_links:
>>  	dev_err(priv->card.dev, "failed to allocate links\n");
>>  	return -ENOMEM;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does unbinding the device
> cause a use-after-free because meson_card_remove() frees card->dai_link
> manually before the devres callbacks unregister the card?
>
> When the driver is unbound, the driver core calls meson_card_remove(), which
> calls meson_card_clean_references() to free the links:
>
> sound/soc/meson/meson-card-utils.c:meson_card_clean_references() {
>     ...
>     kfree(card->dai_link);
>     ...
> }
>
> Only after .remove returns does the driver core run devres callbacks, which
> includes unregistering the card via devm_snd_soc_register_card's cleanup
> handler.
>
> The ASoC unregister path iterates over all PCM runtimes and dereferences
> rtd->dai_link, which points directly to elements of the already freed
> card->dai_link array.

Indeed. We need to move away from devres card registration to deregister
the card before freeing the rest in the ressource clean up. I'll do so
as soon as we have the v2 of this change.

-- 
Jerome
