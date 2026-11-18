Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967142;
	b=ayI8QvG8ChvDE+5+5Is/WtbKZsdix/NjX4IOLXKJnvfbHW7rg9B3OjkTebqzrqwyCwz3
	 M4fHbcY7aQZo8NaFxlMx0srQhRE2JEz7yrZg9Fo8jumjandRHRBDBFzQ0gD82VvKDdAHf
	 9/Qan5Q9PeObGxT80k2McfhSrUKmTxpFNoRHDe889BoxGBVdDnrTCL0qG0fkl1YXS26CF
	 hU7t+RVDGiTrjcX+6Klj1mqqnMsvSJ6Wm6TAUUI+HcMvYiNLLXxFCfYsJL0C9JUAsFMoy
	 98LPeqkLJuLsknUYwxaFYOknph07L4A0Dt0R8TMfqStyYxuh5vZqdeod5zN4wW1NwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967142;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=JbWj7V+WYn03t9ojEdDCCtvzFn76utYN3dGiNY3ikLA=;
	b=F4z/mPrnWzm4kc4+RIUYr3iH3HDKQzP9We/DBx2/6FeXlLNOmsNoClyVjRS6RYlsFkZZ
	 4cb5Uc4ZmqwVUKRuXObW02FUmeFPgvUF8x84GiBtljbgupqHPESdnH2tblRbZhnbtaczO
	 eDCUhhiM89lW5FTD0Cvw8Bb72ulwS01PXX4hQIGG2g+Mma2plwVD/CDIXLfXRqajqe5i9
	 Bnv5YM35PoIHp5gOggwlmEqOnm510XLEbLofVYOctO2S+kYjSAAwOyrryb0EUz0cexxuR
	 4sn2T0g7aYl+x7hY4bbzWifut1DNNNmBdX45wab0tMdFOebs2QovSiHc3O501LP8KEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mke4CiG1;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2B5606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 01:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mke4CiG1
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id TOqdxXSLpVK9UTUwvxDvA9; Wed, 18 Nov 2026 01:59:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TUwuxrsa5FhzrTUwuxTG4G; Wed, 18 Nov 2026 01:59:00 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6afd0664
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=R5C9hjxsAAAA:8 a=su42KvmBEUejEUdiYk4A:9 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=JbWj7V+WYn03t9ojEdDCCtvzFn76utYN3dGiNY3ikLA=; b=mke4CiG1idCL
	bMGNe7Idfoc6nhqua178zP6VT3nQCjPaINyrOceclKkN+6mSch8LT3Sf7gnQqwu4osXtZASygEL5O
	wrUVwbf6+/C2Bu5DEMmDOyJpbE2W6YVgQOqMQsaxGk7Iv1f6yzrCoc1YpMlBXa1sOB483fQcacMj3
	qxYbH7CyKi7nzofqWXATo6rjz0H77Ax3vdq5Fv+dlTq29RJt9w/LPJV0KxzkmWi+1KIWgxetOJ9s6
	tZqmsogG7lZaQhgTe0t8zGJf+RvcO4Br66lapSOT13P8KR2gzsihPZhNnXjVgFMianIVHU/CJZr/s
	EBfEQkHoJeBpDve/uF4eWA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60858)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTUwu-00000003ANk-0UnL;
	Wed, 18 Nov 2026 07:29:00 +0530
Message-ID: <91e6484b-f5a2-44fa-bad2-f5410ea1f2a5@roeck-us.net>
Date: Tue, 17 Nov 2026 17:58:59 -0800
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
Subject: Re: [PATCH] watchdog: renesas_wdt: avoid sleeping clock calls in
 restart handler
To: sashiko-reviews@lists.linux.dev, Luo Yifan
 <luoyifan@cmss.chinamobile.com>, linux-watchdog@vger.kernel.org
References: <20261117020530.19973-1-luoyifan@cmss.chinamobile.com>
 <sashiko-outbox-218083@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-218083@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTUwu-00000003ANk-0UnL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:60858
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfF5UwC5KrsgFAOPl7a6VCz2/2pSehRkY4wkp1SSorVHINRzAoOtPUEEJng7LfOgMHclIAVxBVjlkX++ww3zWKQ+TBM03t33pPWV+GvDejaVq1l3NxwDv
 FWwe4nJN2OCYnGBt7Azh77CLoD4qa8RJ6CVpYaTAWmkYjP7c7Rd8psgsGbDTS+aDteBwgrrHfDeB/JddH3QIOwY/R/D8OuvtipGu6gUsOH4sQlnLzmDGcxfp

On 11/16/26 18:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] watchdog: renesas_wdt: missing Fixes trailer for atomic sleep
>    fix
> - [Low] watchdog: renesas_wdt: use devm_clk_get_prepared() in
>    rwdt_probe()

Please address both.

Thanks,
Guenter

> --
> 
> commit 4ed48dd9a6e0be55587f40b05e00cb1b9e5da877
> Author: Luo Yifan <luoyifan@cmss.chinamobile.com>
> 
>> watchdog: renesas_wdt: avoid sleeping clock calls in restart handler
>>
>> rwdt_restart() runs in atomic context, as the comment above the function
>> points out, but it calls clk_prepare_enable().  clk_prepare() may sleep on
>> the clock mutex, which is not allowed from a restart handler.
>>
>> Prepare the clock once in the probe function and only call clk_enable()
>> from the restart handler.  clk_enable() does not sleep, so the restart
>> path stays atomic.  Unprepare the clock in the probe error path and in
>> rwdt_remove().
>>
>> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
> 
> [Severity: Low]
> Since this fixes the sleeping clk_prepare_enable() call in rwdt_restart(),
> should this include a Fixes tag?
> 
>    Fixes: fa01fa70039c ("watchdog: renesas_wdt: don't sleep in atomic context")
> 
>> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
>> index d9760f2a3b235..9630d05686461 100644
>> --- a/drivers/watchdog/renesas_wdt.c
>> +++ b/drivers/watchdog/renesas_wdt.c
> 
> [ ... ]
> 
>> @@ -233,6 +233,14 @@ static int rwdt_probe(struct platform_device *pdev)
>>   	if (IS_ERR(priv->clk))
>>   		return PTR_ERR(priv->clk);
>>   
>> +	/*
>> +	 * The restart handler runs in atomic context and can only enable the
>> +	 * clock, so prepare it here.
>> +	 */
>> +	ret = clk_prepare(priv->clk);
>> +	if (ret)
>> +		return ret;
>> +
>>   	pm_runtime_enable(dev);
>>   	pm_runtime_get_sync(dev);
>>   	priv->clk_rate = clk_get_rate(priv->clk);
>> @@ -290,6 +298,7 @@ static int rwdt_probe(struct platform_device *pdev)
>>   
>>    out_pm_disable:
>>   	pm_runtime_disable(dev);
>> +	clk_unprepare(priv->clk);
>>   	return ret;
>>   }
>>   
>> @@ -299,6 +308,7 @@ static void rwdt_remove(struct platform_device *pdev)
>>   
>>   	watchdog_unregister_device(&priv->wdev);
>>   	pm_runtime_disable(&pdev->dev);
>> +	clk_unprepare(priv->clk);
>>   }
> 
> [Severity: Low]
> This isn't a bug, but could rwdt_probe() use devm_clk_get_prepared() instead
> of devm_clk_get()?  That would prepare priv->clk on acquisition and
> automatically unprepare it on probe failure or after rwdt_remove(), avoiding
> the manual clk_prepare() and clk_unprepare() calls.
> 

