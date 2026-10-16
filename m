Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F837755A
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161520; cv=none; b=H//AQL37wKigrbEUyWlD5NV8KGeRtnzei4hqDIuzPQYdI1rXXiVmVNrg57dLA3+tSL0ccfi00Qa/bNNgwlnRE8aSkrGvaHaKc2x0zvFWhjTgYPHpRWyVKSnAM2SDIWMqsGGtecKdwu+zdhEPH/QyzJAuSgl0TxA++cz7UYsfIqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161520; c=relaxed/simple;
	bh=GDbfc0JsVwB1zy312BMJhVLKVeaYlNidq7KK49cPZ+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYOcJ/kk9WIYKezkImeyqzFHREkMaJit2KI09ojkWaU1+1SmJF6lgWsR8B3ckUUbGWa2HrUqnbNniCXcmJWkYLXyuP8TAcIeblplVCNsJUDuX4z0ojRIY+sNY87KbGgvzhw5M5GcwbBPUCbAd7XG93n8TUQAGZxZrhqikTWFoJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVq0Ebln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvEcN4yY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVq0Ebln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvEcN4yY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5qBA3577670
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 14:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ztfvnojqPEHnGsl4PC1ivpof
	ohidHZm5O2Ka8reFQ6g=; b=TVq0EblnjkCP10fgtSSxsjOZYVKq8FAs38hsJ+2+
	9jT61T0oL3nEppwlU4s6xSEm2uaYgBExPT2TUVTaNfKnxDDCFHzMJpg7LZFaHIlM
	KOyDJWECSdMlIDelraj7o3hyIjnFeBVWd5UNzSEbS2zP6GYQDRaliuhGZclbTybx
	QAL4SIJDNE6HSZHFhAkIENSlPNf1yT5l7pT/Y8di2Lf6OcIknCk9gcESS6eE/L+L
	gff4iNoHKXqcV8Gw/AjXx3A2T6fG8v3vlhkjL2pGfIdvebjNcns3znD5wUV+C+L5
	NWsCnZ4S8japQMMXFR682+4ZrIo6/8d6O2vKMy2UDnrOyQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262rt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 14:38:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso997143137.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 07:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792161517; x=1792766317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ztfvnojqPEHnGsl4PC1ivpofohidHZm5O2Ka8reFQ6g=;
        b=kvEcN4yYq6FBvR9cln67/HfbTs9Npw6oUP7u9YkClFbO6EfhFkv9haKa7ocylkfMRA
         9Bo69OAqYU9HjrgM0GNztxMS4cC+n3PJqz+Ca6fGSiGBHHEm4Gm16JhipHNudZGqA9Gd
         Anwef+GH7Vy6dyRI/OQRAXHTwWQWuSG4okhtiHyXjGbjt9/MsjzpeyWoKHQOkazgXd+t
         x/Ib5rkdvjXMnxYwxgHSf/UJe7xuLTwiw8T09nFOzRIunJD0dRECgtDhMG9/H5SK0WQi
         blEqNOTJ0yxrekLkUCpsRrWIWSeHqUAxryOYmp+6UbjMzmQG0wBPOIVbUccoCHWIltYo
         M6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161517; x=1792766317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztfvnojqPEHnGsl4PC1ivpofohidHZm5O2Ka8reFQ6g=;
        b=tB/dA+8m8cEaBRRecDyaCHIqIOKhrQ5OWwuZyHI3FFmyNYrZRlIWAfs/Y/KL557xMP
         SWknnQZPWPrUiHAz9vhiNEGq0Ek9Z/Ls1Q7lYfsN1jy3Iwnh8IObKITRh88bsvgBTvN5
         IIfGctnVKck6vTI8xPRwpApJLcHNjiwscnLkLzwqCIM2SL9dY4jZf4BqTLhNSvqntJPw
         4natV3U1CGuAOViKcdjHhhAGx/sSUuYKzfY45BLZGyhYlTLz933cx3LZrhrWULtVxaBX
         UX7ru80MSUgeo9uPxDJCMbrZRQs+whkkiTNCXT+ITaD97CkIdDM8Jun8euQpbhmKP8ic
         p2Sw==
X-Gm-Message-State: AFq9FYINd0mKwS5VWxKroBISqA9/UXG9sq6NXEp8EvFbX49biB17dS1u
	g/RtpNzx4T9LeqpC3D3feKDCWpPy4/Pdx9682YUwEgXjiMXRixsh1H0Z8uzqqJXhyoYfAFWmekm
	09hJ1bn8H3V2ndA/IODozFJ08wELRMUzaC7P1W5rcVwwcWECVgNPNUXQNrOnGd9Csi757m8QBpk
	qg1i+r/w==
X-Gm-Gg: AYBFou2hmVEvzJHjQzK27CGBATjeDBxnsxawhH0tCn1PaNxGqmztRh1mE00xHw13HNI
	AuaQoUIxWAjDmGv8tYENZFZjojV+Q0ZERusSwkyRmlFFrwnI+JlqNR7UfFQthcMyNQ+L2TUtJZu
	WCLIlJ/XfB6z/92v3m0NxZyAFQo9S4aBIScvEfLBwm/yiY4QPrEqiSj8lD+vecUtz0UBLuORJIG
	BNZ5JkY/+fQx76M6tyB63qTuXLI3LRDhVPxyhGZlHKonqsyzxSiqjqNSrg8QMSIb7KTTKacIfoN
	tDoUhoJPLGNVrVplfNy7NXH4Vu0SMzmAeMLxfTbhCmTvoFoA/XR4/0ibi/WcqBMC8GUc7Cfku+8
	rVeuAC7/0DgCb8T0+fiJoqUwlldUeLwCoJPfXljEbXg==
X-Received: by 2002:a05:6102:41a0:b0:7cc:226a:f963 with SMTP id ada2fe7eead31-7cc226afcdfmr547092137.28.1792161517137;
        Fri, 16 Oct 2026 07:38:37 -0700 (PDT)
X-Received: by 2002:a05:6102:41a0:b0:7cc:226a:f963 with SMTP id ada2fe7eead31-7cc226afcdfmr547083137.28.1792161516555;
        Fri, 16 Oct 2026 07:38:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc198291e7sm2284762137.6.2026.10.16.07.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:38:36 -0700 (PDT)
Date: Fri, 16 Oct 2026 22:38:32 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: shared-proxy: Fix race between concurrent first
 users
Message-ID: <atI26KO4EHbz5tMD@QCOM-aGQu4IUr3Y>
References: <20261015122740.971792-1-shengchao.guo@oss.qualcomm.com>
 <sashiko-outbox-172816@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-172816@kernel.org>
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad236ee cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xkev24yWWnSjHgu6Ys4A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX5sDDlqIuP/jv
 ZTHKEqF/DudoFF1Sr5kvACvIuJj8j7pFsu4zLTRVASGvb11UFoSbK5gIa0WKVJfxanDC309VKHL
 JFKnSNi3iXptIEaoB3wV9FV2dDDXGvfzyUXx7uxouhJf74tD0Unh1p5z3qBZo3yuK3afpdJ+s8S
 N2MyBo8euAwzETwCAihn5D+HPn17sVMOgysiJA22QGIjmw/bcBc7wVstB+BPU3P1mEfgdYtydzM
 4ssnITcap4QzcOuaQVQqbi2KmreYqYZYinatFt5VAH99ZDoKVkOgKAQIWIwG7FulU7PWsvIz+2f
 zTF9EZpYUTzmdZY+gVnBBDb3mUZ73HE6HCl0KADhbFZ28aaYSbbQJ0S398m6rW3pXcai03O8UJu
 5uBdQmiiVvGoQVCYaz8ZROgwu4MJDmjRKRhBcnzowGi6DCec1RggFUZw3oBkmcDog5NyxHs4R2m
 eUXygLBoJIkY5Vk8q/A==
X-Proofpoint-ORIG-GUID: HPJKn64duBmiSVH4BOyfbE0MyvF-q_vu
X-Proofpoint-GUID: HPJKn64duBmiSVH4BOyfbE0MyvF-q_vu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX/Jj12/8BSd8Z
 EXwKOuDdwONPp1VtUfvE7Qz7MAZJ6Q35Y2yBxsf1eMPY793O2FQa+SpRz5vOSWoPWwp2puZ/Ovi
 HaLTKWq7IK5qH/hTWdCem8j3VovBnmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160058

On Thu, Oct 15, 2026 at 12:37:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] gpio: shared-proxy: integer underflow of votecnt on proxy free error path
> - [Low] gpio: shared-proxy: spurious warning and logic bypass in set_config
> --
> 
> commit 2a16d83da9ca16fcf3fc8f06a64d08bb431d1954
> Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> gpio: shared-proxy: Fix race between concurrent first users
> 
> This commit addresses a race condition where concurrent consumers
> requesting a shared proxy line could both observe the use count as 2
> before any configuration occurs, resulting in a failure. It resolves
> this by introducing a configuration counter and a per-proxy flag to
> track actual configuration changes rather than just requests.
> 
> > diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> > index bc69b8729d196..0d9ef98a4229e 100644
> > --- a/drivers/gpio/gpio-shared-proxy.c
> > +++ b/drivers/gpio/gpio-shared-proxy.c
> 
> [ ... ]
> 
> > @@ -117,6 +141,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
> >  
> >  	proxy->shared_desc->usecnt--;
> >  
> > +	if (proxy->configured) {
> > +		proxy->configured = false;
> > +		shared_desc->cfgcnt--;
> > +	}
> > +
> 
> [Severity: High]
> If the hardware write fails in the earlier gpio_shared_proxy_set_unlocked()
> call inside this function, proxy->voted_change remains true:
> 
> 	if (proxy->voted_change) {
> 		ret = gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
> 		if (ret)
> 			dev_err(proxy->dev, ...);
> 	}
> 
> When we unconditionally clear proxy->configured and decrement cfgcnt
> here despite the failure, can this allow a new proxy to bypass checks and
> reset the global votecnt to 0?
> 
> If cfgcnt drops to 0 and votecnt is reset, a later reuse of this proxy
> could see voted_change still set. If votecnt is 0 at that point,
> calling gpio_shared_proxy_set_unlocked() again could skip the hardware
> write but decrement votecnt, causing it to underflow to UINT_MAX.

Agreed, but it isn't introduced by this patch. Since the driver was
added, a failed write in gpio_shared_proxy_free() leaves the departing
proxy's vote in place, and the proxy data outlives the request, so
voted_change is still set on the next request. I'll fix it in a
separate patch in v2: free will drop the vote unconditionally after
reporting the failure, since the consumer is going away regardless.

> Could we ensure voted_change is cleared, or configured is not cleared
> if the write fails?
> 
> [ ... ]
> 
> > diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
> > index 618756f6c6aaf..ae10506b7029f 100644
> > --- a/drivers/gpio/gpiolib-shared.h
> > +++ b/drivers/gpio/gpiolib-shared.h
> > @@ -41,6 +41,7 @@ struct gpio_shared_desc {
> >  	struct gpio_desc *desc;
> >  	unsigned long cfg;
> >  	unsigned int usecnt;
> > +	unsigned int cfgcnt;
> >  	unsigned int votecnt;
> >  	int def_val;
> >  	struct mutex mutex; /* serializes all proxy operations on this descriptor */
> 
> [Severity: Low]
> Since concurrent probes are now tracked using cfgcnt rather than usecnt
> to determine if the line has been initialized, does
> gpio_shared_proxy_set_config() also need to be updated?
> 
> If two consumers concurrently request the line but haven't configured it,
> usecnt is 2. If one of them then calls gpio_shared_proxy_set_config(),
> it still checks usecnt > 1. This could cause a spurious conflict warning
> if the requested configuration differs from the uninitialized state, or it
> might bypass the hardware configuration entirely if they match, erroneously
> assuming another consumer already applied it.

Right, that is the same request-counting mistake this patch removes
from the direction callbacks. In practice the skip is hard to reach,
since cfg 0 packs to PIN_CONFIG_BIAS_BUS_HOLD with argument 0, which
gpiolib never requests. But concurrent first users still get the
spurious "users may conflict" message. v2 will switch set_config to
gpio_shared_proxy_may_init() as well.

Shawn
