Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7343D42D777
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342689; cv=none; b=XxgGKusSeGNRdgC43DL5e9pQxK+NFEieA9BMHQG52hr0TBzNy8aDKphtjiwfJvCxby8uxMrw4fAfeILK9i1pvnRkNrSsvPQVilfRW3c/IyrZtFunDHeiJu6rLyC3zeLNSSsKv6sLSv7/ZxL1+0oyl79bGe18oP21WooWYz1XI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342689; c=relaxed/simple;
	bh=kpoO4XC5ZjwGe2R23ONKEYBPpJR/+J5srvdUMCfvzs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G7v7dB+SzPWZQ1UbUH2xJhTZXgJopo7ZFnnFZ8ZC3LNs8qNRO9gvLIi+2UJtJoOGVT2u5rKNkq+/ldAbLcRKmaUCggge1VYojZ3E4uWPQqJzh5IlZkCj1XyMwkKgsT+7wHTrEc5Blo9F08VbGwUK7385YNiaYhc2Cok8Y7c6gK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXQLKWKG; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXQLKWKG"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1057075a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 02:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788342686; x=1788947486; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUGd7SiZwszuY692VXLvSRgKuWVCf+DwlqdyCfU6+00=;
        b=cXQLKWKGrriBQq0CtoqluRghB25BnsXZDBgSeakZvE0lDuSj34b9T3AhSqvV6K9oeP
         9aderPPcPIJa9u7dKlrJnU7NQhX/2OXCzhkreAVdiQU6uGF6I6Igj5ZU5E7o+3lpwRLT
         UzrerjXvRh95ftkC5bQ1oAqPnX20cKyZ7fs7hnVCM3d+DzN4gjjy/L5P6ceEyU/z117e
         46X6F+mEFSm92ZFgJtngCOj3v6Xky2tqpxaALBf2oa1DxXmB+k5NSMW0T5ZtZsvaPiEa
         3lVm6fvoL5AudnMpon4NWZm8Ls5V6+HHvisrzQ3ODuWDmgMdnv+zLhw+uJUv8vPrkJ/T
         IPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342686; x=1788947486;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUGd7SiZwszuY692VXLvSRgKuWVCf+DwlqdyCfU6+00=;
        b=PjvQJq4SG984Ti9kB9XR/w85uTs/Tys//nH4Ousqvu12qvTEtWvFRu9guRg+IcYQT9
         eLW/46aqe0+AK72uCMwgg3+/JKiEe5X8JNcNfOlXgexpd7fQ/gxZolkDP1cJ0rW5+1uI
         W/9AiQg05b9KhcgrLWG6ZxiJkTdcZmN3+lMRUs+C4I9rv+FTDuXbmkwa4i8YFSl/2OlU
         ZXpqNI7H9YbEE/pw0XodImwBuKnkDVqf4COJriWDMsfTxtLeI0YFoo9yHl9JCoFLIKbc
         0jT7pzyVr0uxbF80ShjCweY5vYxO6BA8P9ZSY/KndFVZluvVuwYChycVSCU4avCBmQHw
         rqhg==
X-Forwarded-Encrypted: i=1; AKwUvBzhgKUDBtLSm1tccC5UotYTZKlh/HZXQti7iF1cdMn6eidqX1ONjfBN+ezQ/iHfexzDX/kvOt3hBCUrKX1TRUI=@lists.linux.dev
X-Gm-Message-State: AFuF++n0ErF7hdxDOlilqxKfOfnf3KYJCLQhhyWUSOcS30geWXZS52R+
	iKwb3KsAP+ZhCjA/n7IeGDLqhULAr2RmHVN1TLd9U7+Ts4Jud+4yRfnI
X-Gm-Gg: AYBFou2cZ680h6QkYeTPXXYhhoCv7VIK7L7kND0Sa2G1vk6d/oLQCeJ/Uekrfafm4oL
	++a65QTPfHtEsKtDHLE+47CP/RzIXZUEH7D2tOsPRKfRCC/iAudY2JfUGlZZ/caA2o0BBe7V+hs
	62kdM7WsfURs/eSk9yK54V0SDBQBho7kKHhPfgajwqlg3HVP0rxcUCnuE0qNbFlToWFCjKYDn+I
	OmELfeDpngXHFNAB03rP6BaQHov3DEJt4SFDpLuO7aCZHHEvzqDAwfZnbG3xcnUZpGWxi5Aw4as
	WB/YhD5X3AM/AW5JqSRj94YBgESui62/utODJEcxYvYe7UOghvBc3DDRlQoJwYTDaO54qJRKnU/
	GvOC60BaHKqPvtbw/VPR0ZUZJyg2akYn5Fm6ULFCip+GIgv/diZOlT18+09F5JzccGvSVsrdZFY
	/uc0ovX9w1SEXdmg9SUoLfO6KTJsW5HWE2phdddVDTZOY1Fjg5qm+TFPdVeE38/DRrk4y3pb6Hd
	lrEEJ6UG5kR7f0J
X-Received: by 2002:a17:90b:52cf:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39af57d22cemr1180978a91.1.1788342686482;
        Wed, 02 Sep 2026 02:51:26 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm11092711a91.4.2026.09.02.02.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:51:26 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sashiko-bot@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] mm/damon/core: allow esz to be set to zero
Date: Wed,  2 Sep 2026 17:51:30 +0800
Message-ID: <20260902095136.282835-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902083047.6D4081F000E9@smtp.kernel.org>
References: <20260902083047.6D4081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 02 Sep 2026 08:30:46 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch breaks purely time-based quotas by unconditionally zeroing the effective size quota (`esz`) for DAMOS schemes without goals.
> --
> 
> commit 34629844ff11daf28855cce5457468ad8bc08c73
> Author: Liew Rui Yan <aethernet65535@gmail.com>
> 
> mm/damon/core: allow esz to be set to zero
> 
> This commit updates damos_set_effective_quota() to allow the effective quota
> to be set to zero when the temporal quota goal tuner achieves its goal.
> Previously, the quota was clamped to min_region_sz, preventing it from
> reaching zero.
> 
> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index df22621765911..73dc9a70fb12b 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> > @@ -3251,6 +3251,9 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
> >  	if (quota->sz && quota->sz < esz)
> >  		esz = quota->sz;
> >  
> > +	if (!quota->esz_bp)
> > +		esz = 0;
> > +
> 
> [Severity: High]
> Could this cause a regression for schemes that use purely time-based quotas?
> 
> If a scheme is configured with a time-based quota (quota->ms > 0) but has no
> quota goals (list_empty(&quota->goals)), quota->esz_bp remains at its default
> initialization value of 0.
> 
> While damos_set_effective_quota() correctly computes esz from the throughput
> and quota->ms, this unconditional check will then force esz to 0 because
> quota->esz_bp is 0. An esz of 0 causes damos_quota_is_full() to always return
> true, effectively breaking schemes relying only on time-based quotas.

Yes, thank you for pointing this out!

esz_bp is a meaningful field only when (!list_empty(&quota->goals)), so
the correct check should be:

'''
if (!list_empty(&quota->goals) && !quota->esz_bp)
    esz = 0;
'''

> 
> >  	quota->esz = esz;
> >  }
> >
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260902082050.19566-1-aethernet65535@gmail.com?part=1

Best regards,
Rui Yan
