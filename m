Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A23F786B
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106314; cv=none; b=ayWMj6Uxlq1bjSXXwDeIz6HzdygBSS7mzhL0ha5HPcUPr0N/ZACAEKzIMRUxyvKuZlpVAYPaiFKA3xyLzfRSnxC/EwgIXsVkVvN8+ZlIQInSjpyqTGmbCkVbOJKJcNT1vK83hZ6ehGUkptDgLGhffdVMypEbO7trf0ofYZTolmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106314; c=relaxed/simple;
	bh=CpDAs4T7K7Cl8E9QS7pZZ9OgoaIoAom4ZHkQ91+R07o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dnh1FnjbFYpg+dUf5ng/fKFqZboG9E0kI2u5lpWbQ1shd/Ilky1L5yljscOyMUnS+cWhwWgY5IA3fDYG/JbYhGTi3YQ3QdG2jOiLkzTtXzDWt8Tz63vpDEGHGJexGmx+YH3FcJmyciLgak5WHwVOC1pQ9lbdSsOBEm0zMS7K/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8V5k+BH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8V5k+BH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4585a116a4aso1760289f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 05:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106311; x=1779711111; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWPo8KenTZciGOuDsKcmTAV6wQo2SX9JR2xge+PTEcs=;
        b=e8V5k+BHgz5q3Mj4xjyjwRGrOfnSAgEMavVCQOCo4SZzK4Zfi5iHDbhHcyLO1547Tq
         TpB3aIGxwc90LwwAtrUWloUMDcf1urwY4Ta1nO/1mL0U0culUuThcnQKgiJKhNg3q71u
         MCuklIupRVzhE+Pl8Zh7FSBvzsHMQnfigd8aaI2M73iG9jzAGX9rtyc1eigoPU+biDBp
         gspik/NKolgjHIduMTkQzFzii4U5rkIYErJpEd0L0AGln05sFOOFixMk5S7jSpHoiwuC
         4aEF9rDFvKQtiupanYn3dDNm2BMk1xeabNfxD84HABaoYzm7m8jdF79AkTpkzZxY8hNm
         mIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106311; x=1779711111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWPo8KenTZciGOuDsKcmTAV6wQo2SX9JR2xge+PTEcs=;
        b=ED49InG5Y9gg6i9G0e/34BmObtw3X4GFOX/S5FMxJf/qBhsEGErdur+RVRTg0nyfv0
         dVq/Dx2teNVGNRnaxmFJi3IrHbDcwZCD9ZDSfAAlLtKgJXmo1F8Jt2udowbvS/aDFtan
         S6WMT8G5QxiEvIdbIEbXQjXbzb0RDd2HEHwOuM8RoXxNM+P7rKEIuGuwIpN40l741EM5
         iav6FMI8HzDDkN9lplTx/4OFMKZb+BN2IS8QF3eTQxKDXnn1P2E/GDhI2irwNTn25UUz
         83WmiRaBM0QB4ntM0pdjLnAUgmClFsivyv4t0abJjBgEf+N6SmPontj4P43v/W4Dq+n0
         kHdA==
X-Gm-Message-State: AOJu0YyGTZ1HuMxjNQ16sM8T2GfsUkhRToze73xbUDuwSrqS5lf/dZY4
	POfBlrFwPtFi30nmblzTxfDdTbthcJCp+fMgdJyq2aldXFMEwgEgprfyL+y0bNsl
X-Gm-Gg: Acq92OErDLDjyZx9ykiqZnVcUe3IfvoLkRTbEtRiVpGZrF+GRXVHleJwq92HBP79sJi
	FBYwsHDK+4zVNuTImwYjJCVYah4VoTpAWvWfH/iaxJbLBvqHf8NtyNhbvmejoW19Ug7YLbyf/mt
	7AGu42iCYd6pPZV5EzUZgSO3U98UNp0DqtzVEd/gl2wMP/IadUoXPy1O2gxyU1BHgUfBv8M8gNJ
	99jivUYO5jru3CRD8bSF+vu4FMrgJ+URbNoiqHzX2TegHAhMvBK1dsMem8rk+tMde2V5CuUvhFW
	IvOlAPnX4sEiIYRAK4z/sfmuzVqjQOLToHWoaCmP5M7el0wJOe772+VAxorXA/7zgSn56Wdi2jq
	mU8ZQZuMljNTVahwp3ahJpjJTOVY9EcQzRFtfINhtPVAT8u4x3058pZ3lLA+MHBV/JBx4TSAzsM
	Awo7ofh28FGE04rgfvV4fd1zKCNtkCtLSc83GXUQx/DMuDKdyURzZAGYM=
X-Received: by 2002:a05:6000:2207:b0:45e:73eb:2a75 with SMTP id ffacd0b85a97d-45e73eb2ab3mr10959554f8f.16.1779106310843;
        Mon, 18 May 2026 05:11:50 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm38056869f8f.21.2026.05.18.05.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:11:50 -0700 (PDT)
Date: Mon, 18 May 2026 14:11:48 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 1/4] bpf: add bpf_icmp_send kfunc
Message-ID: <agsCBIBtnRdo54dK@gmail.com>
References: <20260515194746.50920-2-mahe.tardy@gmail.com>
 <20260515202358.20252C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515202358.20252C2BCB0@smtp.kernel.org>

On Fri, May 15, 2026 at 08:23:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] Calling pskb_network_may_pull() on the original skb before cloning modifies the SKB layout, causing BPF packet pointer Use-After-Free and panicking on shared SKBs.
> - [High] IPv4 ICMP generation fails silently in TC ingress due to a missing routing table entry.
> - [Medium] Unsafe use of a per-CPU recursion protection flag without disabling preemption or bottom-halves causes spurious failures.
> --
> 
> commit a8e749b3f92e491c40d461bbeec717cff3d92cd2
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> One line subject: bpf: add bpf_icmp_send kfunc
> 
> This commit adds the bpf_icmp_send kfunc, allowing cgroup_skb and tc
> programs to generate ICMP error messages instead of silently dropping
> packets. It clones the skb to preserve the original buffer, checks bounds
> with pskb_network_may_pull, and relies on icmp_send or icmpv6_send to
> transmit the error message.
> 
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 9590877b0714f..a1fe20b45f29a 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> 
> [ ... ]
> 
> > @@ -12464,6 +12466,95 @@ __bpf_kfunc int bpf_xdp_pull_data(struct xdp_md *x, u32 len)
> >  	return 0;
> >  }
> >  
> > +static DEFINE_PER_CPU(bool, bpf_icmp_send_in_progress);
> > +
> > +/**
> > + * bpf_icmp_send - Send an ICMP control message
> > + * @skb: Packet that triggered the control message
> > + * @type: ICMP type (only ICMP_DEST_UNREACH/ICMPV6_DEST_UNREACH supported)
> 
> [ ... ]
> 
> > +__bpf_kfunc int bpf_icmp_send(struct __sk_buff *__skb, int type, int code)
> > +{
> > +	struct sk_buff *skb = (struct sk_buff *)__skb;
> > +	struct sk_buff *nskb;
> > +	bool *in_progress;
> > +
> > +	in_progress = this_cpu_ptr(&bpf_icmp_send_in_progress);
> > +	if (*in_progress)
> > +		return -EBUSY;
> 
> Since cgroup_skb egress programs execute in process context, they can be
> interrupted by network RX softirqs on the same CPU.
> 
> If a task sets *in_progress to true and is immediately preempted by a softirq
> that runs a TC ingress program calling bpf_icmp_send(), will it read the same
> per-CPU flag and spuriously fail with -EBUSY?
> 
> Does this critical section need to run with bottom-halves disabled?

So failing close with EBUSY might be okay in the first place, maybe we'd
like to have two PER_CPU in_progress flags, one for softirq and one for
process contexts?

> 
> > +
> > +	switch (skb->protocol) {
> > +#if IS_ENABLED(CONFIG_INET)
> > +	case htons(ETH_P_IP):
> > +		if (type != ICMP_DEST_UNREACH)
> > +			return -EOPNOTSUPP;
> > +		if (code < 0 || code > NR_ICMP_UNREACH)
> > +			return -EINVAL;
> > +
> > +		if (!pskb_network_may_pull(skb, sizeof(struct iphdr)))
> > +			return -EBADMSG;
> 
> Does calling pskb_network_may_pull() on the original skb before cloning modify
> the packet layout? If the headers span into paged fragments, this could
> trigger reallocation of the linear data buffer via pskb_expand_head().
> 
> Since this kfunc lacks flags like KF_INVALIDATE_PKT_PTRS, could the BPF
> verifier allow programs to retain and dereference stale direct packet
> pointers?
> 
> Additionally, if the original skb is shared (which is common in tc and
> cgroup_skb), would pskb_expand_head() hit a BUG_ON(skb_shared(skb)) and panic
> the kernel? Should the packet be cloned first before pulling headers?

Fixed

> 
> > +
> > +		nskb = skb_clone(skb, GFP_ATOMIC);
> > +		if (!nskb)
> > +			return -ENOMEM;
> > +
> > +		memset(IPCB(nskb), 0, sizeof(struct inet_skb_parm));
> > +
> > +		*in_progress = true;
> > +		icmp_send(nskb, type, code, 0);
> 
> The commit message notes this is "mostly for tc ingress progs". Since TC
> ingress happens before IP routing, skb_rtable(nskb) will be NULL here.
> 
> Looking at __icmp_send(), it checks for a routing entry and aborts early if
> missing:
> 
> net/ipv4/icmp.c:__icmp_send() {
>         ...
>         rt = skb_rtable(skb_in);
>         if (!rt)
>                 goto out;
>         ...
> }
> 
> Will this cause IPv4 ICMP generation to silently fail for TC ingress programs?

Yeah, we need the net patches to route the pkt that I dropped in v5,
let's put them back in v6.

> 
> > +		*in_progress = false;
> > +		kfree_skb(nskb);
> > +		break;
> > +#endif
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515194746.50920-1-mahe.tardy@gmail.com?part=1
