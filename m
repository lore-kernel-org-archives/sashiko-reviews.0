Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169828;
	b=mgeRhsScUQ99obULdGPZ9udP+xsVZKGC+IYj2jo+SWR8W8kdoTmZWqaz2Knq5fQQiAml
	 dPlsrkqpbtuTvG9YWx88KdwyTnEyoV7U9F/Vp3Kh59arvAYzxqbv7XM5+xSKJnxHd1NYj
	 Wo7qdbTBgt49HdLuipk0ukFy3OQpk8x2y4LFNzxvHE+vyxe1VZFUYk8em3KDKF4EvsdGr
	 c1vv3v6ijXoxDLnZkjK2ONWi5xMNBRvtKzB3NO8PmZrheUtODSeCwHOtAjUGIPCM3ToBH
	 2e1ENK4hjJFn2pPmxUjX1mz1gNrGLPW+X/WbNIygSdfwsfFyJPfrpm5cx3OxV9DktsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169828;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=BuXhlSKg00a4CpooMZ1asDKzuO5wnOZJBMwl0XnHxMM=;
	b=qh+0EjsMQCFBMDDLVh27lBlwPpgYvsnQeoihAY035TO3qngwk4VPq7gybj5nZ+ykc4ll
	 2Eqcn8Y8Bv5YncuqE7Y6h4ftB+EDcEaqf57moz5iSutyCiIE722c/9PRkXN8NGPxB8QI3
	 8mudYKVswOh4/5MsdAlNHy1L6qTNZX5+masvIJqkOknbYdfKHD3Ldz00/IQg5gIXPCGgl
	 DAvXUPes2jl513heWH2sK6RkW9zDa4mUd7lTS5hreq2/oV51f9p4jW9wlkzuynOUUX1Ka
	 MxyZYWdY538lNVTKS7jAtMbnUaSIJnYzk8ZhC5P1XS2mYPiAuAH0yjwdGL7z9oiG+LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=lrd65nOG;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q8uM6mhI;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCBD606A320
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBCBD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=lrd65nOG;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q8uM6mhI
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 86E461D003A1
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 05:17:06 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 20 Nov 2026 05:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795169817;
	 x=1795256217; bh=BuXhlSKg00a4CpooMZ1asDKzuO5wnOZJBMwl0XnHxMM=; b=
	lrd65nOGQ9AxiKwcDko0U7X04VpVb1LuKQt1QNWwZt0YHrnppMe8HKr/arGQ5Eok
	GJaoAyJSZjbckbedw7e1Oqclc2g1DtLaTVDhZGlfXkqste6iWwZ6jjl0M+qwOzhX
	jGnRgCvEoMzqHu75ZG8aGjG2xm44k3ht2Ct/sxNZ33pxo0nPgPSa+ijt6OPaBafx
	NqxpaxgqqZkUCXtLV63vB5CY5Te6TlDhOVAbI+rleV0aWuvVzMwcx/Veo6nQNQCs
	AqGnlQeOcNNSTlMBl61Wc8t8vJojatC1pSaCnSYJpBxIgXYx89D7QileDGMTyz08
	5IaSgJMhIzg2lqw9BD2t2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795169817; x=
	1795256217; bh=BuXhlSKg00a4CpooMZ1asDKzuO5wnOZJBMwl0XnHxMM=; b=Q
	8uM6mhIZ+PPM0igHpEfaxmK2pe/kQKgPu4mzjzvu15JZhYLNgPEH7gSBXoS0naLN
	oQaMGx1HlklWuW+jNZAisHdjSQPeXnXA9qc8GNSvyqSOSYqAEnr+MTErHWkDYWa8
	A7KrK1MybzJNtP5/1eeSu7smqdqBNE4daJLL1/1wsJBuLSzzJTXXViBZlMfitj5x
	hE6596YuPnlR/D6pi8sQhAUXwov4eYP06gAXWiuVaCgC0KHLUHecu8QBytE1BymL
	rkCcZNb9QRAQ7AFbkOvXisI3uBFNuHFoKMIW/d7IRcBfXCpnhVI6Gy0UuOzhWSMl
	xxujL+gZNs3dVABK/KXjg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795169817; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:NVJqBA7eKMFYJWmLjMIG2NPRk1XYeScCLkPmfMKw8KlSk3Z
	az2PbWU9zkUG1iocYOGa0BGIJq4oajQxroTfvYDWkcPkEtfpwo220Z74TIdc8KXp
	7i4LgLf21nmUaFsVlV2Gpz+DUP4TrXk3mi0wzP+YrhMcNwiQODhcB7INu3RMPxMM
	jRzqtVw9xoh1VCYP1QcjNDvDU+Jk8uJOUXcI0mnHa7TZmbF2WxUo3Ba+MHVu2jdl
	FD9Dv/JXxIAEClPnDZrHsoIAyH6nsRv4tMcPErNFUU7gFRVVjyrxZh1lij8amZV2
	6QeEllqxm2bMcz/Oixo5k2d+ON8VtDVssegxkCg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zuSsEhmCwr6Wvsb9X06BQFozbRPwmHJVyho9pvXTxSo=:mGu+cZMGELOH0bYyds92Q644h116pbc8B12xMlx7qxQ=;
X-ME-Sender: <xms:ER4Aa7lO5umD3sr-TKj5kNGsKI8wBBtS2M0-dcWs6QtR_INEScQoog>
    <xme:ER4Aa5qO5F1L2_61uu_MvkmwxazML4N7Mc_FqW7UZMVVmx1YZDxLOyY8OYVxafOMj
    iVb3ctbJB9I15cT59eZjmavKzKCG0gdU7o4-3haWT49Va9jnMKoAL8EdA>
X-ME-Proxy-Cause: dmFkZTFsqBHJi/SORwcvKmFMVQF2oUrONn+po8KdzOVlSsbWms9cCSDOyBdd56+KzfUPQU
    2X42s5779mPNAiTMVFZUPGbqhM7epcvvR2MPGjDQwB7R37oOEK6tyVEgkAL7/q+/ahPVap
    NeH2VcC5R7jB0RTnG1Mf2Dp3losR7T5ymz+62cELWGnddyd/9TmS2hLGCCPFOT5LJFqs3N
    XaIpXbn0r3peZdWBHWif89mdsRbh6/6AtlmeDrI+6RoG8+ZTrrW7a7OeLDd4lvsOR9buT0
    D74Tom2Bnx4DC4bbrg8uwpPgVgjhsMivxjn6icPGINxpGvShklwxxvQK4VaHQFSiEraZMC
    xETAMYCZkJJQQ2961g2sx20Cgo3KT/REaHIBg93dlyvDPTYn4ur1skahcTcN0G+xo4lB5h
    ajQycmI5rJa1jJ67KtVQhTtLu/PyG7KYa5VQdg61bRYFylTI15GsoRWoLB/X0XWajtTaPT
    GZVkANeDrHXq5VC3N1G3W/KVvRZbcd0BX6oPQAVzlRC4virYfMcesT7+o5KWxVJiBRM9r2
    D49vQbnnm5iL8fO+nwGExVlvRBgp7+XCG7+/D73eB/IzBx5Iw9MehaCYHZyj9FGkVt1139
    Jbt7Gy7yFQiC6enD7KLL3y7PkgQIKWNIgd5bFoqlpGFqchPZqz9/JPpVpb6Q
X-ME-Proxy: <xmx:FB4Aa_gaDQRwBXTEb7PnmRSAAfHySWI73uaIt3LlMbF_hgd0Sz5JYg>
    <xmx:FB4Aa7dv1ofwPwh4m8S7HRxw00z-m5ye4xEC11hBQoYFuIX1wKaqIA>
    <xmx:FB4AawIAi8H2OVdVYypI9jeNC4RSz49wPwT2tyNluL4HA1rxUHiLZQ>
    <xmx:FB4AawlAszsQNztJyLAKB2253IZThabYUEdU2GIy-SBhBfVSHiV_uQ>
    <xmx:GR4Aa_RsJ4-fSKP1fJY0RpYuvoQ3kE2ZxFN9vRS21E7SA4LIFs585KKW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 600B132A009C; Fri, 20 Nov 2026 05:16:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AQsIS8mXxcAZ
Date: Fri, 20 Nov 2026 11:16:09 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 sashiko-reviews@lists.linux.dev, "Arnd Bergmann" <arnd@kernel.org>,
 "Gregory Price" <gourry@gourry.net>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: larips <larips950@gmail.com>, "Zi Yan" <ziy@nvidia.com>,
 "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Rakie Kim" <rakie.kim@sk.com>,
 "Ying Huang" <ying.huang@linux.alibaba.com>,
 "Lorenzo Stoakes" <ljs@kernel.org>,
 "Brendan Jackman" <brendan.jackman@linux.dev>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "Jackie Liu" <liuyun01@kylinos.cn>,
 linux-mm@kvack.org
Message-Id: <45a71e8e-0c8c-4b5e-96c9-be6f2ad0e364@app.fastmail.com>
In-Reply-To: <3b00e53f-b4eb-41d4-b3e6-791660da3342@kernel.org>
References: <20261117211635.2472067-1-arnd@kernel.org>
 <sashiko-outbox-221983@kernel.org>
 <c420ec17-b297-469a-927a-85934a05fda4@app.fastmail.com>
 <3b00e53f-b4eb-41d4-b3e6-791660da3342@kernel.org>
Subject: Re: [PATCH 1/2] [v2] mm/mempolicy: fix copy_nodes_to_user() for odd inputs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Nov 20, 2026, at 10:55, David Hildenbrand (Arm) wrote:
> On 11/19/26 16:52, Arnd Bergmann wrote:
>> On Wed, Nov 18, 2026, at 22:16, sashiko-bot@kernel.org wrote:
>> 
>>>
>>> [Severity: High]
>>> Does replacing the compat nbytes assignment with the compat copy
>>> assignment leave a 4-byte gap in the userspace nodemask when
>>> BITS_TO_COMPAT_LONGS(nr_node_ids) is odd?
>>>
>>> Without the compat nbytes update, nbytes stays a multiple of sizeof(long)
>>> (e.g., 8 bytes when nr_node_ids <= 32).  When a compat caller passes a
>>> buffer with copy > nbytes, clear_user() zeroes starting at mask + nbytes
>>> and maxnode is clamped to nr_node_ids + 1, but compat_put_bitmap() aligns
>>> maxnode - 1 to BITS_PER_COMPAT_LONG and only writes
>>> BITS_TO_COMPAT_LONGS(nr_node_ids) * sizeof(compat_long_t) bytes (4 bytes),
>>> leaving the word at nbytes - sizeof(compat_long_t) untouched.  When
>>> copy == nbytes (e.g., 34 <= maxnode <= 65 with nr_node_ids <= 32),
>>> copy > nbytes is false, so maxnode is not clamped and compat_put_bitmap()
>>> copies the upper 32 bits of the kernel unsigned long instead of zeroing
>>> that word.
>> 
>> Same as my reply for patch 2/2: no, this is fine as the size of the in-kernel
>> buffer does not depend on the word size in userspace. Copying the extra
>> zeroes from it is fine.
>
> I'm not convinced, especially given Gregory's test case. It's all a
> confusing mess.

Right, I see now where I went wrong: 'maxnode' is adjusted down to
the nr_node_ids, not the number of bits in the bitmap. So my patch
was wrong, and Gregory's was correct.

> I do wonder whether this whole function should be thinking in terms of 
> bits to make
> it easier to follow. A bit more churn, but at least I can understand 
> what is happening there:

I like this version as well.

   Arnd
