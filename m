Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE412E65D
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559969; cv=none; b=Kx2Xs0pp2j1iVs1GodLjaKbI24UQgr6rePa7VB1tsv0tecM60tx9/+nF8ZE1f2ihev8qcqM7mN4iqya34hnB3w1ZMHS/6Sep9epFxXAo5pmahvpIWixr46NR3Bj9quHQUiP7x8k+FPYRqRlDoeGTY5AP9hyAebW2zuUkSDQFfBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559969; c=relaxed/simple;
	bh=CnhMj81FkK5riQbmtkpJCB21rHzxFk+nB0anZX/jsjM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCob/+2OlpfHeawiRdDlCzcanbryNklXUIlwKuCqx30Kge4+shzUv0YYvz27Iojy+JA5oUeAVcpE77JvawWgSRH3cRPBCJhlnP4OGIU/PSHx3OI5bPOMVn4JpiAj06RolXKDlLfVPXhZEIpAZ1H0ATv4dzmbD16FJlq9h41UzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hs5Ym+py; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hs5Ym+py"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso2898325e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 00:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780559966; x=1781164766; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FlSlkzihrQLsWLGFxnsYvqE+OsF/acsWFa5H1/cLFIk=;
        b=Hs5Ym+pydJGQeuquXVO5Q5RpltK4Gd+LG4jual6pmXCL2VzDGza3EQ6eTsdth3apV1
         hNC/cGfV0Tm1osFL1j1/Z4UfDMNw6bRxqVSP/HGW7nLv4EMrS4ckc2beUXIO/Gs3hhgc
         pRzsjR4lrrGEu7ufHBj2sJjyyC+bOkmCWdEOe9Ga87qWiLiUVpPkIwom+gDy5Vyefa9E
         uDB81blo9faaaR6Uj8Ln9geDhasSGan5IHCmunVm4Q9tABYZTfU0OlDLmsngdOFnaUKB
         yK6nQKKvpJhTy00KRTU9o2XRDwvzQmE0DPUdBLoRU3QhrvWPPl7ckGb+dOUZm/kj8tE6
         D1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559966; x=1781164766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlSlkzihrQLsWLGFxnsYvqE+OsF/acsWFa5H1/cLFIk=;
        b=nI6vM0uTlzP/Hoq5i5fqwzeAutJrmr1vBG7sLs9wYB1Xx7CSBafFWbmZYAlXbOv4RZ
         SLsgl+7ip5IMyZz5pNSQyTy3ItsrgRXXkFPuSprvk0fr47KgDsalA2z5636dGvpWRNQC
         JXOrd41KCnAtetbJqNQZ8v0w+sWEMT4nx+veKNn/UZGEip1g+vTK4N/ZGMd2ZAxDIsfd
         NQxQFy0A1ZiaOwpRnl+PZYNY1j70zpKRrtROimIO6JiVVr8hMtxZtpE50Z9gkhMqjKqe
         vP6QLeF575dcY6sldmtdqtAeVapz6LQcWbpvFyOzecVcCXtn54ysEMKciGVZnkoQ4Sen
         sfig==
X-Gm-Message-State: AOJu0Yz5AU55n/s5Xe88v9PMTgUB7x3ATrNgJhA5Fcjw4ZFZYboZL21d
	6wsqRzsXYw9B9QbNs5rk/tiAr1m9UnbPZARTlKc18VfabyGqbeg6C45+ifG/pg==
X-Gm-Gg: Acq92OEmwdhEBh9Qbni25yODgf3oa+qdBclH46hW/k5oa5Tm79NKIBOiMvdB8UlzEbp
	wMdVnI0BzUDeBSs6MLmkN5UI4ZbkjtFSZr+fibyEtkTEMgcZpQyYjdWxjrFszAaAVwDwwufUOjw
	afti4PGz227+QsByLOdBxN9TruSON/6nzd2pNYXrqOf+wVwn+JWOZnm0VM/5CavaZCoUSe71q9a
	U4ME7TRDTwHqZJz7eFDjoktp88pH2kRDjSyjP9j8MyQRACyGr3sRJrLPsWuXAplpVqEhFTokBV2
	5XK1KKv/24RKeLm+3HOIW7xIR6oZWxb/6Dtf8oaC/xI/ezNn2t0DpmDz39JmRq8wfSP8OH+pxqv
	d0GvzzoePcwjxu4pKnH+nTBkn/4ZbF+qgXhbkmXHx9pcHK4J76EU8tNrJGFUFVs1xHLl6Y+b+vj
	y+web04A8liuKvoS3t0EESKbbKbg==
X-Received: by 2002:a05:600c:444c:b0:490:b58b:a4a5 with SMTP id 5b1f17b1804b1-490b60e0a19mr106863165e9.31.1780559965940;
        Thu, 04 Jun 2026 00:59:25 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71476955e9.2.2026.06.04.00.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:59:25 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 4 Jun 2026 09:59:23 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv7 bpf-next 04/29] bpf: Use mutex lock pool for bpf
 trampolines
Message-ID: <aiEwW3-dzi8Y5d0n@krava>
References: <20260603110554.29590-5-jolsa@kernel.org>
 <20260603112900.318991F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603112900.318991F00893@smtp.kernel.org>

On Wed, Jun 03, 2026 at 11:28:59AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Multi-line comments modified by the patch do not follow the mandatory BPF subsystem comment style.
> --
> 
> commit 107ed36e35d617129f1228fd0db67188b4ce4a98
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Use mutex lock pool for bpf trampolines
> 
> This commit replaces the per-trampoline mutex with a mutex pool to
> prevent lockdep warnings when attaching multiple trampolines during
> tracing_multi link. Trampolines are hashed to one of 32 pool locks,
> keeping the maximum simultaneous locks below the 48 lock limit.
> 
> > diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> > index a4298a25d4bae..c0b4732627bef 100644
> > --- a/kernel/bpf/trampoline.c
> > +++ b/kernel/bpf/trampoline.c
> [ ... ]
> > @@ -99,12 +128,12 @@ static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, unsigned long ip,
> [ ... ]
> > -	if (!mutex_trylock(&tr->mutex)) {
> > -		/* sleep 1 ms to make sure whatever holding tr->mutex makes
> > -		 * some progress.
> > +	if (!mutex_trylock(select_trampoline_lock(tr))) {
> > +		/* sleep 1 ms to make sure whatever holding select_trampoline_lock(tr)
> > +		 * makes some progress.
> >  		 */
> 
> [Severity: Low]
> This isn't a bug, but since this multi-line comment in
> bpf_tramp_ftrace_ops_func() is being modified, should it be updated to
> follow the BPF subsystem comment style, with the opening /* on its own line?

already answered in here: https://lore.kernel.org/bpf/ahg_YFpqlTGYQUay@krava/

jirka
