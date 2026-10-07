Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53773AD50B
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 05:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791351858; cv=none; b=PuXhJbEZP+miHZm/a9Ux9BRVVOy+6qoumW7UY+Nvcy9s3JTbXiyczHvyUcuKccIZwwVL3WZKt+D0jYx6z9TuQ4+2ftFb95gWMG1bYipXVuS7iO7ksUdsnmGRPFGRooBlWHnGaOTOtmhuA2Uw2JMCGVKEWneV0x4e82PtETbEPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791351858; c=relaxed/simple;
	bh=f8aLXSRx5SAlb/Mv8CV/jT1RurAExHK87pBf4HmqrAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oybq0oNLUMT+Z6eCIbQHQlq34DcD4Xr05TVN366BPW5YfsqgOeQxo01SbUorRzvhMqwat2jqkuOphHTFE1Zo140w5w/QTFnEHT8cUj4MkBTCI5S2xuTVKnZ5S4HMIkIbfhlnf9m72JGB1besDgpTBOlz0y03wr6ezvuzNrnRE+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=U1UTindz; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="U1UTindz"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6dddc514bcdso2154603eaf.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 06 Oct 2026 22:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791351856; x=1791956656; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0kx8gNuH5onSt/gSEpGU/Vz6LH6Iy6E8WdXk8WtkLM=;
        b=U1UTindz27wgxo2nQ8YObFwK0qEK3t428MtcUNL/37DA5p/w5oeQBmROztv6fXWHDk
         +a+gZRgTrZINyyfRejWHkg5vefFO6Iw4DaAH9ATdg0NWhN9Vaabj/R3F9CpuLPQwSysD
         id7P0st4VDBJETE/geTSSBIKxMB4d+mU61fEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791351856; x=1791956656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q0kx8gNuH5onSt/gSEpGU/Vz6LH6Iy6E8WdXk8WtkLM=;
        b=Bu1MBX7aY/6FmsfCCfRYAgk+3uIvTwqGv0xHlRcrQ8nonvbyFPQfb8+AZS2lCXuJCg
         lUe98rR/fcqGPSzjqyhWlQ4Gp9rpb4YiUaIx8phFp31Y2a+2Bvf44JdAioJchCZxBXpq
         I4k9rVM0g8ICSkIbYaWXMNR0F61fqNHN2xRYZu6o9g43uE6Ai1cXh6lUB3tL/nD/0cBX
         tIcv4iWtMbpIIgEUNxaIERI3P6+k46UKI4hYomeExvuCmxeAbtHLxaj9hrJ1QTht0EtZ
         Fcb9bIfjwLTOA1fYDhlDtEK9Ep59VIdySrL6bpx/VXROPyPF/xcisUhYT/xt1bVJvlJp
         wQ/A==
X-Gm-Message-State: AFuF++kZ27Bs1zd0GWpQfTeqXquXhqmHE7lGUl3UE5gDZ/TDc4ujHQbi
	Fm6rkL2GwRtTb75mChufd+BId0/u5M2n3a0YEBrzHQToLEO9Gtzvcep5qQEb4i63JbNwA7BvOtv
	VBNYxaGA=
X-Gm-Gg: AYBFou0SlieMRfTY7YHR0XOBh3vpvONRQsYA8L3gEVieDLI+10YBnJPZghX73CLnyMP
	EbelxAutonbJMA9hnGqO7lIwilDISMj0G5Amup+vVTXXFCgZVP4WIgwqo/mg5NRyq9aVqNxT+G1
	sBdMz3nDWr6njGop6FML6mIdIkXchNbLMi6FDyB2v5PTqM3DsAILQsYyn8JOdHckADjLU7KVhPE
	ENBW462SdBd/q9hkG4QsaXKOowhrhQOAyqG9o+qUuCSMfE8glTxBE0fnorJnofSelk7NGCgbIsQ
	pHcvAl5DkZKS94gXZsOLIj9DK/Opg2qUnT7FPZet/eVT8IVQ4s880nQ+mreVuS+HH3r72f5EiH5
	PGxRuuLyKlzkzwuNy1jF000xy+wUpL9xiy4u0r2Ll/rTKU23gMCsuCEjrFk815b0ZTZLAVFvgMm
	QUoZW5aQSUsN8OKr7W3fWasz2BLfxqjzyVwooozJZvq61WW/CmNk0MkHuab0yj5QhPWPYehPH1i
	3VGl2JIc12emRXr6SlZgxLZpBJyjHnvUQFbUDfJzXW6xIZkYQZVMQ==
X-Received: by 2002:a05:6820:81d3:b0:6d7:7347:cb91 with SMTP id 006d021491bc7-6e7a2e420c0mr1597107eaf.5.1791351855660;
        Tue, 06 Oct 2026 22:44:15 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adcd0db45sm1650290a34.25.2026.10.06.22.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:44:15 -0700 (PDT)
Date: Tue, 6 Oct 2026 22:44:12 -0700
From: Kyle Zeng <kylebot@openai.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf/hw_breakpoint: Avoid leaking private x86 breakpoint
 ranges
Message-ID: <asXcLNxqlPMILbxn@com-75606>
References: <20261006222519.43193-1-kylebot@openai.com>
 <sashiko-outbox-162494@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-162494@kernel.org>

On Tue, Oct 06, 2026 at 10:44:55PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] perf/hw_breakpoint: memcmp validates uninitialized flag-gated fields
> --
> 
> commit 0cb8c384abc8b74fee8923d87b586e123993d285
> Author: Kyle Zeng <kylebot@openai.com>
> 
> perf/hw_breakpoint: Avoid leaking private x86 breakpoint ranges
> 
> This commit addresses a security issue where private x86 breakpoint ranges
> can be leaked to unprivileged callers by validating immutable attributes
> before parsing a modify request. It also checks x86 kernel-breakpoint
> access before consulting private blacklists and validates instruction
> lengths early.
> 
> > diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> > index 789add0c185a0..1f0e7f63ba82c 100644
> > --- a/kernel/events/hw_breakpoint.c
> > +++ b/kernel/events/hw_breakpoint.c
> [ ... ]
> > @@ -765,10 +765,6 @@ modify_user_hw_breakpoint_check(struct perf_event *bp, struct perf_event_attr *a
> >  	struct arch_hw_breakpoint hw = { };
> >  	int err;
> >  
> > -	err = hw_breakpoint_parse(bp, attr, &hw);
> > -	if (err)
> > -		return err;
> > -
> >  	if (check) {
> >  		struct perf_event_attr old_attr;
> >  
> > @@ -778,6 +774,10 @@ modify_user_hw_breakpoint_check(struct perf_event *bp, struct perf_event_attr *a
> >  			return -EINVAL;
> 
> [Severity: Medium]
> Does this memcmp() inappropriately enforce equality on uninitialized, unused,
> and flag-gated fields?
> 
> Userspace is not required to zero unused fields in the perf_event_attr struct.
> If a user opens a hw_breakpoint event with uninitialized stack garbage in
> unused fields (e.g., sample_regs_user, config2), and later calls
> PERF_EVENT_IOC_MODIFY_ATTRIBUTES with a new perf_event_attr to modify bp_addr,
> the new struct may contain different stack garbage.
> 
> Since perf_copy_attr() copies the struct verbatim from userspace, this
> memcmp() fails when comparing the original and new structs due to the
> differing uninitialized bytes. This will spuriously reject valid modification
> requests with -EINVAL.
> 
> >  	}
> >  
> > +	err = hw_breakpoint_parse(bp, attr, &hw);
> > +	if (err)
> > +		return err;
> > +
> >  	if (bp->attr.bp_type != attr->bp_type) {
> >  		err = modify_bp_slot(bp, bp->attr.bp_type, attr->bp_type);
> >  		if (err)
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261006222519.43193-1-kylebot@openai.com?part=1

old_attr is initialized in hw_breakpoint_copy_attr. I don't see use of
uninitialized data in the path.

Best,
Kyle
