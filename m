Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE644483BE
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 11:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917851; cv=none; b=gMT6c7GO7M+iUHNFnv+Ar5RFWmWklX/ArVKC8q6Xi2FIe1KSMTp+gSz98yGvM1Xqe246Ye3ejPUy5hFhBNNL9VV0QDjo43KD0lTvovQ1USgua8F+juV0ozWrd5uA8Sk9m+AQksJYcV/w7M7EYjRgNahePsgaO7BYvTVVlqqWW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917851; c=relaxed/simple;
	bh=elMHYF0Q0z8GRQDyDtakJ6okP5dn4Lv1DZPyk20A468=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G71NMwlp0kE8BdIXA+sUq5pFif/1AWP+0OX2Syp8dU/1ELUA6v/ItUPbpd+TZsXa9C5qhBG6hytANR49mK44ROlw/p2tpb1v8mPFMEdoDC4x0pVkgxTeUuOUVohoVFQxooydAg3ECWud+pCP8qQbWlir5EupdOqc0HRqCYeERPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jp9dqrZq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jp9dqrZq"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-853c401326eso599013b3a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 04:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787917839; x=1788522639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nYL1x1PhkxOLSfcHaoOTRQlZQow6faObjxE2pbTIVVA=;
        b=jp9dqrZq9q+L3/0OeMpw2teLEyiCyMnZHwVBYXhkmJBg55uLaFsjH6nZXOp3ZP3PnR
         8bPJyoA5eALax4jBScx47+fiD8gwjmt3hPT/DEVsiuJsWiImO0KE0RznpS8dTrL3UOcD
         vupHG3K21Kw92Mzp32FZktB7YdN1aqPGtZipfLspbz5miB5VVSPDhFH7jkJ9tVndCs7h
         dRLM3zxBFu0opk+EhhrTbT3bJDjRClzpnT7wUoymR0nNFXNa5JTNMUIXICDECRlSm/Fq
         3ybXRCTJwMlNnj3nXGxrARCLJxpgMQI+DxAeNuQ/kn6z9kwO8vNZJOgIDynBEgI3Jeop
         2cJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917839; x=1788522639;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYL1x1PhkxOLSfcHaoOTRQlZQow6faObjxE2pbTIVVA=;
        b=SCiSntA6g2AFayWcTV9ZqgZAKg3QsBoiA3ssaknBJd35Jm49oinl16u5Ai9yLSt8uP
         brXoG9d+7P+JjOPRlCVm8I+5zFFlcDVjmP4+3vCLlS37xfYLbHv3PKJ1Jk7ovxRs8+3n
         PAvnjVCjnCsNLYFJOV+H+IzzAS+zIl9o7jeXL1j76aifJxNupMlgMAfVgcAOlsr+iODP
         DwYAvKLOLn+rwSVDi7vdVzmnkHchu0E1wXsTuGd8XTyGWuZRtMvsB7vyWNQ1qf/ZyWMB
         iZgwLw/xXz9clSfPahteNKSR17Yjb6XnvHF2TJc+pzKydOdMeS6TOB2JVsLbGKeOk00K
         gKDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/g2VONvLnjoHs2F3ZTEc02PrwWgKhhzDdPxbs2GE9E58GivVmSucV2EnAqXI0uzHykTpoDrOgBRHQu8/OJW4=@lists.linux.dev
X-Gm-Message-State: AFuF++mtnT79fMkG8EzeZX8FZ0k2eKqq/9Il9h5Nh7FZeOyQEoFMrMcJ
	vgQ4S7MK2WhQx8rCjlxOMtUW1d3Ags3SvPvrt8efvNpfVdigrzJmC9qMrSaSaQ==
X-Gm-Gg: AR+sD10scAdrYnecLWaii+L18A3wwCnoA8bEOlEexTZM4GIYxVsI5G6h3+9lrjQDkMl
	JP+EprKEhKFGHAmQoX6YAfrhVL0UfLr4374UIaH9BabSn1zqKp7MEMMoYSKZYpB8K2NE9e4iiZF
	N4GJR/xGO0bxLTcxuTowEcuj09qPeJky2aynSu9MrokrdIfZralzS3rOrAHn28xDom/hyNyIv/T
	5StQgFTnnBoKWYvFl63GpvJv+7mHIBf7hJTqskBPCLlGQgpMWjtEbciZUnHFwAMjWNQpgygHxzV
	v7P8jdKHeB91ncOekzWfA6/Gj51XH2QFglejar4EpLb+hvCbSGSSU8MTAW0yIa8Q31SCigry3jZ
	HkpO0m8RMX5gWASkv/zE/a+qDgnrCr7lel9dw13uRLyCvx7WVaqsvs7SG3i1ta9qAO7bRiGof+Q
	m4hxNSTiRZiH8Z9GN0n4yO/xh+5esAJ3/dLLUWXk1QBp170zrOxecNf7aV+f1+6KoCPw==
X-Received: by 2002:a05:6a00:b85:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-8562839d75amr13276129b3a.4.1787917839411;
        Fri, 28 Aug 2026 04:50:39 -0700 (PDT)
Received: from celestia ([2402:1980:88cd:27c4:5897:46d2:587d:19e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea75cfsm454374b3a.34.2026.08.28.04.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 04:50:38 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sashiko-bot@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] mm/damon: fix unconditionally skip last region
Date: Fri, 28 Aug 2026 19:50:42 +0800
Message-ID: <20260828115047.332978-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828090410.40AEA1F000E9@smtp.kernel.org>
References: <20260828090410.40AEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 09:04:09 +0000 sashiko-bot@kernel.org wrote:

> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index 644daf5a16560..21dc6b086c42f 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> > @@ -2347,14 +2347,15 @@ static bool damos_skip_charged_region(struct damon_target *t,
> >  	if (quota->charge_target_from) {
> >  		if (t != quota->charge_target_from)
> >  			return true;
> > -		if (r == damon_last_region(t)) {
> > -			quota->charge_target_from = NULL;
> > -			quota->charge_addr_from = 0;
> > -			return true;
> > -		}
> >  		if (quota->charge_addr_from &&
> > -				r->ar.end <= quota->charge_addr_from)
> > +				r->ar.end <= quota->charge_addr_from) {
> > +			if (r->ar.end == quota->charge_addr_from ||
> > +					damon_is_last_region(r, t)) {
> > +				quota->charge_target_from = NULL;
> > +				quota->charge_addr_from = 0;
> > +			}
> >  			return true;
> > +		}
> >  
> >  		if (quota->charge_addr_from && r->ar.start <
> >  				quota->charge_addr_from) {
> 
> [Severity: High]
> If a target's last region straddles quota->charge_addr_from (meaning
> r->ar.start < quota->charge_addr_from but r->ar.end > quota->charge_addr_from),
> does nesting the damon_is_last_region() check strictly inside the
> r->ar.end <= quota->charge_addr_from condition cause it to bypass the reset
> logic entirely?
> 
> Because the unconditional r == damon_last_region(t) reset at the start of
> the function was removed, the code now proceeds to the next block where it
> attempts to skip the prefix:
> 
>     if (quota->charge_addr_from && r->ar.start <
>             quota->charge_addr_from) {
>         sz_to_skip = ALIGN_DOWN(quota->charge_addr_from -
>                 r->ar.start, min_region_sz);
>         if (!sz_to_skip) {
>             if (damon_sz_region(r) <= min_region_sz)
>                 return true;
>             sz_to_skip = min_region_sz;
>         }
>         damon_split_region_at(t, r, sz_to_skip);
>         return true;
>     }
> 
> If the prefix length is smaller than min_region_sz and
> damon_sz_region(r) <= min_region_sz, or if the subsequent
> damon_split_region_at() fails due to -ENOMEM, the function returns true early
> without splitting and without clearing quota->charge_target_from.
> 
> Does this permanently leak quota->charge_target_from?
> 
> If the function returns true early without clearing quota->charge_target_from,
> the region loop in damos_apply_target() would naturally terminate since it is
> the last region, leaving the cursor permanently pointing to the current target.
> 
> In subsequent time windows, could this leaked target repeatedly trigger the
> same early return, causing all other targets to be skipped permanently
> because t != quota->charge_target_from?

Thank you for pointing out this issue!

I just wrote a v2:

'''
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 21dc6b086c42..02a4b2edcc4b 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2348,14 +2348,8 @@ static bool damos_skip_charged_region(struct damon_target *t,
                if (t != quota->charge_target_from)
                        return true;
                if (quota->charge_addr_from &&
-                               r->ar.end <= quota->charge_addr_from) {
-                       if (r->ar.end == quota->charge_addr_from ||
-                                       damon_is_last_region(r, t)) {
-                               quota->charge_target_from = NULL;
-                               quota->charge_addr_from = 0;
-                       }
-                       return true;
-               }
+                               r->ar.end <= quota->charge_addr_from)
+                       goto may_reset;
 
                if (quota->charge_addr_from && r->ar.start <
                                quota->charge_addr_from) {
@@ -2363,16 +2357,24 @@ static bool damos_skip_charged_region(struct damon_target *t,
                                        r->ar.start, min_region_sz);
                        if (!sz_to_skip) {
                                if (damon_sz_region(r) <= min_region_sz)
-                                       return true;
+                                       goto may_reset;
                                sz_to_skip = min_region_sz;
                        }
-                       damon_split_region_at(t, r, sz_to_skip);
+                       if (damon_split_region_at(t, r, sz_to_skip))
+                               goto may_reset;
                        return true;
                }
                quota->charge_target_from = NULL;
                quota->charge_addr_from = 0;
        }
        return false;
+
+may_reset:
+       if (damon_is_last_region(r, t)) {
+               quota->charge_target_from = NULL;
+               quota->charge_addr_from = 0;
+       }
+       return true;
 }
'''

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260828084737.290024-1-aethernet65535@gmail.com?part=1

Best regards,
Rui Yan
