Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795221737;
	b=m1GfOYnr+LSRxrSCgRZIWxj+LiB1SkO0lA03W94Ze7UgjeSOxt/NAd6ZbvAaXfKuo2UX
	 5y8b6auYxy2vJ6Z/6qFIDDfzwBuPO22qGPtvRyOCu5mkm2rzYrJRr5DshwYzT9xhX2ABo
	 RQwZeiwD0uLRTrXr8kb5UtWCnNn+Girg80Iwf2qI7G6cBfyIlGOATLAWNMCnpcKvR+U22
	 ExB3seR9OVZYNBkV/QVunKxDPcxijsJBiyMXCt/QLe9of7rBCSFUr3sqEMpIXtrJGPTEl
	 69xVQfLliTJcXb7ibmyMAePHeJDskaQEdmNZpeVobVKh6mKNOAOCTcZtaMw9Xr2x9pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=cmb9/XQKjIVigQ77J+1xKd88xgQJr9ojuUuD9/tW/YU=;
	b=UPn3L2sTjhlnZc8AtsUTjN3VuCC1UQ2U1nidANCd6kW21EbsjcU4u3mFeAPRkTofjzxe
	 9IEDXIym23UYMxiRlCtrWEP6mCtr3YjqEgHEq9BBRRcCazyVbQ0Nn81dvFhioe+o/RzD9
	 SPlzWAgpt6LN+DLAh/7trUmnaPtNIN3Cl1XRV1+6C/ptrKtpqinRMIjrPwKORbhs9yr6H
	 +Gfm24dP9bixGSXyzk+4rDZXHtRy2EqrpqQJAdWIHyZTLr00gJHjPRILa8dAGXf+fz0iH
	 VoQIBq113n8ivEOQOB2JU7SJaor6xtpBu9xbt/1alSuMTLR+s7YKcgLr2gTwCPMZjRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=QY1WI86N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82338606A6B7
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 00:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82338606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=QY1WI86N
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL0AvbV2132401
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:42:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=cmb9/XQKjIV
	igQ77J+1xKd88xgQJr9ojuUuD9/tW/YU=; b=QY1WI86Nyjf7CsbvaWv/XaKMrA1
	lSjKgS0WH8FnIjt+OAVaiV1pgmKYWnBTr/HJz0WIMgHI5A1LIwAaJY/QILNmvenJ
	ptnLD2VSQsdYpkZuOl2fF5m+cbapHAjZtKLSbPqPobcPnj29Vz0HZ2DnvaLTtD5Z
	vU/LWFl4iKdU9lkDDsdKVgdci+SH0bg4BzwJ9WgOdLOXxjXBnHxS9tt48E/rjdJs
	PCDY3AdLGRhMOgJ4+hzWfxcXF5LUeTKJcwiA0Drvzn6bapTSMEPI7JpUOrzX86ZX
	QKhUnMbaMqYxTDEC/VKpknh73CYRgU9RDe89XsYGYYs5EFh/suvemfdbX+w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tg82yga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:42:14 -0800 (PST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1864972a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:42:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795221733; cv=none;
        d=google.com; s=arc-20260327;
        b=H2KUVhjo1lxBjUh/HOvkpdmKSkXNINOnjKnI7L7W6buZyyRhIIjou18S2PZqSUUFVk
         YPNRREAVsqmC25JonAfX7c5y3jRkhvNiSYobFTTBCjkzLXezXXUncha9XPrHVguagejz
         nvlIst4uDViZOUPdtvaPQQYwVrENxcmL1boXhrXPzdPNw+3Pbsl2h5xmddT4imre1bjF
         GjpBxWnsxB97FNK3w1nR+GoruLvJz63ko6BZhM0TlfjP101SGdkDH5qFVbjAjLj5ELtz
         0IGdXyoxy7XpZ0nK0jyJXNAKlWnwufkNczsaNPYaMOHgPQ3vgiu1SB+Q75FrNoB+ferX
         YxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=cmb9/XQKjIVigQ77J+1xKd88xgQJr9ojuUuD9/tW/YU=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=sLxI2G59to185mQSut7jepJHEfnpzDTfPQUioRlRwjSutuAzaJCWi4oI9UJjpVy8B7
         HmXNusBaxu1FLUr+I8NRyA3AN7odt+CM7E/tFiPmW4J3H5RBCslYnFxJKMtrC/RD+YRd
         TF8LMJIoYgLAFpPgQW29R63x6XKfOIBMWsdFr21h2EgUYeZM5gQgpwgjKVUV8CidzeYr
         s3YkdXEey5hRZp3cA5RRvWVLXoGJfqbuDNWDYIQiwhwKD6nrRkCkO4zPqKspm1lZ8UZA
         aTOvk0OWOMppU8mK77t+0qd4fjLU2XRGc0viYThMj3hMTsSQus8gjckJi9JYfrBS/R1P
         oVQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795221733; x=1795826533;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cmb9/XQKjIVigQ77J+1xKd88xgQJr9ojuUuD9/tW/YU=;
        b=lpNGHFoEvINhlW5qnpL9qfaaui/CtV9D4fGZU83Tz6XpzF+yQfFEKZE7kszrRccdT5
         hj7De5kMME8aU6KNXeLWdgLlpE1+fl7v37RKtN0FzskWkbuftS2ugiMmf/LewA6JWw4N
         rxtNzTPSlSLrD0+Q8VT8t6S0+IFbFrMDSHiQLb1qKZgGHexG9uVWpJo26bXuMs9yB013
         fHB2E2IS21omr5a+Ku6t70eiNN+0TOHeZfBMzGSL2pFV+E/NJCS4tf7Cn4Oo7o82B1or
         na+fkXSlA7Q4nqtqzqyd7wj9UtIHyH3Iemzh1pQU1cBb8ENnRPUbdCEI+P34SahE6kGX
         KHwQ==
X-Gm-Message-State: APuU4Z+dHO7+jt9EgwT+nfjejXtEd3q4iYOpxqIPIj4/4vJnzX9MP8QQ
	+110PE5m56uAWoWV0hGSybiWsP5QmiWb9nMOouf+lFM3Pm55FIaZ30cixH3AfcwJwQbFRDuFcz8
	YuFBIZRcojcHPt6Jbcdl4ssrdyaibm059t3Avr0uIlFJlXY+WVEPjRY8jcaeeETnBKWU1EYlHsg
	HSNIL6IDvmzPhblXe+WB8xktpc6TJeuzVAKxbiht7XOycbIVtJHHvWpA==
X-Gm-Gg: AZFdTZfke66Ms8No3qNpLkgId81bjhYrFA7GM7RCOJea22rtIlijj6FsRHQOZrTWFpB
	rzjaCtGT0DeazK+jTVQVE4jKi9ZQTKkB8DSqSbUJ328s30a58U7dJOQL8d544FXwpGPSAgZ8B4D
	L5XOk+bqCHhlvhYAhntEqpaJnExXOCybqBFtdCYqHJj67LTUNKmV4IPnLF3ztLzO6ENNXI4AKtl
	KbY9vZyFlilm40NKyYJTil0nO69ED5jgpDzlB031YAyrtticUo=
X-Received: by 2002:a17:90a:da87:b0:3b0:9a2e:b494 with SMTP id 98e67ed59e1d1-3b41c95b089mr3980243a91.54.1795221733173;
        Fri, 20 Nov 2026 16:42:13 -0800 (PST)
X-Received: by 2002:a17:90a:da87:b0:3b0:9a2e:b494 with SMTP id
 98e67ed59e1d1-3b41c95b089mr3980224a91.54.1795221732627; Fri, 20 Nov 2026
 16:42:12 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119013103.1092559-1-toddfreed@meta.com> <20261119013103.1092559-7-toddfreed@meta.com>
 <sashiko-outbox-224313@kernel.org>
In-Reply-To: <sashiko-outbox-224313@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 20 Nov 2026 16:42:01 -0800
X-Gm-Features: AclHuK-l1kzQmZfxaMks_8rKcXp3Eu5vIVvwK5OneLSZqpLyGHr6o8FxxmfrXhc
Message-ID: <CADh2yMy9skck8GuUEt390mrSir=sWVnUkJDC38hDb+RjGRO6LQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 06/12] net/sched: add act_psp for psp
 transport mode
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAwMSBTYWx0ZWRfX53hY1W2J0hpE
 787AJFq5/VJZWvyWW7gnfHeV7Wu9t8vQBuXJ0hkcGq1WHA5xg8wuFy2fpLk/NLzkno/nUptVt1X
 ZlUqdqLCWOGzea0r9L+zN1+gW57E6uQ=
X-Proofpoint-GUID: ywK_wgBBadfYk60-wi9xJzwyUPFjfdkW
X-Proofpoint-ORIG-GUID: ywK_wgBBadfYk60-wi9xJzwyUPFjfdkW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAwMSBTYWx0ZWRfX0/AA19ZLCO9h
 ZhqbthRMrxn3XiYy0bTZSwBT+B/RHIt4phEQ6WJqZzzIh/k3vwwRxeX1tndbXuYb9AmpHcreLMM
 7z36DphsSVW2gh6aeyU8yJj2eOEXuvAQyie9oZylx+QP/X9/2E5CuHWjWjlRB2QA9rjxZ9Y9Zj0
 9h7rx6CyYLPW/LQogNIOkbkGGOIAUxrWy2Z2xLx/ifVs7ZyDzL7wLIfF/pxxpmZmu1EECwU8cW0
 FI4oKS4XQ+hVeGOVUUe0D3FtfXvY3b8KLiQUPlyHsE8aWoEbLrBpjSkhUtiSE1kN/LOkZrg6uMf
 1/7LpdfZB2y/qcj4srqI4HAOQzv3SCzyFGykljUhygqdkqWS+ISptHr3ibE/2mwO3nSUCXBYeti
 SFvXX3/kHcT9o8jHFkM0fq6b/Nd4UQuyU3gtlApukCkXVKKTrG4o7KNDySDNzfXSSlHLqjjoIF6
 VfYYPOKsCzl7hW+JC4g==
X-Authority-Analysis: v=2.4 cv=YewodARf c=1 sm=1 tr=0 ts=6b00e8e6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22
 a=n5VHtEvjoD_29M01vEgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_06,2026-11-19_01,2025-10-01_01

> [Severity: High]
> Can setting transport_header to off + hlen on a GSO skb cause out-of-bounds
> L4 header accesses down the transmit path?
>
> At the start of __dev_queue_xmit(), qdisc_pkt_len_segs_init() returns early
> without pulling the L4 header if skb_transport_header_was_set(skb) is false
> (for instance, after gro_cells_receive() unsets transport_header on a
> bridged GSO packet), or pulls the L4 header at the old transport offset if
> it differed from off + hlen.
>
> tcf_psp_set_transport_header() only pulls off + hlen bytes before setting
> transport_header to off + hlen.  Right after sch_handle_egress(),
> psp_xmit_md() -> skb_gso_validate_network_len() -> skb_gso_network_seglen()
> -> skb_gso_transport_seglen() reads tcp_hdr(skb)->doff at the new
> transport_header past skb->tail, and mlx5e_psp_handle_tx_skb() writes
> inner_tcp_hdr(skb)->check out of bounds.

I was not able to reproduce this on ConnectX-7 with the following setup
(inferred from the call path from Sashiko),

- create a netns and veth pair
- create a geneve tunnel over it
- on the host end, L2 forward the decapsulated flow with tc mirred egress to
  eth1 (no IP layer)
- a flower filter on eth1 egress matching the flow, with action psp encap
- then, a TCP flow from the netns over the tunnel, so the host decapsulates
  GSO skbs through gro_cells_receive() (GRO off on the geneve device, and also
  with it on)
- bpftrace on gro_cells_receive(), tcf_psp_act(),
  skb_gso_validate_network_len() and mlx5e_psp_handle_tx_skb()

In act_psp, skb->transport_header was wrong (equal to skb->network_header),
but the TCP header was in the linear area. Once act_psp set
skb->transport_header to the TCP header, skb_gso_validate_network_len() read a
valid doff, and mlx5e_psp_handle_tx_skb() got the skb as GSO with the TCP
header linear. No out-of-bounds accesses.

I did reproduce a read past skb->tail with a crafted virtio_net_hdr whose
csum_start points into the IPv4 options. But the skb is SKB_GSO_DODGY, so it
is segmented in software before the driver, and tcp4_gso_segment() drops it
(csum_start != transport header). Since the only effect is a garbage MTU check
on a packet that is dropped anyway, I am not proposing a change for it.

> Overwriting transport_header on GSO packets also bypasses the
> skb_network_header_len(skb) check in psp_dev_encap_ok().

It doesn't though. act_psp sets skb->transport_header from the IP header
itself (ihl for IPv4; for IPv6 the fixed header, as it refuses extension
headers). That is the condition psp_dev_encap_ok() checks with
skb_network_header_len().

No changes to the patch planned here.

-Todd
