Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659621;
	b=yhOKLO526hVSd+XugIUZBWs/IylGJoz+TLWlunpVN4MkHfx6CMgMRYpq+1/Ta+2y48xP
	 0FV35ontlYOzRNAZMNOPbR3YpEzWmo7e50x4xPe3u66P+SUJs0o9Zm08u3TeKuEJwKEJJ
	 Qea1MIzNJHbc5/FbuOXOW7NdNVgcWRsAR6frdD5yV4ip24+OUPAKz1NUvTe8FRliHJqHT
	 bxkgdk+/FQSGygMGiUbmFgrOeGGk+rQtXP3nmIXUbIlIMI53AXkvKzZfLshvlh+CIupDR
	 LrHKX6OtspZYm2OtUh2zhmvmm0hyTAU8OtcfF6yW7pwli4gAgugaw0QrNu6Oq/VNYPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vXkfhgcH6rL/dKIELLPsFfXbm/yMJGywtKtor6k+GYY=;
	b=djcMQqLFBVs9XxedRurpRVcYysn4veZMrl8e5cnXfp0Ky+Em+R/KwEklX6HhisMhfRFW
	 S4sTvQewIy9bkhijjTfvFZgr84Tg+Y9mU8TqmvR4G+1rUtjGRa44GA/AdU2WK50euC7oJ
	 30L1uRjqXKLlYjAa4RpFvYzvCB1/JjZsI3kk+EQNo95KzNR7fuPEH4O9SW5CYD1p8Wwgi
	 pcvO0MER4RxA3Tuk0YKJCszt/H2YKZEaiKWANRC7zZQjN8NrK07mifYO12Px/6+hKH9Vx
	 do38EwX8jrd1Mq86ogxJMecEpOh+WUnJxx6Ot6w2j6Q5XEqs/7gBxMt3V1acTI0i2qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjaE0xeo;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EEE606A326
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 22:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29EEE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjaE0xeo
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1898615a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793659620; x=1794264420; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vXkfhgcH6rL/dKIELLPsFfXbm/yMJGywtKtor6k+GYY=;
        b=PjaE0xeo3jBuE2WmZSyJCzuarEc+/BGV6b23dKqj1Mo+ML/tDDo/MdNVINSRf5XIaU
         gQs7qO+kGJpnTO2rpUYnvYCC44R7SL9zVL5Gs/8PKYDmUlgr3B5Zl6U35BfVAnPX8M/m
         odtryDTv5FWUsX/I653xtpkuYOFV5iGni0938cEeKT+df7DZc08wPNg7cWH6474SitCR
         4bINcnSU4un1xs+iq0PYgqC+KCxlcFWEgKiSNTpQ112c4YIsE7Nl8zgZskeTQEkBDdgf
         oFsqq1zIJhalJicfUiLWugOw7AyetIxFswISZsoRF/5OxEI9wQ/E6enMHwZ86EkOYlHm
         wxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659620; x=1794264420;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXkfhgcH6rL/dKIELLPsFfXbm/yMJGywtKtor6k+GYY=;
        b=ecf5GN2Z49OVYqBwRSfDdL4U3X9Y/VTntjwHUnoFCaW1oaBWt12q9uzW7TihqbP9QG
         sKuW3L9NpQ7TBcLF6Ve9qspLHgt6ajFXh+rVMw2tFQ9XEj8gPZ760bn/5uZJ96kTgymx
         o7z9PsOxKGlj2VGheqp5ezygyr/VGOSwMw/+5nLuam8AYV6DMscW19+Dz0+cfqNo907J
         tvSLy0V5UZ5gjl4rWVVN707Z3qJWO0crL8g9x0VqRsRcHI5Dv2aA2+qenU2M64YOwjJa
         ykkc55CVrmQwtKEKUDAVEnCKjKaJuN1/BjU7FkR9BsDpvZ+F7feTICKIRN9+wCqT8I8H
         W/eQ==
X-Gm-Message-State: APuU4Z/Q6ela1OUtAHqqkcG50o8ro5utNYOQFijviRw7q/1RePzXz8//
	2LjRouDjcR+2IIFGLNVZg31bL1z9/LbPVQAHZiy+01VzlK1IxARqd6oCvjo4CQ==
X-Gm-Gg: AYBFou0sICo+QPOL1f3CB50snx6t2ht9lZIpn5CIkbKx7LmeTg2JdEnxz0W/d/WuQb1
	/pLgf/NvqBhzTYfuFfG/7uL3iMwK4MlKrcY9GS4RIMSrA8fyk3QSfY2zv2honBVIH34cDHofWhn
	VG2GsppMNOE1tTUnzZ5ZShDI/GX2VPUQb2Sqvr1VR0u8DrpwcpE9jdsblp5O3vJk5DRWdiVNFFH
	W+q2xLOWWSlPCNKDCjU6ckwBEYzRn1nwzJIyXhM5Ka3blTvazivO3R62e+2JQ5A+5PEiZa2hCvk
	zBwiK3G0zTyTWyTZt2knoLJ14eRgunXRqwvKSMyr4YYn9pNBg6uHTKxa7L4QvNI79PXzDw1JHi5
	d4esPYV77kMLpBd4zbbESPTpmxcqRWx/410V9XcZeML7CK3S9B+OLLuyR+HDph1pmerB3gENoDu
	cR1kgR9GGOpF5NfSzYOux+Vr6PosxZWsilWuDmS0x4Xg24XJUelN1uowHysiWPoewbFztsTB4YO
	H5IlFFgZaZfm1N7m1pn7gjGRYya2biTdeW5fNu73uGYDVYf79o9CWnmpoi8KiOEZkKBsmVh6hi+
	rDxVv/m9pLEJf0Mpx65q+pOoNB2+xoXpP6NE9o2n6+k+F8jei1xYEUqAgNHiZbRYFagrWpNfS0/
	cNpNLC8wyUiWdHTSG1ZRBkWqem7AOuORrmg==
X-Received: by 2002:a17:90b:28c7:b0:3ac:83c1:2bd with SMTP id 98e67ed59e1d1-3ae897f33cemr8956221a91.28.1793659620222;
        Mon, 02 Nov 2026 14:47:00 -0800 (PST)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8805ebc8sm9308679a91.3.2026.11.02.14.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:46:59 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:46:59 +0000
Message-Id: <DML39PMNWP8Q.7K2P5T3AG8LP@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH net] net: reject a negative TCP header offset in
 qdisc_pkt_len_segs_init()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
In-Reply-To: <sashiko-outbox-194018@kernel.org>
References: <20261101194433.2637113-1-alexei.starovoitov@gmail.com> <sashiko-outbox-194018@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 11:44 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +		/* A header in front of skb->data gives a negative offset. */
>> +		if ((int)hdr_len < 0 ||
>> +		    !pskb_may_pull(skb, hdr_len + sizeof(struct tcphdr)))
>>  			return SKB_DROP_REASON_SKB_BAD_GSO;
>
> [Severity: High]
> Should the (int)hdr_len < 0 check be placed immediately after hdr_len is
> computed rather than only inside the SKB_GSO_TCPV4 | SKB_GSO_TCPV6 branch?

No. It's already explained in the commit log.

> When (int)hdr_len < -8, hdr_len + sizeof(struct udphdr) wraps to an
> unsigned int in [0x80000008, 0xffffffff] (> INT_MAX), which triggers
> DEBUG_NET_WARN_ON_ONCE(len > INT_MAX) in
> include/linux/skbuff.h:pskb_may_pull_reason() before returning
> SKB_DROP_REASON_SKB_BAD_GSO.

Not a bug. That's CONFIG_DEBUG_NET only and the warn is right:
the header is stale.

> Can this write uh->len (and uh->check in bnxt_sw_udp_gso_xmit() and
> enetc_tso_hdr_csum()) before the start of the header buffer when
> skb_transport_offset(skb) < -4?

No. The driver doesn't see this offset.

> Third, for other GSO types (such as SKB_GSO_FRAGLIST, SKB_GSO_UDP,
> SKB_GSO_SCTP, or SKB_GSO_ESP), hdr_len remains 2^32 - |offset| at the end
> of qdisc_pkt_len_segs_init():
>
> When (gso_segs - 1) * |offset| > skb->len, can qdisc_skb_cb(skb)->pkt_len
> underflow in 32-bit unsigned arithmetic to ~4.29 GiB (exceeding
> QDISC_PKT_LEN_MAX), causing deficit-based schedulers such as drr_dequeue()
> and ets_dequeue() to spin in their deficit-refill loops?

No.
