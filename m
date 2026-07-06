Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F63FE35F
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341412; cv=none; b=RbiV6oPgQwmyPhVKdimwXqy4bqd/yPKTEvQ0kX8UK+ZCJCEUEjc9a/IfxtibucCkGq2e/OW0u8nxKxW/H6hK/mEUyLYxPkRJDVt5GXFpOddhRx0NNj+mx4PEowt6grMtRFNUKoeIh4RWtzK7r2sXKCRfMq7NVSKCTlad8W6m1rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341412; c=relaxed/simple;
	bh=rra+HC6UW8ngg1M+w7ntsNH71CV+8l9s2Aq1rHgxNRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pUx6s3ym2yIeAKPe/lF7p2EST7WprYLRum+UMk3NZaZwRqRXTjD9cF4WqwB51p1DPI8mFmW5gE/AUwk5VieDUIChAqS9R5BnoZVt6LtTlLQin4dbmwDyAEkV48qey6EJHFSND7+gJUXt+jmUqc0jR4OxJ4f8DcsjqEH+KEOz4Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GZAqEqqt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GZAqEqqt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so20478245e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783341404; x=1783946204; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3nillUBzOVKmupjRSjEGs6YGga/o/TlBfybdbWa9Q6w=;
        b=GZAqEqqtTRbNcXc4hMsTBcGHSVoaBAHe04MzeJ2Pzs4/XkTUwMC+oXU4SmU1h+W+sp
         YnT2TihDz01Wr4QUy5YvQ8cUfzByhltMHoF9YreWYsbj8BVzUs7aYOw44zefUU5MjISG
         xAaHWQnF6dzEXappOoBpvKjbhX3QME1gfjYaTuTSf6PljRYmAfFwiLIytQGWVR8RFyUX
         CNXQDjm6uyVuUUfTTZHB5mqVz5siQKlFLf6nubBUv6YwA5t2FiscLCKdFjztjkLwlpDK
         yJR8HCyo2bVjE/Dwm2PLlo8I3hhgwjCY9QpFHLGoug1ugoAMTdcQeD8vWCUsmGGziE0f
         SfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341404; x=1783946204;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3nillUBzOVKmupjRSjEGs6YGga/o/TlBfybdbWa9Q6w=;
        b=T33oTRv6+/ICUc2X7zopky8y6ewmGbjZoxyRWL+hvLGhpfZJUVTSdYGjT6iPLnDJnF
         wljUEitx+Yz6rPpnLCn5WuYe0V10nwXGTjJigL0K+z6+PP1H62YhvR0jMCcnzjQraLk4
         KKk8Iy4Xrt3BoIG2ff0jY/H89bJtVNz2wWdHe/25zKWEiqaeYG56tvdRJr/mJzVriWB0
         tPYU6zzBDWxBpyR7hha42aBsHv5648sYxC8JnZaUguwuWrhMIzxOcUC6dHbxbP4tYQBC
         o/Rgs8PmifRxypvQijV8PF9aokI5TWrMFbVVpXCFWfwGTPxvz/LCv19pn71mD/8DRXGO
         C4Lw==
X-Gm-Message-State: AOJu0Yycw1PQs3FDZjI3Utkc8p04p2du+m88KJhTZSyg7FU3MjW2YtmR
	0bPsRodxLlPIzfaV6bZG0+SUJ/mWqE8c8cb1j/30cwVTvtVwkuAYtCFaVojmfkSAt7g=
X-Gm-Gg: AfdE7cmMLyvz7ElNuza1Vx8yPj//bErtwf40ukMdk3GWoR6FBNE9gOeV+hpHioyfCgt
	MH6bbaBJoJXlyPnXXTGQXH3XjyBM7rqr5nQl6NC8SuJRfJfKeenFjkEeJh2MweZUxHbFziA+9CF
	oixuGyt6naWWzCQcpwd+THMm6ngB+R2mypaQWGIT3OA+ONUA2oqt8C1NIlEw7i/5fnBEekR86EM
	MBL9lFn+cuKHVWP4ITAShFnGq4Q7NdgkaWDQodgyBkL8kHRvOqPEfY+ioUqqSY6s5ALSUHqdmnu
	lj4UH2f+oRnTf5EUMWwcNUN5Apj2yLWzQ/cQ+/wC8fi6AgKCzll8q3D3QatITJNgOMVxJi1mDQV
	XzYZtoQawBv5wO/1ZOAm5gnweWIYsc73Wxq3vzyNNPjDWwfzdvLkuTOU1+YJwld4dOc2ugBbuHk
	5bhH8xTZ24kjM=
X-Received: by 2002:a05:600c:828e:b0:493:b6d5:72df with SMTP id 5b1f17b1804b1-493df090d47mr3392275e9.35.1783341404120;
        Mon, 06 Jul 2026 05:36:44 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c637bc21sm660820945e9.7.2026.07.06.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:36:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,  robh@kernel.org,
  linux-rtc@vger.kernel.org,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  devicetree@vger.kernel.org,
  linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 6/9] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <20260706100635.E5DC61F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 06 Jul 2026 10:06:35
	+0000")
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
	<20260706-a733-rtc-v4-6-f330728db3d3@baylibre.com>
	<20260706100635.E5DC61F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 06 Jul 2026 14:36:41 +0200
Message-ID: <1jv7asguqu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 06 juil. 2026 at 10:06, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Inconsistent rate calculation between `determine_rate` and `recalc_rate` due to division order.
> --
>
> commit 39f872462c04ad724c3624b152234160de56a47e
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> clk: sunxi-ng: div: add read-only operation support
>
> Add support for sunxi-ng read-only dividers. This will be
> useful to the a733 oscillator detection logic.
>
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
>> index 62d680ccb524b..d1c8c7baa12dc 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.c
>> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> [ ... ]
>> @@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
>>  					     req, ccu_div_determine_rate_helper, cd);
>>  }
>>  
>> +static int ccu_rodiv_determine_rate(struct clk_hw *hw,
>> +				    struct clk_rate_request *req)
>> +{
>> +	struct ccu_div *cd = hw_to_ccu_div(hw);
>> +	unsigned long val;
>> +	u32 reg;
>> +	int ret;
>> +
>> +	reg = readl(cd->common.base + cd->common.reg);
>> +	val = reg >> cd->div.shift;
>> +	val &= (1 << cd->div.width) - 1;
>> +
>> +	req->rate = ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
>> +						  req->rate);
>> +
>> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>> +		req->rate *= cd->fixed_post_div;
>> +
>> +	ret = divider_ro_determine_rate(hw, req, cd->div.table,
>> +					cd->div.width, cd->div.flags, val);
>> +
>> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>> +		req->rate /= cd->fixed_post_div;
>> +
>> +	req->rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
>> +						req->rate);
>
> [Severity: Medium]
> Will this division order cause inconsistent rate calculations compared to
> ccu_div_recalc_rate()?
>
> The divider_ro_determine_rate() helper applies DIV_ROUND_UP() to the unadjusted
> parent rate, and then this function divides that result by fixed_post_div and
> prediv.
>
> However, ccu_div_recalc_rate() applies prediv to the parent rate first, then
> calculates the divider rate, and finally divides by fixed_post_div.
>
> Since the Common Clock Framework requires determine_rate and recalc_rate to be
> mathematically consistent, could this discrepancy cause rate mismatches or
> warnings for clocks using a pre-divider or fixed post-divider?

I think the RO side is correct and RW one is not.

The RO part correctly walk back the tree by un-applying the predivider
so, whatever CCF does with the parent rate value will be correct.

The RW part query the parent rate then applies the prediv. This
will be thrown away when/if clk_divider_bestdiv() calls
clk_hw_round_rate() on the parent. If that happens, the subsequent
un-apply of the prediv would make the matter even worse. So (if I
understand all this correctly) this case does not happen yet, otherwise
we would have noticed, and it can be fixed separately.

Side Note: I've not followed the sunxi history behind all those
prediv/postdiv but I find them a bit confusing. It seems like inserting
some fixed factor clocks in the clock trees would accomplish the same
thing while simplifying mux/divider quite a lot by droping these quirks ?

Side Note #2: I feel that while sashiko is pointing out valid things but we
are slowly getting off topic and down the rabbit hole with it ...

>
>> +
>> +	return ret;
>> +}
>> +

-- 
Jerome
