Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A045C70C
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341328; cv=none; b=S/zWGy+gB8Eenoniuy19uDbEbRC4WNN/gM0LCCLizUb5j3oGzX1Y+H6xyChPNYKdRwcVg9lan6aUYYYDMPCDPn9+JOHnV+Bmisb3r8g8dQ27bChLpkD+Z4aWf1sA6Hl5E6i6XzQYY7TYdVVFEXyl8xrrTHIpmaim9khiSffa5Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341328; c=relaxed/simple;
	bh=xz3GfScgjQn6YWdU113ZIQs64S4ynT5uCuPT+HFsPSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxzqLWl0yOzsao1YAKU+TkvtXa8VWDNwKOeVtKOttP+WztKEq52lD7X5cvx9h7bYa0M78shOG34H4+OwkouvfcoyzdXeRLCDIVD7fGqbxUGBSIag0Qr/IFkZhWiIWzcJTYlQ6rBPKB8Ty2WC+W0gWvMtfBEETAP/v5n9zMhBKEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNXOe+Xq; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNXOe+Xq"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so5912995ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785341322; x=1785946122; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoTOybwELG8BsdulcXSV9k7fS3IZ3nIiKDfqyFmy64o=;
        b=fNXOe+XqXyRsdUXoF5phO34zpHcPjMda06qHgt1GkbgEzsXehZayed7UtC94ihc7Jw
         vc4DpuinIq980Y9X0C65ZOQ0UFMsv5rmCRUyj+C5cAaLQgll1B5P0zwtlVssESRsXf8s
         e+nPSBiWzrEO4k7D0jCAjlaOvDjbWtzmN5qy3X1co+s6dTCNaT39kaK45nMGIHCHS8ag
         T4M0MPiLI+U5hvWwbAI1K64JeFSUtik8eqjfxIAhnPaVVCQBmbeTrN2Zdmf9jr33T2Ne
         sXLy2QXu8aWEfaobE7SobibiBpgISzSsbaAd7hEwNKt2R8W3+vV6gWHy5LjcyWNiHJ8T
         mJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341322; x=1785946122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoTOybwELG8BsdulcXSV9k7fS3IZ3nIiKDfqyFmy64o=;
        b=Y6Rqgkf/S26sC2pxWLkI3f4KiGiD3FKd/b4MBpVCVjvwLLZCeBMmeIgcavlVYxG8TW
         eSOlaYKwaU9gWgvRqTL/wH+qEgnvnf9ylxu6bSA/Z+7OblaVZ6yndRMJXFQ68v/hnit9
         Bj68G9e9dNG9lbexNOSx5psPmsMUlAGXbsZ/CwktJlUuXrFKYc8VYAxt6E4bGOgs1i5U
         Xx4hkojNh/lBLXA6fZ77uwq8Lo1SYowBKsu/N44rbMu98HTO8ZuaYWB8xmRzsUG2kkIu
         7v4an3YPlHAWXuzqSbVZvL/NwnWXp8H0iJ6oDzODv1KAkmJ9PgPWJt4GnT4mqBVSqgJ/
         bh7Q==
X-Gm-Message-State: AOJu0YztMU9I00Js03VNgfXH9MjLRRVv4m5RJj3Pb0HUvTOeV3Kz3onO
	gYUG/WLKfM+NxQXV4gtrtOXgp7OiGHvD3rDVKBmvKsFBVmq4m0ROQf4mSJvVg5+4doY=
X-Gm-Gg: AR+sD10R+1jZI5BqQgcxrxyg3DZMBv9ZGJeiHxtYlw/6QEZRLfcHeCkQM2dYR4RbiE+
	rfwZTs2i4IPD7A8fzysytJn4AC5RXQCks7N6UUwDmzThK+kiBkFh/+xJRfohQqjp8jArnztWVNN
	3fdHnaXFXn0zNkpRfSbP9DA11MhFFtaU07TujQYR34m3wF4Y41rMPOqR+Tnvn1GOd+sGxY7aWZe
	LYI4RiEULOVNSlwVjgPaFymXrqoth8lG91qy9m5QNxUHEHGBUhJ0GVVcc9LWdejpqHEMMQB8yis
	F1en0JBWtPO8QguTTW2zamKdj4nhHSaf/sA7Q+9yUgPm3nyui6we9G0kF2ILOAhrxXGfhS+Skah
	OLTj805xiUcb3ctXk9Nw7f5xRekOpDDpiA42qQJ1FBdI9fIWsF7JC5dtvKCmNakQg9dyAflsDdS
	8fZj1jFdCpX80yhMpsE4b8dxVluEYF1dKpobiAOPhXP0y2Fd4b7JnLPQ==
X-Received: by 2002:a17:903:1a85:b0:2ca:ea56:7a58 with SMTP id d9443c01a7336-2d015d95234mr81144815ad.37.1785341322345;
        Wed, 29 Jul 2026 09:08:42 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:41::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a4596esm13695435ad.23.2026.07.29.09.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:08:41 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:06:25 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net 4/6] xsk: validate launch-time metadata size
Message-ID: <amokauk_mQRaBg_w@devvm7509.cco0.facebook.com>
References: <20260727161959.885642-1-sdf@fomichev.me>
 <20260727161959.885642-5-sdf@fomichev.me>
 <20260728162039.4E6A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728162039.4E6A21F000E9@smtp.kernel.org>

On 07/28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Time-of-Check to Time-of-Use (TOCTOU) race condition in zero-copy TX metadata validation.
> 
> Pre-existing issues:
> - [Critical] struct xsk_tx_metadata has a layout mismatch between 32-bit and 64-bit architectures, breaking 32-bit userspace compatibility.
> - [High] Calling `skb_checksum_help()` on an empty or fragmented SKB in AF_XDP zero-copy path drops packets.
> --
> 
> --- Patch [4]: [PATCH net 4/6] xsk: validate launch-time metadata size ---
> commit 812dce9383d33c01b8fe81b1fbbcc8371998ca62
> Author: Stanislav Fomichev <sdf.kernel@gmail.com>
> 
> xsk: validate launch-time metadata size
> 
> This commit validates the launch-time metadata size by rejecting requests
> when the registered metadata area does not contain the complete field. It
> also snapshots the validated flags for the generic transmit path to avoid
> inconsistent decisions if user space changes the flags concurrently.
> 
> > diff --git a/include/net/xdp_sock_drv.h b/include/net/xdp_sock_drv.h
> > index 46797645a0c24..68a7876013572 100644
> > --- a/include/net/xdp_sock_drv.h
> > +++ b/include/net/xdp_sock_drv.h
> [ ... ]
> > @@ -260,21 +260,28 @@ xsk_buff_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr)
> >  	0)
> >  
> >  static inline bool
> > -xsk_buff_valid_tx_metadata(const struct xsk_tx_metadata *meta)
> > +xsk_buff_valid_tx_metadata(const struct xsk_buff_pool *pool,
> > +			   const struct xsk_tx_metadata *meta, u64 *flags)
> >  {
> > -	return !(meta->flags & ~XDP_TXMD_FLAGS_VALID);
> > +	*flags = READ_ONCE(meta->flags);
> > +	if (*flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
> > +		if (pool->tx_metadata_len <
> > +		    offsetofend(struct xsk_tx_metadata, request.launch_time))
> > +			return false;
> 
> [Severity: Critical]
> This is a pre-existing issue, but the UAPI struct definition in
> include/uapi/linux/if_xdp.h has two __u16 fields followed by a __u64 field
> without explicit padding.
> 
> 64-bit kernels will read launch_time from offset 16, while 32-bit userspace
> writes it to offset 12.
> 
> This newly added validation explicitly expects the 64-bit structure size,
> which solidifies the layout incompatibility.
> 
> Does struct xsk_tx_metadata have a layout mismatch between 32-bit and 64-bit
> architectures that prevents 32-bit userspace compatibility?

Same as the other email, yes, adding padding here is probably a good idea,
will send separately.

> > +	return !(*flags & ~XDP_TXMD_FLAGS_VALID);
> >  }
> >  
> >  static inline struct xsk_tx_metadata *
> >  __xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data)
> >  {
> >  	struct xsk_tx_metadata *meta;
> > +	u64 flags;
> >  
> >  	if (!pool->tx_metadata_len)
> >  		return NULL;
> >  
> >  	meta = data - pool->tx_metadata_len;
> > -	if (unlikely(!xsk_buff_valid_tx_metadata(meta)))
> > +	if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags)))
> >  		return NULL; /* no way to signal the error to the user */
> >  
> >  	return meta;
> 
> [Severity: Medium]
> The snapshotted flags are validated for size compliance in
> xsk_buff_valid_tx_metadata() but then discarded, returning the
> un-snapshotted user memory pointer (meta) to the driver.
> 
> Later in the zero-copy driver path, xsk_tx_metadata_request() re-reads
> meta->flags directly from user memory:
> 
> include/net/xdp_sock.h:xsk_tx_metadata_request() {
>     ...
>     if (meta->flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
>         ops->tmo_request_launch_time(meta->request.launch_time, priv);
>     ...
> }
> 
> Does this create a Time-of-Check to Time-of-Use (TOCTOU) race condition in
> the zero-copy TX metadata validation where userspace can concurrently enable
> launch time after the size validation?

It is explained in the commit message:

  Note that only xsk_skb_metadata is properly using the flags,
  __xsk_buff_get_metadata ignores them. Next commits address that.

> >  }
> [ ... ]
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index fcc6f17f35760..7855ee09c4b64 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -967,15 +967,16 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
> >  {
> >  	struct xsk_tx_metadata *meta = NULL;
> >  	u16 csum_start, csum_offset;
> > +	u64 flags;
> >  
> >  	if (unlikely(pool->tx_metadata_len == 0))
> >  		return -EINVAL;
> >  
> >  	meta = buffer - pool->tx_metadata_len;
> > -	if (unlikely(!xsk_buff_valid_tx_metadata(meta)))
> > +	if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags)))
> >  		return -EINVAL;
> >  
> > -	if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM) {
> > +	if (flags & XDP_TXMD_FLAGS_CHECKSUM) {
> >  		csum_start = READ_ONCE(meta->request.csum_start);
> >  		csum_offset = READ_ONCE(meta->request.csum_offset);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but for zero-copy SKB
> construction (xsk_build_skb_zerocopy), the payload is populated strictly in
> fragments, leaving skb_headlen(skb) == 0.
> 
> When a user requests XDP TX metadata with checksum offload on a device
> that uses software checksum fallback (pool->tx_sw_csum),
> skb_checksum_help() fails immediately on such fragmented SKBs by returning
> -EINVAL, which drops the packet.
> 
> Does calling skb_checksum_help() later in this checksum block incorrectly
> assume the SKB has a linearized payload?

We treat skb path as a mostly test-fallback, so I think it is ok.
I'll add a headlen check just to give the users better signals..
