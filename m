Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61A431F990
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341330; cv=none; b=WvCmmVZFAayUP+JR7q320lNtBvLBYCja8ZtA8gobVDKSx3KgwZ4vJ7qotLHz1HokIEuzdBQwZRRNNTtysX765DB+CTQnIUpUglo+Zms/K+w+L/KzLtiYMJQtqDKI4nCTYY7azlyapl3QneKZPUj2C6BCLp4/4zS6XA/YLLtj2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341330; c=relaxed/simple;
	bh=hkbCUFGpd78t80fmDHxeHaGDNL1O544ta/CmN8MXza8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Og7H4uP9Q0OTKwsti23f4RIowQArtPiG7j9Rc07rX4JOjGYGKpz/bDt3b/bFoJN1qQ/RSGNuWBij34eiQmz+SEYFcBxWd4/G2KAiQwrFJjZLTR84UetGvYL74rzL1J2c7rEPA/ZDdDo5MMwg2tTSx6Z2xu+HmrdqvMzvvE/MF8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9pF94VG; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9pF94VG"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2cabfb70501so3921265ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785341321; x=1785946121; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I1J2W2Ej9t2c8E57diK+j6vjVNEsyRnKT5FgUYUw3BY=;
        b=L9pF94VGikTu82vNr0elbswyWNVbeN9VXq60m/Ipf+Z+KjgP4nfeHBCr7LTK4fR9oB
         5xsj1TO/PGP6xnjXQ0cJ2vsdsxLreVg9MCkUhyrx6+hkjFPl80EhxUXL7HY/Q+vqvFrE
         D1IXwFAhOaOz4Ewhf6EYrcCF8Qp2DqmLZVEFARJIjnyVIiZfmfAuBuoRIHZr6yrRBrla
         RyfQ6Ma8EbmyjgwYvYcXiudaQqDsRp51s9+lPxUUdi/AzCDC2Oh0lfBUuUo7aIHXA0nZ
         5Kutbdy+pKkQd3/USwZ1yRVOn+XSf1PWKB/r2jcaEo+mcvLebc8wXuPES4g9nAH9QyLX
         WW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341321; x=1785946121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1J2W2Ej9t2c8E57diK+j6vjVNEsyRnKT5FgUYUw3BY=;
        b=AP4qOA6kp93A+iVYMDouretiXt30ZLsPoBjJUNX7i2vkME3gW5zn/IvA/pVdTgUuRo
         U/JRv0IgwWnuozLhMgVkRjLDt2xwwqa/RG6+eHBGmNGezPTTY5bxuh9s9EDWkwVG/ZxO
         W5Jq6MFwxTKIKQGU5cdGhcmTXVUQbxgCTJg/yjgDLD6CR23EF4glczU0zVPqku8ZZ7XG
         rR6vPjdtuGC6sH+VZGOMODWm4LagUbSX1ABZutRwWo8YQNrAQRiGpLFhxfAJx5YyEwxT
         hEuf6yjq+DGL+elZjRND0oSG2fh5uwLx64vIuCOelfcq0XagnPEqGkNoA+czC4xmdEWF
         b7ng==
X-Gm-Message-State: AOJu0YyFPiPjnQFwccqFvvWhwbJXoGgVjPtHrEYruCFCpYa1znbKUtXo
	xl7wKLtiEnAk6fRF9seLCsQ/oUTwOcB3Nbfz4EfjH9st33qAcT0GqCsv5O8YV6niy1E=
X-Gm-Gg: AR+sD10b9GYm/bl/Giq/xlZgGIVlVaWhp6jQJEtcrk3OsPSoGk7nISQCAnsKnwoDxcH
	tlBjDs4iwrxIsSv1l09Rhhd+5rBt2p/7iVXuKwOTMqm9eKndznKieaMbI8HFnXBRi0UndAiU2sf
	sdtWHCwueqUbBBp73u/z2IxiZP/tooHyjgmZsyNOY1wGMc+4UUjIATFmSSTVtbnwfSDsS7vwTPZ
	fUBh6kvfvHcBNG3rpG7BkkgVXiZE5AgSgqd1kHGkDIoWJ3VmsstOfULL/MtERCFmtO/+DPAdCsg
	xkJjSQ1Tb4swM4dGYRAiMaGPZ7KaE9LouSzNV6POtf/zOSPlqqgtMynDjou27n0mMBmHGlm5259
	llHdxB2E9jL8IQsreYeNLl8z8ufw45awKbC5bvraxjtsiFqcQ0UfsG6kbnDNvYpIG6d0Lf80l0c
	KcftXwHzAZnkRkuN0hJwozISW27mA12Un88LJ1GZFPs6Ku/r8YUXHA
X-Received: by 2002:a17:902:d4cf:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2d015db933amr79219805ad.42.1785341320867;
        Wed, 29 Jul 2026 09:08:40 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc9bd4sm13696275ad.48.2026.07.29.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:08:40 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:03:51 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net 3/6] xsk: clear metadata pointer when no timestamp is
 requested
Message-ID: <amojqDqhN1v3p2ky@devvm7509.cco0.facebook.com>
References: <20260727161959.885642-1-sdf@fomichev.me>
 <20260727161959.885642-4-sdf@fomichev.me>
 <20260728162040.7805A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728162040.7805A1F00A3A@smtp.kernel.org>

On 07/28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Integer overflow in `xsk_skb_metadata` when calculating `skb->csum_start`, leading to a potential kernel warning and panic (DoS).
> --
> 
> --- Patch [3]: [PATCH net 3/6] xsk: clear metadata pointer when no timestamp is requested ---
> commit 814027e56069dbb5716ac5b9f7f38aebab332dd6
> Author: Stanislav Fomichev <sdf.kernel@gmail.com>
> 
> xsk: clear metadata pointer when no timestamp is requested
> 
> User space can change metadata flags after request processing. Rereading
> them during completion can therefore make the kernel write a timestamp
> that was not requested when the packet was submitted. Clear the metadata
> pointer during request processing unless timestamp completion is requested.
> 
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> 
> [ ... ]
> 
> > @@ -998,6 +998,8 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
> >  
> >  	if (meta->flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
> >  		skb->skb_mstamp_ns = meta->request.launch_time;
> 
> [Severity: High]
> This is a pre-existing issue, but can the checksum offset calculation
> earlier in this function cause an integer overflow?
> 
> When handling XDP_TXMD_FLAGS_CHECKSUM, the code does:
> 
>     skb->csum_start = hr + csum_start;
> 
> On architectures with 64KB pages, csum_start can be large enough that
> adding hr wraps the u16 skb->csum_start. This would result in
> skb->csum_start being smaller than the headroom.
> 
> If pool->tx_sw_csum is true, this then calls skb_checksum_help(). Inside
> skb_checksum_help(), the offset is calculated by subtracting headroom from
> skb->csum_start, which yields a negative integer due to the wrap-around.
> 
> When this negative offset is compared against skb_headlen() (which is
> unsigned), it is implicitly cast to a huge unsigned value:
> 
> net/core/dev.c:skb_checksum_help() {
>     ...
>     offset = skb_checksum_start_offset(skb);
>     ...
>     if (unlikely(offset >= skb_headlen(skb))) {
>         DO_ONCE_LITE(skb_dump, KERN_ERR, skb, false);
>         WARN_ONCE(true, "offset (%d) >= skb_headlen() (%u)\n", ...);
>     ...
> }
> 
> Could this allow an unprivileged user to trigger a kernel warning and
> potentially panic the system if panic_on_warn is set?

I guess.. We can do a similar size check before calling skb_checksum_help
to avoid WARN_ONCE.
