Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9AD4052BE
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341323; cv=none; b=A+fPy8MWLIkMTsEFLPuG5YxD8xKGiY9AHb301q60q1I9TIgZ6pk6WPlciuQUzkN0AcvSTVoTxAMq12vkvosNWEi0YxeMw8bOOQTDIK9lLcazR6uUq87PjwGoUHJK97i4jRfsZjhiQ+946OtfdZXSfS+jizq/SLs8n9BLh00MZv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341323; c=relaxed/simple;
	bh=RuGK7GoIYQg1A1vvn5oTwJjNqdkv+nRmqviNxsgVaX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7orymuaMA5QHbl3GaY5Gft2Oi9Ucp4/ue2yB5y/LRBjebK51hbyWxbK0od0Dkej8Fa9sJvDf+2ftw9J5wXVv6LoXfWXdSsDUQ2Yr1oohkuPbXXe/fTGQS0gvb4Sg30By82OEb0twr36sfxwZOvRv5rCdWnAVXDH+YBqUI3YUSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+cdyufW; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+cdyufW"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ca4f02483cso1812725ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785341317; x=1785946117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tx1LHO52ziNj3TMGJJTE8eQcLC2MzAr77iy3lm/1Tq4=;
        b=D+cdyufWZUP62x1xx2USfY+wnugxXYqHFYJFLeLwHw+7Iul+ihhoMwtll7lu8teFXg
         PPFc+QSdu7RKFR97rrb1zLcT/NVEA8LL2cHY/h2XVEH4WzWFOe+EL8UW5cHoO4Tou+pW
         ysnhq8AmLfO+Qec/zcSEKEKsS3XtMqSxYCwYLT5sVFWSeuy+5IzHyUs6BWdsNHUhNeNz
         6+OnqPrRZjhUDAeibn4wYmCOX5ao73LrpTxYzBMD+G0ElNBPq8KiXVv5rSd3sdaKhPSL
         l+pMYYIHvlihJJa0zrOM/cl6G5ep5CfzUhJWqwhpPnvMbTnkjZjUc1KXAtw4+xD/Yu0d
         q2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341317; x=1785946117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tx1LHO52ziNj3TMGJJTE8eQcLC2MzAr77iy3lm/1Tq4=;
        b=HIvhIB3Evz2Vaqkprn8UKlBlyDirqlvYoJjUqcmsDrpOQ0RF4wUrYTBoNRG2fpIpQk
         0n6zA9pVDjNv92XBwgukSaML0SGxT+1Y/OnethBL+KruhUtZdKYnZBY2evD4M5DTgtwD
         mDgKJh58k+joAAekv2WXMKunDp6Zt7BpZ/IslJepNzg/lzoNCy/cXsO9mmAbd7tmQeLs
         7C/U6qRHoJQVW4OlPijF/Cuw4zyVLuE9r2bwEb39t5syYSY3m8r8xzwifse5ZHoiRqML
         otGGZSD3UTmlKOgGte2aLZNh9glTq5D2GdyNs6Mdy7ZnM7ZLujkH/j04sX27q/Laeo+S
         LkAQ==
X-Gm-Message-State: AOJu0YwhSm+38YbncM+m4S0acH7+nirQdzQc8owAjKM7CLVPL1I1nrlt
	u+5W8sakILdInbQl1OzgaVb+hkjT4XYsaFLG71I4mmwNFbfqIuv2EXOdIE5SKsB5rZk=
X-Gm-Gg: AR+sD11htjGomEA7nqM6cbVpblzlCKFndF6J+dGj+kDEZOCFn+KArtqvpcvGOFvIwKp
	o6FGmWF3FeBsgBBRj2Peebmg5XKGZRsDM+FfI0UX+92WQXiwB4YhcHiVoza2wTE9DCcaRSw3rex
	Bm6pVxQ0QbEHmvN5FjGXhwBs6w2KCZTm99kMPjeb3ZfTw46LmRlswgX7kEYHUubpw0SC+XBiRKT
	rQRkKRiwsOu4GKCZUg7V0WrDq7bfYpkEj0+x68R6rlHtAdi1GOJT+pAGDoaz6RVEvhcbEBTHQ9J
	5c2v8nehetjsZXk5B79mS2C2SLMLsG5Weev/2iIJdEbP9NgM+eHhZz9NWsCG5B/9wNTpJ4Ym9Hf
	LQarSe5PoPPdtikoBHE+t2nqGkXYiVLSFn4RfFSOKuC2ZDfApfLmhcCJTsJkXxjgRn4n9aAn3U5
	zDSum/73qjZuPceG7k1wtjf88ePvaxi5w/E75N2p+fsvJu5gYMbcMokFU+hNibOAS9
X-Received: by 2002:a17:903:1b07:b0:2ce:b43e:44da with SMTP id d9443c01a7336-2d02672bacbmr29921865ad.17.1785341317273;
        Wed, 29 Jul 2026 09:08:37 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5f::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a167b5sm13688205ad.7.2026.07.29.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:08:36 -0700 (PDT)
Date: Wed, 29 Jul 2026 08:54:58 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net 1/6] xsk: require at least 16 bytes of TX metadata
Message-ID: <amohnC9dwEkquF1z@devvm7509.cco0.facebook.com>
References: <20260727161959.885642-1-sdf@fomichev.me>
 <20260727161959.885642-2-sdf@fomichev.me>
 <20260728162044.1D70B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728162044.1D70B1F000E9@smtp.kernel.org>

On 07/28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Incomplete Fix / Out-of-Bounds Memory Read in TX Metadata
> - [High] UAPI ABI Incompatibility between 32-bit and 64-bit architectures
> --
> 
> --- Patch [1]: [PATCH net 1/6] xsk: require at least 16 bytes of TX metadata ---
> commit 8f587b21f2b30dd32c9e63e0817476297538dfb0
> Author: Stanislav Fomichev <sdf.kernel@gmail.com>
> xsk: require at least 16 bytes of TX metadata
> 
> AF_XDP accepts a TX metadata length as small as eight bytes. This commit
> requires a minimum of 16 bytes of TX metadata to preserve compatibility with
> applications that do not use launch-time metadata while addressing
> out-of-bounds reads.
> 
> Link: https://lore.kernel.org/netdev/20260720155210.34229-1-blbllhy@gmail.com/
> 
> > diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
> > index 58da2f4f4397a..cd8643360eb3a 100644
> > --- a/net/xdp/xdp_umem.c
> > +++ b/net/xdp/xdp_umem.c
> > @@ -210,6 +210,8 @@ static int xdp_umem_reg(struct xdp_umem *umem, struct xdp_umem_reg *mr)
> >  	if (mr->flags & XDP_UMEM_TX_METADATA_LEN) {
> >  		if (mr->tx_metadata_len >= 256 || mr->tx_metadata_len % 8)
> >  			return -EINVAL;
> > +		if (mr->tx_metadata_len < 16)
> > +			return -EINVAL;
> 
> [Severity: Critical]
> This is a pre-existing issue, but is a 16-byte minimum sufficient when the
> launch_time flag is requested?
> 
> If a userspace application sets XDP_TXMD_FLAGS_LAUNCH_TIME in the metadata
> flags and provides a tx_metadata_len of 16, it appears we can still read out
> of bounds. In include/net/xdp_sock.h:xsk_tx_metadata_request(), the code
> reads the 8-byte launch_time field at offset 16 when the flag is set:
> 
> include/net/xdp_sock.h:xsk_tx_metadata_request() {
>     ...
>     ops->tmo_request_launch_time(meta->request.launch_time, priv);
>     ...
> }
> 
> If the descriptor addr is placed at the very end of the registered umem (for
> example, desc->addr = umem_size - 1 with len = 1), reading 8 bytes at offset
> 16 extends beyond the umem bounds. Since xp_aligned_validate_desc() validates
> based on the chunk, does this allow reading into potentially unmapped memory
> if the launch_time flag is set?

Lanuch time is handled separately later in the series:

- [PATCH net 4/6] xsk: validate launch-time metadata size

> [Severity: High]
> This isn't a bug introduced by this patch, but does this tx_metadata_len
> validation correctly handle 32-bit applications running on a 64-bit kernel?
> 
> Looking at struct xsk_tx_metadata in include/uapi/linux/if_xdp.h, there is no
> explicit padding between csum_offset and launch_time:
> 
> include/uapi/linux/if_xdp.h:struct xsk_tx_metadata {
>     __u64 flags;
>     union {
>         struct {
>             __u16 csum_start;
>             __u16 csum_offset;
>             __u64 launch_time;
>         } request;
>         ...
>     };
> };
> 
> On 32-bit x86, __u64 has a 4-byte alignment, which places launch_time at
> offset 12 and makes the total structure size 20 bytes. On a 64-bit kernel,
> __u64 is 8-byte aligned, placing launch_time at offset 16 with a 24-byte
> structure size.
> 
> If a 32-bit application registers a 20-byte length, it would be rejected by
> the tx_metadata_len % 8 check above. If it registers 24 bytes but populates
> launch_time at its native offset 12, would the 64-bit kernel read unexpected
> data from offset 16?

Noted, I don't think we test 32 bit arches, the sensible thing is to
probably add some padding (potentially breaking existing, if any, 32
bit apps). Will put it on the todo.
