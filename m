Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD114416D11
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604083; cv=none; b=aZw5+hcOa/jeH6weF2L8HEnqL2TuT833npHQk1mCaMhbKqe9fqXyhveeOFQJ3OcdH7XRr1Z5xxIqoZmPfeiW7ktqTOBQn+BjMhxocV6zG64mJxir30W7ZdlIC/Qk4KfOpxFiO0DEoduf6fs4krWb4e6Pwv2kkwCj8PQ2FvVA52s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604083; c=relaxed/simple;
	bh=/bl9MwV74yHiZiDkzSFn014W8ikCntS6TGGQGI1p5Es=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRuHIpCFniS2zBHPTfhYq/wX3VzeMoHboJb17m+kse2ReVdCyOi4xRW520ffkLCyoV31WTNQcUSPQy7z11IVNNCaeKGrOFGMyeip/MXeV7hWPFs1BEKvHJCGMtFH84KgO1Fi+Of/TB+Q2x7/4F5lDFpISkaGqOcOvSBaL/7kOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPdj2Hzr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPdj2Hzr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b9318997so31288505e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781604080; x=1782208880; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tDAanR4THSch7TdfZDJ6qVDxcTgxRPw562Ge1ODgHF0=;
        b=FPdj2HzrhOz0jzV6u7YAF6Hj/Utm7WxyKXzzuMX1DvB5UCdoSGxbsJ4AurBDg1eGMC
         1aljpKCpzsiUdM0UCaDpTmuSXrpenIA/yndUWz8TBO3yvxRItoh+dhyfPBJxoLKU+QC4
         XYU0Hi9p3tCnq2tfTUdvEYOfiUooZmpNBi+JVdPVIPgHCNGBUw60wWpzjT0nHrpm3uz1
         9NUA4WNoQY1SR7PJXzaO7e8VB/xWbgpQVDVjr36aRUlVBWAIT9yaRlN3ZLJySPpInZ7u
         SEfBC/avV0ZLG3eVeiJ/Pc3wJhXkoKxBx0qWlTkhwnQMWDD8XOuqZEVZzJiPT7F//ZE/
         nMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604080; x=1782208880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDAanR4THSch7TdfZDJ6qVDxcTgxRPw562Ge1ODgHF0=;
        b=PA1LJi+bKRIWe7X/Yh7UPjuaXDgh3VX9/4v13dGlD/KDA+7TMxxJj8VBR1mTvTdW1G
         uS/NPJsaa7KrGKYSK7yb6Yi2kX5DEzsZJyEoUgPruEagLhYNha7Vo6vNV8X9HxNlEQ/M
         kK16rLITQDuxS2uUaNbzViz+cbCSGbntKT3n4Shst24vYcaY0SuJiQFKSZVkLP7pDF/f
         ErTAifba1QHkBq7uDQPBNEcJR3fUHHFiWl17VVSLO3/5082sIfBTIAXtiDSUKozZ7ggi
         vnjvaIU+L4fAGRFra0MZVixfIsYfG7UUjGHnFKNVPOYxIOKIlIdTx52cOC5Epb8PkUyb
         RUqw==
X-Gm-Message-State: AOJu0Yy6nvA6FQXxohvHHAuqFnwnc7fFjPibMYMx/rGp3b2Tsg6Rv9lb
	Hk0lUkdSrcMRGE8kj0RY4gnWvt4dwNCAzkqvhC/3Ly75+iUnP8WMXGUadVnfdg==
X-Gm-Gg: Acq92OHVgadu+Q5O3EZMtkonXmRtRhMJyV6NJzTHkFXK5JbOzMOBRI9k037htUNyi2c
	3Uob/30oW9CToMj9Tqt1exnNeOYa6Vnv0lU9IU0R4CEW7RbSfO3/OSlB3jtC+Yk2DsLGaQSLT8b
	PTtEzldSmd8Aypxw0+zeHJ8RN2bMwF/61MyMO4ObNyjap8Q6U0nuT3gp+2vn5W0h7dVLNozEmq2
	tjL4KJEcL4rDpWbVkGdAe5psYC5Ujgs6lazGwQRKFqZztHc0nmAX6VRRXd79VWgG1A+4/CgFtT+
	IufT9ThMXjas9CTfRXHJ0WAB7SY6evDjlQurvP7MhO1mdrHfyaazEI9DSDQWgSM+C8aSYrm2/CI
	DpxVUcFOesiXST8i7sq/azZFmNSDRtbQwhZyOjPAJ087DgCN7eU5zuufdhIrgihsD1Oe/R3sCQR
	Es1SZnOCXgyAh3Igs=
X-Received: by 2002:a7b:c017:0:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-49220093459mr142231565e9.15.1781604079435;
        Tue, 16 Jun 2026 03:01:19 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47ce3sm74505005e9.6.2026.06.16.03.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:01:18 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 16 Jun 2026 12:01:17 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf] bpf: Add missing access_ok call to copy_user_syms
Message-ID: <ajEe7Zx8sLqaiPIR@krava>
References: <20260616083056.405652-1-jolsa@kernel.org>
 <20260616084204.01FD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616084204.01FD21F000E9@smtp.kernel.org>

On Tue, Jun 16, 2026 at 08:42:03AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing `access_ok()` checks for user pointers `uoffsets`, `uref_ctr_offsets`, and `ucookies` before using `__get_user()` in `bpf_uprobe_multi_link_attach`.
> --

it's fixed in separate post in here:
  https://lore.kernel.org/bpf/20260611114230.950379-2-jolsa@kernel.org/

jirka

> 
> commit cd20e04dceb618df71198c96a9e801e033dcb0a0
> Author: Jiri Olsa <jolsa@kernel.org>
> bpf: Add missing access_ok call to copy_user_syms
> 
> The patch adds a missing access_ok() check for the user pointer array usyms
> in copy_user_syms() before accessing it via __get_user(). It also cleans
> up the error path by returning -ENOMEM directly upon memory allocation failure
> instead of using a goto.
> 
> Link: https://lore.kernel.org/bpf/20260611115503.AC16D1F00893@smtp.kernel.org/
> 
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > index a02bd258677ee..c274109d020f3 100644
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> > @@ -2331,9 +2331,12 @@ static int copy_user_syms(struct user_syms *us, unsigned long __user *usyms, u32
> >  	int err = -ENOMEM;
> >  	unsigned int i;
> >  
> > +	if (!access_ok(usyms, cnt * sizeof(*usyms)))
> > +		return -EFAULT;
> > +
> >  	syms = kvmalloc_array(cnt, sizeof(*syms), GFP_KERNEL);
> >  	if (!syms)
> > -		goto error;
> > +		return -ENOMEM;
> >  
> >  	buf = kvmalloc_array(cnt, KSYM_NAME_LEN, GFP_KERNEL);
> >  	if (!buf)
> > @@ -2358,10 +2361,8 @@ static int copy_user_syms(struct user_syms *us, unsigned long __user *usyms, u32
> >  	return 0;
> >  
> >  error:
> > -	if (err) {
> > -		kvfree(syms);
> > -		kvfree(buf);
> > -	}
> > +	kvfree(syms);
> > +	kvfree(buf);
> >  	return err;
> >  }
> 
> [Severity: High]
> This is a pre-existing issue, but while reviewing this patch I noticed a
> similar pattern in bpf_uprobe_multi_link_attach() within the same file.
> 
> kernel/trace/bpf_trace.c:bpf_uprobe_multi_link_attach() {
>     ...
> 	for (i = 0; i < cnt; i++) {
> 		if (__get_user(uprobes[i].offset, uoffsets + i)) {
> 			err = -EFAULT;
> 			goto error_free;
> 		}
> 		if (uprobes[i].offset < 0) {
> 			err = -EINVAL;
> 			goto error_free;
> 		}
> 		if (uref_ctr_offsets && __get_user(uprobes[i].ref_ctr_offset, uref_ctr_offsets + i)) {
> 			err = -EFAULT;
> 			goto error_free;
> 		}
> 		if (ucookies && __get_user(uprobes[i].cookie, ucookies + i)) {
> 			err = -EFAULT;
> 			goto error_free;
> 		}
>     ...
> }
> 
> Are the user-provided array pointers uoffsets, uref_ctr_offsets, and ucookies
> missing overarching access_ok() validations before being accessed in this loop?
> 
> Since __get_user() explicitly bypasses the access_ok() validation performed by
> get_user(), reading these pointers without a prior check could potentially allow
> an attacker to pass arbitrary kernel memory addresses and trigger unauthorized
> reads or crashes.
> 
> Does this function need the same fix as copy_user_syms()?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260616083056.405652-1-jolsa@kernel.org?part=1
