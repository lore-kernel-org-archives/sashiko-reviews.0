Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827336;
	b=Oya1OKLpKBE3y8R17gQS3Fbz6UZtrQ6DcDgiK7+POrMx1TOM4eHY30qZmMIH4vWJi88V
	 m1J1rVuaP183TUmsbzs+b26wQKdf9c/kpioZYzsb0NtpkRXlHLOcm3z5HCPgVZKT9K14u
	 emz3Yl3bFxhhPMVo87suX65t8c4CNZ1IwLe57u5uDCdkknsx+5kuCj5zbVlOQPDepOd0p
	 T6AxkcfmrJvLPAhytXUsThcZg2C5TlTCqjUFQnUI+2ZvsSy5t4D8USos8NRElLbA1WAe+
	 9vMX208delqjZBYBTMl8Sjm3zmis+OP1vBhtJsJcwNhp6BQbriFwmlVduIzQSVH3SYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+5/lrUfYBVKtk8LFUOYPI+i/daG7iBFygT1vkGG8Etw=;
	b=IGGm5SJYivxv44619mZL4dKrXkY9ypp51TQFJxbsK7h6zlRAdXFmm+bZeVHWhHn1nwPn
	 srvNueEP2eG8u4oF+UBpMDwSZdQ2snxAVK6Femw4m/Ka3yO96ttBnrv/Hb24hREceJPv/
	 70/0jf5lpEYv0GjmnbF+yNoK5GdDYzvISjKOgU0uhcGc3+iRQuDQkWmQFGVV/h4hPtcWH
	 wLelPfCwkQQapviG76EWCjjWNYRp/zxMVb5YCxaRf7fZXcUQNJTRi1mQDvRHdRApXUDlj
	 iOdqIKVM6fiSzTN4ZP8ZDlNB1mzLbVRBx9gdVz6FoN1eCUK7LyEKrTFCAlnBUqrykaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KghzofU2;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E1606B2FB
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 21:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729E1606B2FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KghzofU2
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso582406fac.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 13:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793827335; x=1794432135; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5/lrUfYBVKtk8LFUOYPI+i/daG7iBFygT1vkGG8Etw=;
        b=KghzofU2jvQwQJykRoYzltbWP3DQ2KyhcjeVVc6TI0gIJLOjl5Wc6qZ0Zz6oMQ7f+F
         rROqOROV9HAtGRZKNeIlB6vcQT2KsA8wRrcuOnvpistdJLPq5uBLYqStge3IjhcJCeJJ
         hUxWyTs5bdzZIrqmuFxjglhjCXA0N1+6R1kp5vH5ciZhr+fnyvK6/g75SGZrcD08VmII
         6+X3EjprI3TY7bjdHJ523CDFygZ+Gja7gHek9wIWKPGJs6Hh1Jik3L4bnwa5plbkQyUy
         5uSDg+ZGt8tXR+ONvKXzlt1HA/ykqjn7XVgQjn8ciiPmWvRMzDSkH+ousH1ualmTtMYC
         rr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827335; x=1794432135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5/lrUfYBVKtk8LFUOYPI+i/daG7iBFygT1vkGG8Etw=;
        b=2waQpi0HxCvixrOEr2VQUOz/2gtvZ1NgyB61mugJ5cpJrRtR4ePk3eKwPi9LpEfpP8
         Tt1GsCh4/v0C+e7e6YDj3pz47KLLBZveHd6ZvZEVLqsaZNHmAZhqIa5I7/1hlXLMl4c1
         Wh8jwQQZCug9qfqcD2XLTdKXrYOOd5uGPgwJA5RGTwQ1kX7nyL2xQnzOWxwQcJlr1iYU
         9L8coEToee1yhSjsLGqMupiPCOWMTFy1wyq6pUpcbPYTeg1Y1AtGQUxvJoR2bVB2yomF
         LjhjjtBrwB9ayMoGHt0ALTH+SrNhpKugOgHeu+Ayu6lmVolYWgkKbP3suErFwRLVQofq
         UYcg==
X-Gm-Message-State: APuU4Z8i8kA0+npqqzHJ4T8h6wt2+20UBIMCoAahYJJ3AecaqcEqvQuk
	HWv0Rj9upBXLd8B49SETBjoe/MsRbPeaksrBifiG/80lCuQE40reHIM9blsDjLGvCj/4hLbkzrH
	26qS/Pok=
X-Gm-Gg: AYBFou1VprPz61RwJy8HCrzwRX7iB0v80z2KCjvhLqHyyRGJRB/BdNqUetOOa5kUNBK
	RNLqsdhdgdPETgagoQ9BFWqAZZi7ROAhZJLbKASNRH4IPoKY4IksA4yPr4aTKobfnFZKcRHT/a0
	7rDpmzFOJQ1+K8U0Vl4j5LRFhSnvBxsVnZ8RECjp4SUq15OaL9LPZi4KpuiJku4UDM4GIiBQVYb
	WOwT0Fluw3lsI1EU79KgT6yf+Mzf4rHQPqzV3lkfWnIFHgfdOMyMpUGO/LVmk+Hg/hFfrF4nfRb
	/HmsTWB5xtD5ORDWbPsqRWk4vBiWmqaieeIJi8UfPFSWI/VB61TvM5RCJ/5UZqP0d/b4/7fZnlj
	cITxIg7gBH/FC7vy+i3MY8znLOy4FXiTuVmFUPqnDkgoe28nOPsrGlC6JFwvunOXNQ+XgT0UsNB
	NRWvLj/SVXian/U2PUR3h5OwY6p31fA83SxfeaeHt/maQBfnNzDwrt8trZAmDokC6EdAmP4mO4k
	gwaCJPVTdlPkexY3s8dfHTv7fwr9eGyOdk2Pxq7ANBmP3JpZjLPiK9Xc9fI0b3tG3QaCXK1G228
	ulSSD45jOABPLq7707HjODWXdrsu
X-Received: by 2002:a05:6870:899d:b0:4a7:6dc:af65 with SMTP id 586e51a60fabf-4a90761c954mr10824894fac.10.1793827335301;
        Wed, 04 Nov 2026 13:22:15 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61d382sm2928188fac.13.2026.11.04.13.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:22:15 -0800 (PST)
Message-ID: <de25cd14-dc54-41e8-a49d-d3da588bb0d2@riscstar.com>
Date: Wed, 4 Nov 2026 15:22:14 -0600
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-4-elder@riscstar.com>
 <sashiko-outbox-196325@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-196325@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 6:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] clk: tc9564: duplicate clock names across chips due to using dev->id

I will address this issue by ensuring the name gets formatted using
the TC9564 instance number, to ensure the names are unique.

Separately, I'll use PLATFORM_DEVID_NONE rather than PLATFORM_DEVID_AUTO
when adding MFD devices.  There is only clock and one reset per TC9564
instance.

> - [High] clk: tc9564: uninitialized clk_data->num in tc9564_clk_probe()

I didn't realize I couldn't count on devm_kzalloc_flex() to assign
the flex array counter in a structure.  I will fix this.

> --
> 
> commit d0d52063b982041aca91451199195cd79995784b
> Author: Alex Elder <elder@riscstar.com>
> 
> clk: toshiba: introduce a TC9564 SoC clock driver
> 
> This commit adds a platform clock driver for the Toshiba TC9564 SoC,
> registering its PLL, fixed-factor, and gate clocks via a syscon regmap.
> 
>> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
>> new file mode 100644
>> index 0000000000000..8eeba85919703
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
>> @@ -0,0 +1,288 @@
> 
> [ ... ]
> 
>> +/*
>> + * The full name of every clock has a prefix "tc9564" followed by a single
>> + * character ('a', 'b', etc.) that differs for each chip/device number.
>> + * Each clock's "name" defines the unique portion of the clock's full name.
>> + */
>> +#define FULL_NAME_SIZE	24	/* Enough for formatted full name */
>> +#define NAME_SIZE	12	/* Unique portion of the clock name */
>> +#define FORMAT_FULL_NAME(_full_name, _id, _name)		\
>> +	snprintf(_full_name, FULL_NAME_SIZE, "tc9564%c_%.*s",	\
>> +		'a' + (_id), NAME_SIZE, _name)
> 
> [ ... ]
> 
>> +/* Parent is the input oscillator running at 25 MHz; PLL runs at 1250 MHz */
>> +static struct clk_hw *pll_register(struct device *dev,
>> +				   const struct clock_init *init)
>> +{
>> +	char full_name[FULL_NAME_SIZE];
>> +
>> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
>> +
>> +	return devm_clk_hw_register_fixed_factor_index(dev, full_name, 0, 0,
>> +						       init->mult, 1);
>> +}
>> +
>> +/* The PLL is the parent of all fixed clocks */
>> +static struct clk_hw *fixed_register(struct device *dev,
>> +				     const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	char full_name[FULL_NAME_SIZE];
>> +	struct clk_hw *pll_hw;
>> +
>> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
> 
> [ ... ]
> 
>> +static struct clk_hw *gate_register(struct device *dev,
>> +				    const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	struct clk_init_data clk_init = { };
>> +	const struct clk_hw *parent_hw;
>> +	char full_name[FULL_NAME_SIZE];
>> +	struct gate_clock *clock;
>> +	int ret;
>> +
>> +	clock = devm_kzalloc_obj(dev, *clock);
>> +	if (!clock)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
> 
> [Severity: High]
> Will passing dev->id to FORMAT_FULL_NAME() in pll_register(),
> fixed_register(), and gate_register() cause clock registration to fail with
> -EEXIST when more than one TC9564 device is present?

Maybe.  I have no machine (yet) with which to check this.

> The clock MFD cell is registered as a platform device in
> tc9564_config_syscon_probe():
> 
> drivers/soc/toshiba/tc9564-syscon.c:tc9564_config_syscon_probe() {
> 	...
> 	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> 				    tc9564_config_syscon_cells,
> 				    ARRAY_SIZE(tc9564_config_syscon_cells),
> 				    NULL, 0, NULL);
> }
> 
> For platform devices, the platform bus stores the instance ID in pdev->id
> (struct platform_device::id), while dev->id (struct device::id) is never set
> and remains 0 for every instance. As a result, every TC9564 device formats
> its clocks with the "tc9564a_" prefix (such as "tc9564a_PLL"), so probing a
> second TC9564 device collides in __clk_core_init() when registering its
> clocks in the global clock namespace.

OK this is something I hadn't taken into account.

My intention is clear, but the code seems not to be doing what I want.
What I really want is for the "a" in "tc9564a_" to correspond to the 
TC9564 instance number (basically 0 or 1, though some future system
could have more).

I will investigate this further and will find a solution that
generates the names in the way I intend.

> 
> Note that pdev->id cannot be passed directly to 'a' + (_id) either, because
> PLATFORM_DEVID_AUTO allocates IDs from the system-wide platform_devid_ida
> shared across all auto-numbered platform devices rather than a 0-based
> per-chip index.

This actually highlights a different thing that I plan to change in
the next version.  I think PLATFORM_DEVID_NONE should be used rather
than PLATFORM_ID_AUTO when adding the MFD devices, because there is
exactly one instance of the clock and one instance of the reset for
each TC9564 chip.

And based on my plan to have the "a" represent TC9564 instance 0
and "b" represent TC9564 instance 1, the (correct) statement from
Sashiko about it being wrong to use pdev->id this way will be moot.
>> +
>> +	parent_hw = tc9564_clock->clk_data->hws[init->parent];
>> +
>> +	clk_init.name = full_name;
>> +	clk_init.ops = &gate_clk_ops;
>> +	clk_init.parent_hws = &parent_hw;
>> +	clk_init.num_parents = 1;
>> +
>> +	clock->hw.init = &clk_init;
>> +	clock->init = init;
>> +
>> +	ret = devm_clk_hw_register(dev, &clock->hw);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return &clock->hw;
>> +}
>> +
>> +static int tc9564_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct tc9564_clock *tc9564_clock;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *parent_np;
>> +	int ret;
>> +
>> +	parent_np = dev_of_node(dev->parent);
>> +	if (!parent_np)
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	tc9564_clock = devm_kzalloc_obj(dev, *tc9564_clock);
>> +	if (!tc9564_clock)
>> +		return -ENOMEM;
>> +
>> +	/* Note: MMIO regmap (no error checking needed when used) */
>> +	tc9564_clock->regmap = device_node_to_regmap(parent_np);
>> +	if (IS_ERR(tc9564_clock->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(tc9564_clock->regmap),
>> +				     "failed to get config regmap\n");
>> +
>> +	clk_data = devm_kzalloc_flex(dev, *tc9564_clock->clk_data, hws,
>> +				     CLOCK_COUNT);
>> +	if (!clk_data)
>> +		return -ENOMEM;
>> +	tc9564_clock->clk_data = clk_data;
>> +
>> +	dev_set_drvdata(dev, tc9564_clock);
>> +
>> +	/* Initialize all the clocks */
>> +	for (u32 i = 0; i < clk_data->num; i++) {
> 
> [Severity: High]
> Does clk_data->num remain 0 in tc9564_clk_probe() when building with
> compilers that do not support __builtin_counted_by_ref?

I did not expect this particular feature to work differently on
different compilers.

> 
> devm_kzalloc_flex() populates the __counted_by counter via
> __set_flex_counter():
> 
> include/linux/compiler_types.h:
> #if __has_builtin(__builtin_counted_by_ref) && \
>      !defined(CONFIG_CC_HAS_BROKEN_COUNTED_BY_REF)
> #define __flex_counter(FAM)	__builtin_counted_by_ref(FAM)
> #else
> #define __flex_counter(FAM)	((void *)NULL)
> #endif
> 
> include/linux/overflow.h:
> #define __set_flex_counter(FAM, COUNT)				\
> ({								\
> 	*_Generic(__flex_counter(FAM),				\
> 		  void *:  &(size_t){ 0 },			\
> 		  default: __flex_counter(FAM)) = (COUNT);	\
> })
> 
> On compilers without a working __builtin_counted_by_ref (such as GCC < 15.1
> or Clang < 22.1), __set_flex_counter() writes COUNT into a temporary compound
> literal and leaves clk_data->num as 0. Without an explicit
> clk_data->num = CLOCK_COUNT assignment, the loop in tc9564_clk_probe()
> registers zero clocks and of_clk_hw_onecell_get() rejects all clock lookups
> with -EINVAL.
Given this report, I will assign the counted-by field after
allocation.

					-Alex
