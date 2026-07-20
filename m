Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631738B7B4
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579497; cv=none; b=lTYe5AzKX11ZZeuUsvyIT4Xa/AuyqnqrT1UXZqCh5TIMUoO3a2OTj3AmL4ez19MkRbdVIZ5+08k7mVVMWfHJqelt1JEgl01Gh46nDb6p1MJq5IwrZgQ/s/KoFxd6mqavi/QseOyc0vIvXtNadMLxr3F04jtYcgJ7Ao/RhbCeP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579497; c=relaxed/simple;
	bh=OEVRspgpZFEFYjbibDV/9ytiChyzOpbNEbnCQl9h1/8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svQZaHN8Up40MrZ2HkWCgWFnwCMXdliU8ucW7lIMOPj/guX8fFuvuGbjms/3TqoOWasJNd7vkTAKA/Y5UP+HBtvNETk8JKgGoDRDEEdYo68QwHkunjFgwIPF+j8M9DA/08G6QPje1SUffIMfcYM6zh+376Df6/jGwRiwbN4U4QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dozFQakE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dozFQakE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49548e01d02so16186015e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784579494; x=1785184294; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JNXrl8uAnSaabKLk4mLhy/7LlQjg64laH35dy7W7Yjg=;
        b=dozFQakEGcsI3Kxcu2cfzucBbfNG14N0dG4vTfoBysGJH92Kqd5MAfT2g93tBe+bbE
         3OFzDL2k//5mvr6sVD7PCt7YScpTiOzhbPVB07jt4t3IIQOTO/O1Bnrzai/bADwKN7fA
         zeTlASkeDGTWDFxFUp5ZSih2wmxdUdHKRBwpEvwXAbDBaZjxYhtec6rb4rYZsTDpZOkF
         n8aUyJv8udqYIcL7i+++A1pmahcPUD7T8xQ2zBrqMiocTdxYbI1WSfPXaORtAwwjo5xW
         d6KPCJuOvCa6xi2FyqqPn19cxV2Ib+umf/HtbhaEV2Llp19ZlvyEtqrzDj/8gIG/s+JU
         gSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579494; x=1785184294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JNXrl8uAnSaabKLk4mLhy/7LlQjg64laH35dy7W7Yjg=;
        b=M8Xf95yLmLoUvuX+e89vy06zbD9Bth2UXKpU3o21e04uDcwNrvdNn2ANnVQ8hLMU5Z
         lE1zdrvu091t2UnyYC8lcn0PzuqdM3zmuCGqKvk6Ax058mnbklfMPs3RTGMFZcxf7pbM
         Kxz+xsTwrSwd/ektVu2Mw0OX/l77/9Zf1UKM4Xa0GGOyof8r1U1b4Vj++0EGGlXEUVa/
         sWZpTWskw8H5juxauXwazd8Lqv8SIuj3ZJg+SSJ+pyBAGb8nyu73GkgBUqP0KsoW6tma
         IZ9HznsbqoIzCY+cUNID0joTZCRfYaDOr2CxebBW9CBl5Kd0nnMvvE/yHZlGEWAFi6VX
         Igxw==
X-Gm-Message-State: AOJu0Yw/7NvHl8UkVDvcmpierPXhe4oXAcUeNd8vIMfQiZBR/UqNd1n/
	1tD/Lnio4uKxX69u9kmigSmvsVpmAq0jiA+X8WnqQd98fIZDD7l5pHzfCf764OeK
X-Gm-Gg: AfdE7cn9E0ulcnIdVAUVaSh6rbBvqgPUqyedjAlN/83Fe7cpBfp//DPkCtMJw8umfFV
	gUnHDrjbn4Gh6oA6/GksjOwIxCMLP6Bch5hOlHD0NAByZd8nVmI6XJSgBfzWyf+95WesCmxK2Iy
	+7faZW9q7DNn7ciuFJ1iteBQMdcC+wM0WjjVGu1sjFs+m+cvrmUSkvnedBLgEaiea/b7g/i+2IA
	BhtJQ6bEE/6+BqoReNRERhi2DHGHYLYyH10CWWaPQxboL1hOgC6mPjrvAxDU5t6tASaQo2wA56n
	j1Phf36/78CY11veQu2lzD1E7iq+e+oqZgL9OiLBu1eDocz1VfqnVfAdebYZV/B3YgVzF1FY+8T
	aj1WGZzWM72rcq5UhX7v+mc1cNV1VnM5fzI6+mB5V7C1cKXgVgq/UmxS3H7ZZuKm7Tg==
X-Received: by 2002:a05:600c:524c:b0:495:4e12:6ae5 with SMTP id 5b1f17b1804b1-4954e126afamr167377215e9.26.1784579494090;
        Mon, 20 Jul 2026 13:31:34 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f69e5eff1sm23614805f8f.19.2026.07.20.13.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:31:33 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 20 Jul 2026 22:31:32 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 6/9] bpf: Factor callchain_store function from
 __bpf_get_stack
Message-ID: <al6FpDgLN6VRaHKO@krava>
References: <20260720085351.655075-1-jolsa@kernel.org>
 <20260720085351.655075-7-jolsa@kernel.org>
 <20260720090721.2D26B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720090721.2D26B1F000E9@smtp.kernel.org>

On Mon, Jul 20, 2026 at 09:07:20AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The 'size' parameter in callchain_store() is unused.
> --
> 
> --- Patch [6]: [PATCH bpf-next 6/9] bpf: Factor callchain_store function from __bpf_get_stack ---
> commit aee65ba10526fcf4c6320ea660fc50a555551cc1
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Factor callchain_store function from __bpf_get_stack
> 
> This commit extracts the logic for storing trace entries into a user-supplied
> buffer from __bpf_get_stack() and places it into a new helper function named
> callchain_store().
> 
> > diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> > index a64b14ffd1e8e..b990643f25cd8 100644
> > --- a/kernel/bpf/stackmap.c
> > +++ b/kernel/bpf/stackmap.c
> [ ... ]
> > @@ -747,6 +747,29 @@ const struct bpf_func_proto bpf_get_stackid_proto_pe = {
> >  	.arg3_type	= ARG_ANYTHING,
> >  };
> >  
> > +static u32 callchain_store(struct perf_callchain_entry *trace, void *buf, u32 size,
> > +			   u32 elem_size, u64 flags)
> 
> [Severity: Low]
> This isn't a bug, but the 'size' parameter doesn't appear to be used anywhere
> within callchain_store() in kernel/bpf/stackmap.c. Could it be safely removed
> from the function signature since the bounds checking is handled in the caller?

true, will remove

jirka
