Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811144;
	b=2MWEPoucwRN/AJ/+iQGNt99WuVIcFubuIwyoC2in4Yto01qlTQMAAf6dGSlh05WhUyKk
	 JtijZibdv1mGnv8IYbJ6oReeDfMduhb9cE0u7UtFrydDlnRFSl2oz4GNWvnf9E1dOxvkP
	 NIIBaMEE3XMZDt9ux8/QdQ4pHxMJR5RMg23q5eyPFY4zoU4rzXkENOfS+Q+6QfueHrbIz
	 nWfA0TSnspyzJ3JDKd768PA/EwJCzs9Tm3RAz35hBpA1JgCf4cJNoO9d51LB56jiqbV/h
	 racoJ48yaWPC3nEZcwh/j+2B3q2K6WAfB4omX8vypukWRuPD31ZMqvAT3IQFrICT1yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=mDQelrr4Kh/Jq4lqD8Bd1ygw8a8v5DRiulkfJQImUaA=;
	b=fJjMzp61tVpytRTVaQ/innx67ohFU9WWdNiU0oArzyURx4XIdXy4cbwMV/kljV3o3rfU
	 yeBaqk3iWUpezzgDg3LBidv7FelNq5iBBW6V+aJwVrNjJYE5XULaG+mLOHT81ehYQ3Pqj
	 uUmvEWUaR/SM6YqQqBDV41GZMaO/SzYz96o6DuboGhiI9MsoGtYFbxz+a6SYewtnro3yX
	 SrebIEGs6OIF9Tk7UU1ZDb2oXfADNVsQ7lhP5RoQqVA1aGoST7SHL1bgry0FNsBYRJU+O
	 qXhEMmJd/TtV24tfAuAX3T1JViJ40GL4q9HKUjiIRhwjzGv6Od86osjUb8NxIR9Qn5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCyjQ4rL;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC13606EEA6
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 16:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC13606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCyjQ4rL
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ccca948203aso433949a12.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 08:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811144; x=1794415944; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mDQelrr4Kh/Jq4lqD8Bd1ygw8a8v5DRiulkfJQImUaA=;
        b=GCyjQ4rLqY1pYD31c++sMLzfJPLgaW62Pw4VqDg0FoqbJgtEKj4gXl81ManSPhnjGt
         oroANmQI5nqAtE9R213Sa60DjLl6SSVR/BpEJMvOaPIhp6PaHBT9qobSDyRx/dVG9LBS
         iBd7EXzTq95rKQ4CR6JfOFZjel6oFhtq69mYcqm0/KHCr2ayyEG87MZZRU+AZqpZrrmB
         +6XtYeAH/mGrsfQD7HIc5NYBqpHINDytt5tpBBpL7XRnTDn3EAdZkN3tMy40fFqLjMBg
         ulACfW0jf4JPZRTI05gE/vC1mx+xwpC2sciy/RKL+8LkETi+uk/qbBVcX/wI71d4icBL
         5aBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811144; x=1794415944;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDQelrr4Kh/Jq4lqD8Bd1ygw8a8v5DRiulkfJQImUaA=;
        b=st/7Eo5nrD1NuZEyW21X3IXaK1ceWsPzXhAOGjLgqNcwHdjZ8r8+preY5fqJApD4HR
         VfjznJi/cFY+lHMHOxPRrzzEdQN2RVWnif4KrAN6RQhhJULCHf+kSpPG3NgzIKgEakLc
         ttKUvOaas5dIIxgfylHxgWUYP7pjG0ier2z9IlnWPcu66E4tjeSldq6vT6NzNEAJQHuw
         iyUoQ5J3wIfeCbxDikDeaUkytI9KJ4eq4iKvcjflrigYQ5NDrI15YadCbeDOYit0AZfm
         yXfc0iAYNPjLop/zGt44YbIbhAPjkEjWed9TBaoZH17dy1YsJzeI6tb/T3Uf1OPrdqq3
         bRrQ==
X-Forwarded-Encrypted: i=1; AKwUvBypC+cnd72po40EHV0/uqZMOnSEGBG6vTQS/NNUbM3eQKqKNnY6CjEn9wXA45cdbBHzSHHx9vEciNpffGvrO/0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8JtlVuyI5NKkK6B21ci/00tL80P6XVZCkTTbgAAEzdVTNw0Am8
	ypTNSrQnI+dpUzPpToNpVEOWlKut+qFMouJ6iWWZhbTcqjg1u86/7Lvr
X-Gm-Gg: AYBFou1R9eBvl65pofJTGU/vY/VqAR4NZWsa5SbGnGIPSRS6TXzKPbbGUWMKufbAzVX
	Hd+qiRVQgEWg5boDWK3ff3De00GvdcGmabZ1bsTMcecZ7yjJxDfLhkhwcaA0KNegQ/dASSVL2ZG
	s1rbPdDr7tVeRljVq4VbIvw0tIZEF7yNTM6ZII0gyi6ePj+Vk9X4Ko9D2V6LIZyydjgWoR02QZr
	//pMgDcVOKWrwAtbdWm79ZTHNuevHYd4fSdBr3jNCJm32pVOUSfCsghvU2Kn2hr4iYh/8A0izsN
	y3VDBtRRy+AcY50VM7O3u9dY4+1Q2rfclZe2N/Cnqb5PZrzKcsYgeLFIE1Zglq36DNDQ3FwzSg1
	r6B1z1/makNRE7ar6XTCEjhrfMU+l0jiUGc9ddfD+SZFmIVULfW5SQcRl62CYuHRF8Ur/oy4zlf
	N0pgHeNCKUX4nN+278zNFvnh72LoA2UxqbWi4fprs/pYIKkRNIWGSic6jJE1EdWYeYssmjWXABh
	IFDcYRmOJfMRQCaB2jIsx8QdVdoVXUAcrkko2Ni6egDB+v44BU96IjYFuqoEnSuvy1fE1fMLTKw
	mMrKFxt3Vox05V/9qmv2s3oIqAeOP8WaLqrdlw351LkYY4FFf0qjg7NiyKtTIDSFKUqKzWJT3Bs
	MPmG0Js2eazGVcgOstugxijz68de78XvyQg==
X-Received: by 2002:a17:90a:fc4d:b0:3b0:ac2c:1619 with SMTP id 98e67ed59e1d1-3b0ac2c19c0mr685175a91.39.1793811143452;
        Wed, 04 Nov 2026 08:52:23 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09445a7f6sm4685568a91.6.2026.11.04.08.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:52:22 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 16:52:22 +0000
Message-Id: <DMMKZAEHX53I.49LHFPRSGLX4@gmail.com>
Cc: <bpf@vger.kernel.org>, "network dev" <netdev@vger.kernel.org>
Subject: Re: [PATCH net] net: reject a negative TCP header offset in
 qdisc_pkt_len_segs_init()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Paolo Abeni" <pabeni@redhat.com>, <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261101194433.2637113-1-alexei.starovoitov@gmail.com>
 <sashiko-outbox-194018@kernel.org> <DML39PMNWP8Q.7K2P5T3AG8LP@gmail.com>
 <f029172d-855b-4e93-8a86-d4aff72c9abb@redhat.com>
In-Reply-To: <f029172d-855b-4e93-8a86-d4aff72c9abb@redhat.com>

On Wed Nov 4, 2026 at 8:41 AM UTC, Paolo Abeni wrote:
> On 11/2/26 23:46, Alexei Starovoitov wrote:
>> On Mon, Nov 02, 2026 at 11:44 AM sashiko-bot@kernel.org <sashiko-bot@ker=
nel.org> wrote:
>>>> +		/* A header in front of skb->data gives a negative offset. */
>>>> +		if ((int)hdr_len < 0 ||
>>>> +		    !pskb_may_pull(skb, hdr_len + sizeof(struct tcphdr)))
>>>>   			return SKB_DROP_REASON_SKB_BAD_GSO;
>>>
>>> [Severity: High]
>>> Should the (int)hdr_len < 0 check be placed immediately after hdr_len i=
s
>>> computed rather than only inside the SKB_GSO_TCPV4 | SKB_GSO_TCPV6 bran=
ch?
>>=20
>> No. It's already explained in the commit log.
>>=20
>>> When (int)hdr_len < -8, hdr_len + sizeof(struct udphdr) wraps to an
>>> unsigned int in [0x80000008, 0xffffffff] (> INT_MAX), which triggers
>>> DEBUG_NET_WARN_ON_ONCE(len > INT_MAX) in
>>> include/linux/skbuff.h:pskb_may_pull_reason() before returning
>>> SKB_DROP_REASON_SKB_BAD_GSO.
>>=20
>> Not a bug. That's CONFIG_DEBUG_NET only and the warn is right:
>> the header is stale.
>>=20
>>> Can this write uh->len (and uh->check in bnxt_sw_udp_gso_xmit() and
>>> enetc_tso_hdr_csum()) before the start of the header buffer when
>>> skb_transport_offset(skb) < -4?
>>=20
>> No. The driver doesn't see this offset.
>>=20
>>> Third, for other GSO types (such as SKB_GSO_FRAGLIST, SKB_GSO_UDP,
>>> SKB_GSO_SCTP, or SKB_GSO_ESP), hdr_len remains 2^32 - |offset| at the e=
nd
>>> of qdisc_pkt_len_segs_init():
>>>
>>> When (gso_segs - 1) * |offset| > skb->len, can qdisc_skb_cb(skb)->pkt_l=
en
>>> underflow in 32-bit unsigned arithmetic to ~4.29 GiB (exceeding
>>> QDISC_PKT_LEN_MAX), causing deficit-based schedulers such as drr_dequeu=
e()
>>> and ets_dequeue() to spin in their deficit-refill loops?
>>=20
>> No.
>
> FTR the nipa sashiko instance dismissed the above concerns autonomously:
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261101194433.263711=
3-1-alexei.starovoitov@gmail.com
>
> you can reasonably safely refer only to such instance when submitting
> patches to net/net-next.

Nice. I'll borrow your mechanism.

