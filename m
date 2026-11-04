Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781700;
	b=BtqtrrDEaXdWALY00Fisk65qE+rXOf+J49HIGokF1JZompIvtDJdm+foRSU/GyY1uQNq
	 fiUJhgN3SRBosktQGAUbPjDhvvdbUwj6WjisbS4pUDNqQLc+1uPeAXTgGsdyvqmKSmY6S
	 zrofcgPpU9CBHB9xI2WDRwHzO2OfOp1kaZlNqWdoyd7pGom8/DHY3vBnNqYEM0pK/caYN
	 QhnQ0ZZyQbArjCj8CvBNHvmJiPPdbQno8p4FJUsYI0rMj1xBprG5NYqgtderogxidmGbR
	 jJir9KNNMc/GvDWE+0A/OvA9b3sxOpHRqo7sPqZlruW4kH0hMi1OrWbb3bpq/SQJkXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781700;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=tOA6pkU/gNCWHcJNqJZg0NzRYRy3OJtENBm4suvgaWI=;
	b=DAvBcQu27r3KxbdRv3Vla0vgl2NqtC1RmQLANaFzloPBiSMEIeKDfp2r6/GUY97AmKxz
	 ZTmIpOHo0sUDycMGa5k1jeJyzK9rWbX67P2OOpwroMXrviBPJSXbolEMQLQylmGeqAL6g
	 veeDD9+Szg1IUoyNzL5yfbTcPrVaBBinM5OfvpeqZkvEgvWDN3Jm8azbT4ENajHCJ93Z5
	 8FFiYjB1pUUrptAW9/ClEyN3hEHXw6IQ/xFutWfLV3tvWHafKNVKev/Gp+O4wEKRvQ7I8
	 /kYzsmNjE+ft77wpAx9zqC3TfbL7P3Qli1ncGhG1k+FCkKPQeXVBzkU6wQdbVNLRftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YjOMFFH3;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1CD606A328
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 08:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1CD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YjOMFFH3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793781698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOA6pkU/gNCWHcJNqJZg0NzRYRy3OJtENBm4suvgaWI=;
	b=YjOMFFH3B4gbABFW7fjGUAsevGp1qOhYK4t+oEW42rYDmrTfX0E62gBogAS5/RJcqmxlkv
	BfutCBRDBbt42KXBnUTkR7eaTtR9oNFSniWhgBQ60Vl6TvZqkl7Zrc3lRxfl4jpALUXJD6
	+tyms6FTx143skW03MLdFS5gnHblItI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-MWsBhX72NvOQzhsI_ZScKw-1; Wed, 04 Nov 2026 03:41:37 -0500
X-MC-Unique: MWsBhX72NvOQzhsI_ZScKw-1
X-Mimecast-MFC-AGG-ID: MWsBhX72NvOQzhsI_ZScKw_1793781696
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so3300275e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 00:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781696; x=1794386496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOA6pkU/gNCWHcJNqJZg0NzRYRy3OJtENBm4suvgaWI=;
        b=Jacbld4boyBZjQXizd6yoMLY2y8zMcJDk+i/7fsydS5w0855+fxZ4PTtQVfhJicECh
         qnbCc7Cy/6gqTI8Y6205aRZlGmlKaEcLCIahBkh0iPosSFwhCMwNsnzZDBB29LREKZm9
         Ifu9kIOYyzcjH2/iqzXqv0iSYE034ghEcE3UmvdKRghc49GsLocYFn8lJ/Boqbd+aE81
         yVCjkERzzFyHDuHWAPr++5LxbdjPmAlBaHIgZD4LyCwjwkG2KrzEm3NW8kqg0xH04kXe
         3XVrmlwmvulq8i1VfvrwPpTmb6MDN2zr3sWp7++qZIJRPDhTpx+TZCeYEFYUTy+hGEON
         Weng==
X-Forwarded-Encrypted: i=1; AKwUvBwIyeWXQ6Q7GZGsRik+L99guz7B1j0Z9F4TgxdoWy35XOz1U+F6Qhkki6trPCqKqmqeYsEQva/u+Z/D+1L89Fc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8j2yRM4BLTjfb6BXHO0qt28YkeT8p/iopnHmTwkjerkKoU+TdB
	YZCUfhnIt815oBAa2sRy0Ygr7wZjwgY3UOk37D8LIavWr9oIaasdMdflxVGFcYL8XQ9HQ7Ujik2
	+fQsznVZh2ZVhK7Bxfh1lbtmdjbrA/v2Tsp/lLdCdoL2xUIGpCIEFtboYrKr9jVGP2a4lxg==
X-Gm-Gg: AYBFou0fgcdpHUJxVBOq5K9yAZ3GRGsq+2SCYIMZfu//BM55u3d8OxO6stsLEpou7mI
	iDAIE8w6gxheNqyECnUcYR0HAdZg1KtVKhgig2dLkgtkaDjoX6oAmANVYJDEZudmyugfqGkpETs
	giOskC91CQTuGvpviDcMgXCL58BV1+RkzDXMyljoa+gXoOop2r2CV0cyl7RP5opa3RgGDLAgSGR
	z2Ntx+KQFiFcFqptJdnY+9h6EmC9GucnvvzSMWCIO4178E3c+qD52JdqFmbze+B5pRxIxJXCIAv
	TPDn+ZVunhluSRmF15kMFvwPuX4A//Fx6COojQu2nzz5Hvf46RwkmN58PLZFwVQBvkKhGWAlkB9
	a1SlolOkFSOcM23emZblFPfOZMsF3ZSje090Ji9CXRMwAw/+OsmDcrFRuO+PrrMD0nvGGdxcPDe
	oZji/BftoR+UzMfP7V0KVJqq+HIqlMJE0fMigF2cT66mw=
X-Received: by 2002:a05:600c:6099:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ac185bc1d2mr329183185e9.26.1793781696132;
        Wed, 04 Nov 2026 00:41:36 -0800 (PST)
X-Received: by 2002:a05:600c:6099:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ac185bc1d2mr329182855e9.26.1793781695664;
        Wed, 04 Nov 2026 00:41:35 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm2470040f8f.11.2026.11.04.00.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:41:35 -0800 (PST)
Message-ID: <f029172d-855b-4e93-8a86-d4aff72c9abb@redhat.com>
Date: Wed, 4 Nov 2026 09:41:34 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: reject a negative TCP header offset in
 qdisc_pkt_len_segs_init()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, network dev <netdev@vger.kernel.org>
References: <20261101194433.2637113-1-alexei.starovoitov@gmail.com>
 <sashiko-outbox-194018@kernel.org> <DML39PMNWP8Q.7K2P5T3AG8LP@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <DML39PMNWP8Q.7K2P5T3AG8LP@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ilFVxQZ2bRFzuBehIaNfdOOEhBo4KQmkz8S0BuFrgTk_1793781696
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 23:46, Alexei Starovoitov wrote:
> On Mon, Nov 02, 2026 at 11:44 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>>> +		/* A header in front of skb->data gives a negative offset. */
>>> +		if ((int)hdr_len < 0 ||
>>> +		    !pskb_may_pull(skb, hdr_len + sizeof(struct tcphdr)))
>>>   			return SKB_DROP_REASON_SKB_BAD_GSO;
>>
>> [Severity: High]
>> Should the (int)hdr_len < 0 check be placed immediately after hdr_len is
>> computed rather than only inside the SKB_GSO_TCPV4 | SKB_GSO_TCPV6 branch?
> 
> No. It's already explained in the commit log.
> 
>> When (int)hdr_len < -8, hdr_len + sizeof(struct udphdr) wraps to an
>> unsigned int in [0x80000008, 0xffffffff] (> INT_MAX), which triggers
>> DEBUG_NET_WARN_ON_ONCE(len > INT_MAX) in
>> include/linux/skbuff.h:pskb_may_pull_reason() before returning
>> SKB_DROP_REASON_SKB_BAD_GSO.
> 
> Not a bug. That's CONFIG_DEBUG_NET only and the warn is right:
> the header is stale.
> 
>> Can this write uh->len (and uh->check in bnxt_sw_udp_gso_xmit() and
>> enetc_tso_hdr_csum()) before the start of the header buffer when
>> skb_transport_offset(skb) < -4?
> 
> No. The driver doesn't see this offset.
> 
>> Third, for other GSO types (such as SKB_GSO_FRAGLIST, SKB_GSO_UDP,
>> SKB_GSO_SCTP, or SKB_GSO_ESP), hdr_len remains 2^32 - |offset| at the end
>> of qdisc_pkt_len_segs_init():
>>
>> When (gso_segs - 1) * |offset| > skb->len, can qdisc_skb_cb(skb)->pkt_len
>> underflow in 32-bit unsigned arithmetic to ~4.29 GiB (exceeding
>> QDISC_PKT_LEN_MAX), causing deficit-based schedulers such as drr_dequeue()
>> and ets_dequeue() to spin in their deficit-refill loops?
> 
> No.

FTR the nipa sashiko instance dismissed the above concerns autonomously:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261101194433.2637113-1-alexei.starovoitov@gmail.com

you can reasonably safely refer only to such instance when submitting
patches to net/net-next.

/P

