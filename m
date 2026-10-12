Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE38F4B95C5
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824522; cv=none; b=qbWhdNhVWHr1k7b0TgvDlCtdlwvP91OaAVI02FxG/HeCpkeeIRo2T3pODgOgm7jH53/FVU7SsxrMnwKPZvbJLF+d5oEj+AtKSuSOGC/voeB3Mf0/wOsFNxWXaAJXRxvqoVen3FBEbbUEMPP35fTJkX8hPA6KLd6LAHNgIxdu+OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824522; c=relaxed/simple;
	bh=pc5hKW3Rl+BujC0Y21fvHrisrTvPnKUkQmx9hxWwQ3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfjeclmRGqyPVrXOWAAwnY8Mcc+FUto4uioOhH2hANwc8VQdQ6fAD4rb4PK+uxCKm6ApnKvLyqEv261sVIs9xeVmmACJDqMBiyIpRg2YBB3X0cNf0kn2ZtRSQCGDbVgrudngDo20R9GDGYkb7vS6/bXfMCnv1rjoIwjDH15ydcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JciUZQGO; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JciUZQGO"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5337fb43c16so23773001cf.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791824509; x=1792429309; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3wiTGTDliud7Ln/IFjDUiuTj441xbuhKgaztxNYZhg=;
        b=JciUZQGOlRucoWqnS5nzapAYHiI+X8+VkqSECLAwIlgKqWI//yHC9ejdZKEliTK/av
         kF7XgGR1E66iOz+CaeAbWmuATGLyxd7SoPLfz94l8ob6doMuBGArVYsqmggwGJ/UZ+Ov
         vu12ZYca47EY57x4gyiD/nDTDfMXBsFlRFX3aJAc140tJ7HbuC2SX/DlkAbvOFe4KOIF
         8cWT2kFYQTOmKDuK4JfM9lAYLYcaleJaKfZnr/lcfsIlXUu1ebzxzbZIjnr0/M0V/lFZ
         fzD09yU2BxKQbLNOgx1GFJAAgtj4zTVKDSLCILIyOeNJcqVRAWskVsdsnG0oXpAsNF+f
         ZRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824509; x=1792429309;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3wiTGTDliud7Ln/IFjDUiuTj441xbuhKgaztxNYZhg=;
        b=SH6JEjqk3oXaj+nsN7wauccqIsLJf0tJSvBKvFhddxK9OU4E2/+Jl0QhwQWDdgpaTf
         eBYTNCtKyg4FeKXQq1wNrsJzTPL7itl5lJhNPGTVhpSitmyI5+zBLvtb/KMo9R0mKe2Y
         H6FZBQRL/3o8AQp4c0Wwor4rLy+Sj56NaHglpiKwVT+GjcjMrHCIsyypJGu8OXL8qDEa
         UmEh3nNPVLGsGOTgUDGuh16DcGT1eVonrrDV4sDDbUM+zTlbBQx0QDhVL+W3GjnBOWSR
         YXokMHdo2kWlKZSlY3cDvV1Y8bldeRJ/CM37GfrGW93m+yqy7MC/cBZcV7CZBTF+6dSE
         zMiQ==
X-Gm-Message-State: AFq9FYJ2OI/KLInI4Tpuw605/SBb2CbigX3fAdZPL88RyjbmCXOvMnX5
	bDEScIl98DNxhRblNnJ0E1UGcRNanm9HOvBUqjpVOOvCu6iMh9NXoHOr6KcPx39s93y+ql4rbCK
	zvYECElE=
X-Gm-Gg: AYBFou2UQYCoC8rsgXEg11DwXJNslMDSVOZhawkc1MeoPubuY7q1n0eazW5pAdrIrwA
	w4D8XW1Luar3RfeIyB9jjYqbhrXysAb324sDCk8+qhFXngzBQo7alUIQW+GMjZA+bFM50ecw2Dq
	j3bakyfPQBS+H1l1PduNVIrV4Pqyf33QMDApFaOL44ZxtQyBFDvEd2wG9wsgSUR0dhB0d0Kkltk
	LUdmTZJkdt8WdFcQFOH+9R8wlw0FHYEdSVGtihUoECogMoDr7mXs/OfS7tr24zOOl9k5r3hwTwC
	ZvTNXpliZka3m3ka8BZwnrN/aCSIeKPfh/qaGE0b/wUwxoKSzfGmJvsvNLv/gibkbYv//3WlK9w
	5jUPg6yVg8uwWWSKtu0iV84m6hW84x5SFq/jdlKFR34A/KjHmxL4DKUNGIChTRGy4KxDyXLnHP8
	zh/dPtMXj21xiRJXBJ0bh57u8OwoHBZFUaYlCBh5RhkwNSKnRlCg+2drH4HHP0DzmaG/uJ/YKB
X-Received: by 2002:ac8:5e4c:0:b0:535:1111:d00c with SMTP id d75a77b69052e-5359f06784bmr179957871cf.0.1791824509473;
        Mon, 12 Oct 2026 10:01:49 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b79a2easm81681521cf.21.2026.10.12.10.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:01:49 -0700 (PDT)
Message-ID: <ecab492b-dfe6-4f45-8474-cc710cfe3dff@riscstar.com>
Date: Mon, 12 Oct 2026 12:01:48 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] reset: toshiba: introduce a TC9564 SoC reset driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-3-elder@riscstar.com>
 <sashiko-outbox-168439@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-168439@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 11:54 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] reset: tc9564: hardware state initialized after reset controller registration
> - [High] reset: tc9564: active consumers forcibly reset during driver removal
> --
> 
> commit 504236856b96e78b9064b4d58c3ef7ba166341e3
> Author: Alex Elder <elder@riscstar.com>
> 
> reset: toshiba: introduce a TC9564 SoC reset driver
> 
> Defines a new platform driver that manages reset signals implemented by the
> Toshiba TC9564 SoC. The state of the resets is controlled via MMIO to a
> region managed by a system controller.
> 
>> diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
>> new file mode 100644
>> index 0000000000000..0243c2e0efd54
>> --- /dev/null
>> +++ b/drivers/reset/reset-tc9564.c
> 
> [ ... ]
> 
>> +static int tc9564_reset_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct tc9564_resets *resets;
>> +
>> +	if (!dev_of_node(dev))
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	resets = tc9564_reset_init(dev);
>> +	if (IS_ERR(resets))
>> +		return dev_err_probe(dev, PTR_ERR(resets),
>> +				     "failed to initialize resets\n");
>> +
>> +	/* Force all resets to be initially asserted */
>> +	tc9564_reset_assert_all(resets);
> 
> [Severity: High]
> Does this cause a race condition with consumer drivers?

I hadn't thought of that, but yes, this is a good point.
We would like to ensure this is the initial state, but I will
rework this so that all defined resets will be asserted
initially by "directly" writing registers through the regmap,
rather than doing so using the reset API.

> 
> tc9564_reset_init() globally registers the reset controller via
> devm_reset_controller_register(). Once registered, consumers can
> immediately probe and deassert their reset lines.
> 
> If a consumer driver deasserts its reset right after registration,
> will this subsequent call to tc9564_reset_assert_all() overwrite the
> consumer's hardware state and unexpectedly yank running hardware back
> into reset?
> 
>> +
>> +	platform_set_drvdata(pdev, resets);
>> +
>> +	return 0;
>> +}
>> +
>> +static void tc9564_reset_remove(struct platform_device *pdev)
>> +{
>> +	struct tc9564_resets *resets = platform_get_drvdata(pdev);
>> +
>> +	/* Leave all resets asserted when done */
>> +	tc9564_reset_assert_all(resets);
> 
> [Severity: High]
> Does this unexpectedly assert resets for active consumers?

I suppose that's possible, and it's easy enough to simply
omit this remove callback (and the assert-all call).

I will adjust this for version 2.

					-Alex

> 
> Since the reset controller is registered using devm_reset_controller_register(),
> the devres subsystem will unregister the controller only after this remove
> callback completes.
> 
> This means the controller is still active and consumers might be actively
> using their deasserted reset lines when tc9564_reset_assert_all() is called
> here. Should the driver coordinate with consumers or unregister itself first
> before forcing all lines into reset?
> 
> [ ... ]
> 

