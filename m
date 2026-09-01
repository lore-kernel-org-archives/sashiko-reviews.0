Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6022C1584
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268573; cv=none; b=iZbPL7oq2CakdeAa5gdHH+FO6Snj4pf4LpAzwYLGvqmxzZpP3ZHQkX/UC8tRhmoTfgDxadZpChKVxO+Ok+pk07NWAqcrzxkXriox0l1BXeuMfXgVCXqLpX4zzVG69twUuvx9NY1e2n0KdgaN/aWyFb17IIoY2nSnVSgw/CG/MA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268573; c=relaxed/simple;
	bh=mEjn5pPSM/W2HEBBhXpBLyjKABAKiVFnCfKziJ+ZvCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FEVEO0jbOBU+DXeSrcOeTfeXyRMoEQSY06EKbaXTIEQmJkYs1n8mqtXpY4TyD58lGvy2UZkW0MkIFncO/7VJvvvUWlbiTpe+z1NXkposiVr4Zg0ZhpPOCwjBeXhrlPKWX/Ocxqg0uGq7UXjUNSyy670VpOggMazD4dbeoo3fjYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ikg0HC5I; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ikg0HC5I"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso1769107e0c.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 06:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268570; x=1788873370; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CCIWMNHkezbHEse9cF0jmSTUVDzXod2VLsShBrj5brc=;
        b=Ikg0HC5Iq9RBEEoAAXpv88m8/Nj4G2aoocZqbDIqoeCRykh/r6j8c1bNzxCUmCePR5
         ot0mQH2CJBvRku6D75/cxXqGEbcL/VMcZ/XPv5+uuMKISwdxxmaQyjZWx+mPzH1zWR0D
         rlCGD5Ld+PpOibo+1JuerB/AVDJh0v+f6mv+CbH5jj50BAhNpXfUeNZMEfIyd2U2iD0L
         SquTfbTnb1Vw4yodk0fQo6EIOVWQUseZxUqQzkcjC8AFHJd4XGpNfVBUMlmlbKdqqTO3
         GKNfjZhMAqh5N77NCsYOEf6foJw7C/ERa/w7ZK0L4FOMtxih82Ie1eY9ziaUjqsUOHmz
         +dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268570; x=1788873370;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCIWMNHkezbHEse9cF0jmSTUVDzXod2VLsShBrj5brc=;
        b=ovRNLmvPSUVZ8mrO27u1MKX0Ei8d9BJUmHTwcvlw43/YryaR0jRP/zqUZ3OIPqduAF
         iDlE+Swro4OU4eR4lqex/TGmdKDN+B2e99akbFSAIlO31YC+d1RlLuQ0ic7cf5fXEI9d
         QjUKxGJooaEFZbHEYGeEgfIFtyk4t1vIsiXagc6R8C1NXAgsj8t8u79xWL/ccDAhW6Fk
         mgvHmaBQcvv5F2ZqNPXmFNsF3J+Gu7jT9/zEDmIOcJN50Bzsu0p0YO0lQCSmdUYSb7Z8
         TGw7FthZ+VF6+yOPRPG6JFjP8LIdVvN35VOsfsVHI9h2sFEJbdrAzx1UDYouJh5cLbvz
         rtNg==
X-Forwarded-Encrypted: i=1; AHgh+Rot1njDPGjbqO5bRDzJ83zoa5uEmaAeWmK2A1PPlRZEDXXEgDE6MuXEbCIZXz5ZoDJs/3yV/Ojq7okTT+shj2o=@lists.linux.dev
X-Gm-Message-State: AFuF++l87uEpcdiw3A11vV7RJj4m9uKzkdQkh6GniENw/X1jGsPmpyXG
	pfH8q5oF/uD93icHa+1ULx6O1wFrYEn9KjgTA5wNOYkzXgljqv6cqOvr
X-Gm-Gg: AR+sD11qmRa9Bwld/MhLfpa//klrTVahJ1wAEtQL2gwXqEoP1dn8I6odnMeuGivrsdX
	mzMXLqCh5mUOkNkYjHeBeoGu2tpvk13xKwlfnSJvURhFruA3ufmPqUURntU3Kw8MNUdzbRQD37h
	5ZCAd6wMEJ1Wc1N/RW3XTZv+wF5x4aYxuLs3NmJwqTlYVin4LD1EJn/YvO2fO0ezbIxhu6wdhPf
	k5jOJsOLJBUsC8Np2gFHj451Gv7bRRk3DUy12xTflLzeskr8vC+wv1PQJjBSpgTAwReiZWlMWeV
	xjowciWYiSj62vB/bVFHokoELbdOWA28q7Ut909Eu01yv3x7Djult0kq5S0uZN4gU7JHHRl3cPI
	125MwEZhMNcHGVp6XUVL/DKKvt4DVSwV5V5ZYE8GayPywiWmZXP3ZqBM1rVbqDxJ5JRFvpHYkG0
	K7jJTlV85+4wECVTdmY2oG/BSDeqeual9Y5eYqviskHeI3/wtFK7UX5prR9bTpJJ/CoAhtNXq3s
	rk4KWMBlrNCrZx5vICuqQJdAR8=
X-Received: by 2002:a05:6122:512:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5c7bdfc2829mr3065498e0c.4.1788268568128;
        Tue, 01 Sep 2026 06:16:08 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7242ab36fsm10637674e0c.17.2026.09.01.06.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:16:07 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sashiko-bot@kernel.org,
	sj@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] mm/damon/core: always return false when esz is zero
Date: Tue,  1 Sep 2026 21:15:35 +0800
Message-ID: <20260901131614.13079-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901111247.907BA1F000E9@smtp.kernel.org>
References: <20260901111247.907BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 01 Sep 2026 11:12:47 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch breaks the O(1) early bailout for schemes with a zero quota, causing O(N) evaluation of all regions, significant CPU overhead, and corruption of the 'nr_tried' statistic.
> --
> 
> commit dd8f74f4c9d96719d46a1466acabcc4d814aadc9
> Author: Liew Rui Yan <aethernet65535@gmail.com>
> 
> mm/damon/core: always return false when esz is zero
> 
> This patch modifies damos_quota_is_full() to return false when the effective
> quota size (esz) is zero. This prevents qt_exceeds from increasing
> unexpectedly when a temporal goal tuner achieves its target and sets the
> quota to zero.
> 
> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index 3f89cfdf5f022..012e8970f154f 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> > @@ -2551,6 +2551,8 @@ static bool damos_quota_is_full(struct damos_quota *quota,
> >  {
> >  	if (!damos_quota_is_set(quota))
> >  		return false;
> > +	if (!quota->esz)
> > +		return false;
> 
> [Severity: Medium]
> When a scheme's goal tuner achieves its target and sets the quota to zero,
> does returning false here unintentionally break the early bailout in
> damon_do_apply_schemes()?
> 
> When this function returned true, damon_do_apply_schemes() used it to skip
> the scheme entirely:
> 
> mm/damon/core.c:damon_do_apply_schemes() {
>     ...
> 		/* Check the quota */
> 		if (damos_quota_is_full(quota, c->min_region_sz))
> 			continue;
>     ...
> }
> 
> If it now returns false when esz is 0, doesn't that cause the loop to
> evaluate every region via damos_valid_target() and damos_apply_scheme()
> instead of skipping the scheme?
> 
> If the scheme is not skipped, it appears damos_apply_scheme() will calculate
> a zero sz and jump to update_stat:
> 
> mm/damon/core.c:damos_apply_scheme() {
>     ...
> 		if (damos_quota_is_set(quota) &&
> 				quota->charged_sz + sz > quota->esz) {
> 			sz = ALIGN_DOWN(quota->esz - quota->charged_sz,
> 					c->min_region_sz);
> 			if (!sz)
> 				goto update_stat;
>     ...
> update_stat:
> 	damos_update_stat(s, sz, sz_applied, sz_ops_filter_passed);
> }
> 
> Will this cause s->stat.nr_tried to be incorrectly incremented in
> damos_update_stat() for every bypassed region?

Thank you for pointing this out!

This can fixed by adding a check before damos_quota_is_set().

'''
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1656..795f802657ff 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2560,6 +2560,8 @@ static bool damos_quota_is_full(struct damos_quota *quota,
 {
        if (!damos_quota_is_set(quota))
                return false;
+       if (!quota->charged_sz)
+               return false;
        if (quota->charged_sz >= quota->esz)
                return true;
        /*
@@ -2654,6 +2656,9 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
                if (!s->wmarks.activated)
                        continue;
 
+               if (!quota->esz)
+                       continue;
+
                /* Check the quota */
                if (damos_quota_is_full(quota, c->min_region_sz))
                        continue;
'''

Note that this also changes the implementation of this patch, because
quota->esz is an upper-bound, while quota->charged_sz represents the
actual quota usage.

> 
> >  	if (quota->charged_sz >= quota->esz)
> >  		return true;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260901105925.106186-1-aethernet65535@gmail.com?part=1

Best regards,
Rui Yan
