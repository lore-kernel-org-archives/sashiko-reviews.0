Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE140D593
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570392; cv=none; b=CmydrjufTl7At/rdDFN5TAm7x8YyhUv4MYQGK9fpu1p55x4dmwh5cpFwRPfzC+ObTPFpfyQgPivmLlK63xmNZCQvtFjQf6aprCKKlxSwB/KfF+4CPkI+ZkQQvMg1/OVwR9iV9beM8NfaeiIz3IU1cgrnK3sDRgrmhdesgLxOruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570392; c=relaxed/simple;
	bh=eJV/QKPRl0nQ58CX6raU94v8GT2LbNVT4nHU4Cu9Qxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZAPz1ifytSP+xyugFKB7LzuVhRQsKTWuIBjoFQDpxLaHzmeDmhfPH8hxyDiZrczgmGwfq+qN9f5RLcNnWgx7j50uD8SQ1pSvgRfaJEfrtS6BytgbM5CEMMLc9aN26vacgQQd7z1XBUT/mT2vasunRegYtQ/9TYseOnX4cC3NRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GLRIuZEH; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GLRIuZEH"
X-Gm-Message-State: AOJu0YyvcWXMEivp9aDX764tobOWg6DqRHze7R5PNYZeDiBSxj2vfXCC
	tJ3B3l3ajXKBgZ0NQwOpFWhxBdGgqId/oYOO4/e7iDeaD8LC4kVtdufN2E0sPn5yjARw/rwOJBe
	xJrypBlQepMGM/tj/EP3+TmFtoZI7lC6zHZpASfGn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784570381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSjjs1T/fGlvzcUytES43w/zoIxeAWRYz4e8PGpL2fc=;
	b=GLRIuZEH9OFQOr/znm/n8Ylqa0ypPJ1SacM3dzN8vVZEuXZqIbCS62tDstk7gHvGo9tvXx
	Z74w2ERYWIRG/mTxfWBzkWcqbrfdgUDrUcFTW9i5zwJlXZ4Y3mlkmNXzaZQ6hUDXe8uVdu
	5g0B3pIFHdDEZ1QHU5ErrnNcd0gFR+A=
X-Received: by 2002:a05:622a:2b47:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-525fcfa53f6mr4668601cf.0.1784570378553; Mon, 20 Jul 2026
 10:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720161343.1367007-1-fuad.tabba@linux.dev>
 <20260720161343.1367007-10-fuad.tabba@linux.dev> <20260720172923.E4F161F000E9@smtp.kernel.org>
In-Reply-To: <20260720172923.E4F161F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 20 Jul 2026 18:59:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyOWhWRo=W0dp5qdBOLnaQMB9WW0Y8MOYDnJR_qHCs3AA@mail.gmail.com>
X-Gm-Features: AUfX_mwcTtHzH5EdgVipRg09TkTHSMSuxIF002h3-f_9PAq_fJ2tY675UvpwgRI
Message-ID: <CA+EHjTyOWhWRo=W0dp5qdBOLnaQMB9WW0Y8MOYDnJR_qHCs3AA@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] KVM: arm64: Type-check hypercall arguments at
 the caller
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Mon, 20 Jul 2026 at 18:29, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Disabling the hypervisor trace clock fails to stop the backgroun=
d clock synchronization worker.
> --
>
> --- Patch [9]: [PATCH v1 09/11] KVM: arm64: Type-check hypercall argument=
s at the caller ---
> commit 171ebbffa4142a86e7fab981732cd83df6923869
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: Type-check hypercall arguments at the caller
>
> This commit replaces the untyped kvm_call_hyp_nvhe macro with typed stubs
> generated for each declared hypercall. This ensures that hypercall argume=
nts
> are checked for correct number and types at compile time.
>
> > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> > index 2411b4c32932c..7fe0e8feb7d7c 100644
> > --- a/arch/arm64/kvm/hyp_trace.c
> > +++ b/arch/arm64/kvm/hyp_trace.c
>
> [ ... ]
>
> [Severity: High]
> This is a pre-existing issue, but I noticed a logic error in this same fi=
le
> in hyp_trace_clock_enable() when tracing is disabled:
>
> arch/arm64/kvm/hyp_trace.c:hyp_trace_clock_enable() {
> ...
>         if (!enable) {
>                 cancel_delayed_work_sync(&hyp_clock->work);
>                 hyp_clock->running =3D false;
>         }
> ...
>
> Does this accidentally restart the background clock synchronization worke=
r
> instead of stopping it?

Yes. I will send a separate patch to fix this, as you noted, it's not
introduced by this series.


/fuad

>
> Without a return statement inside the if (!enable) block, execution appea=
rs
> to continue down the function. This would cause the worker to be inadvert=
ently
> re-initialized and restarted, leaving the background task running and mak=
ing
> periodic __tracing_update_clock hypercalls indefinitely after tracing has
> been disabled.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720162412.14=
01272-1-fuad.tabba@linux.dev?part=3D9
