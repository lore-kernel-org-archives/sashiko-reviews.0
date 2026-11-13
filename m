Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579575;
	b=YaHaH8JnGt+vYilJoaHlXOZvA9yTVSENVJQaWv1YXyLX8T0li1eFXqLz79eK40w9PlLr
	 sJ59HoegTFNY8Q1khtUZX4IFhQRNGoXxwGUH7vgVpzvvSj5dnx/X6IYI0EmyqrR3KaB/8
	 iHODTZQmwSKyReTnnyLFQ2TR4oexvrDRh/BBDklEPFnAw3T6gQY2hl8kv8mS3/gjcnxZh
	 PgtY2BIk4+9HzqIe3PH++CjS0GZw4I6Ap9ywICzFmbydBmjGap2b1ECwvWBq7VLAGAPg/
	 1IK7uGtBhjw6CU+5rnMK67g/FPFdPJyGcCSIgblWDVEV8K5TlcIUhCYHScJ4hbMy0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579575;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=RoUJPoDvqPyMYdvLAx7wuzjFIAugHN09/qGUDFufoyw=;
	b=UnZbU13KIpkzpFGOkKf6dk6cEHpBZWuuBpTS4Nsvc1qc/G9B9yhC/4iybpWelMMvsyV6
	 XpUX8vmeBjhW9qHonuOyEAIYsfifrxGeoG9JQeuKdWkskMQbbsJyEO4+SsYcDqWEyyFtF
	 UmnE6qxajbZs5XDOhTLAV6u8wt+N+cGou/0pH0sG4rKqT6aYSRipDMIxbbH/bHqgKKHBk
	 dcZrvI/vI8fxZjPBHQwKcC5WXTkW22ea31CZpv+xm5K54Dy/bFRPSPSgfAmxtcSDhl7ML
	 WJQUucGEEFCCjbkWwA4dFXxSl6Jro6rkTacNavjy6CK0uby0h5gQ4XYpobgvZ9dxO6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=CmTQ43rB;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=X16WGVVA;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E2B606A32D
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 14:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E2B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=CmTQ43rB;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=X16WGVVA
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 87D39EC12D9
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 09:19:33 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 09:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794579566;
	 x=1794665966; bh=RoUJPoDvqPyMYdvLAx7wuzjFIAugHN09/qGUDFufoyw=; b=
	CmTQ43rBhbkcxyywSU0bptwkSqP6To64HsK5B8YL54z/R5clS28bSUfGkTSQcfu7
	ALMrkgVPuiRH+kOqiFnXjy9YweGLaaOfBxMP4BpW81UtvpLMti/a7Id0educ0Ibd
	DM8NPg5hWfh/UWw/IQqjtdpITUfCsnSDVPj5lQgQU4QDYNTE0jPgO8MKui2bkX/S
	XPlLt4abhXs1qra3zkUV7Blo4jplQvZdgo62hBNtpNlJMMx3nswF/k8bA4rhpClP
	7TUt2m2aMCLcGoifqqhKs5kkhhEzblepw/XMd1GdL4XgD2awgyT1u68OmBq70fJT
	7X/GaJGfxBEgu7Xr/Uqncg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794579566; x=
	1794665966; bh=RoUJPoDvqPyMYdvLAx7wuzjFIAugHN09/qGUDFufoyw=; b=X
	16WGVVANI6Bqsy0uCsTe4x+zQiKpPZe9eSyhr6jGzPe9x9YMtI5yJqtk0MD6Qtwx
	HgjsfqvpN9S4SAO3QSsEXrCgA2Yo7slHfOaWzNH4FsyCkc4OBXLL6VpWZ1QYHFVw
	mnD1/dS00+PMLEwRU8AuZdgjqB6KU/vePt0Aq/pyfNkMqUWD4EQF+7zmJpX7ZAO5
	cw7QVJeicYH9lirqrwLilYF4cKHAV4vYhQ3tBBAZAI1CzUIwXIgd5OSzSMSpsBJF
	4Zip12t/GvuoJh8PCZbeswjzS6ZyYJ7xJdXKxcv8sss1InBwjkNSsAP8Rps8PZQi
	ogUOw8DKFMBW11XghO6ng==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794579566; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:SGyrEqwB94XQPLYu1VH/y8tyR3BDnxMNXsghRBWMLh4vDOn
	PiGTEiUavHIOJ/7LOiAQrnGWs339BqkyZPhiO2Xp/bwML4t4IaPDIFj/yczQgHZ0
	6Eiq/ps7xWSwKjiQWDBYVhjaQrquyrDProDgPqyDVaG4EqutLtYcBBSvFENve2ZI
	EzAePft1bOLnTTq1H8Ks2gzgOxi6LH4eseJfEMKAqhJZZGvOppcNJ0yYTPWseRzl
	A0ItF4DAeLfIGdv1NBOOgsznoVSUd1XVMMDBqBL8NWtG79WL26VCThtFxEsDZXqM
	poUHxN3vOPek5VxSmqMAmOPTNen0RtlzsXsSfyA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:wtdkm8qMoH1idKb883rNB76Vp10NABjxoQnp9E0viKs=:B7YiVtR0x9J0dYjfQTIGq65fnKeg0k+9jyGvYJDIcmA=;
X-ME-Sender: <xms:Zxz3aq-1MXSyvJlOCToClarup4KSpOgP1q__TfAaeof1DJ7EGbrO3w>
    <xme:Zxz3alhpSD21XzllWkSwOR3KSR348xbE2yibNqdEB0YeMcy7M8JBKYqKDNTdxzger
    _38B3M9q9p0H9V28qGdaf0qrnkrgFr_WuE51I-lIz95KlzuGvEvLO8i>
X-ME-Proxy-Cause: dmFkZTEUbeBCFv6J3xC3FebRJK+AUjb1IUXCOcUbsghJIWlnF2ZS1EW33U0egd23z4Zy4T
    tt8oubCPe42K6/ZYcmo8IIGtXnOIXLQvQ8CfOmjTl6V72JTKA9OuPd3jnrjL2AVfappj7N
    OBDVVB/EQaO9sT6vVIyW6k2vsxKQojH/P/zhTVVd/rz3QBMxtGSn/U2miHCiN+XU1ZKiBa
    1s/QVDdylMFa2nHz5ao1iqgL9X6gx6uwA6ZFK2EChRbmiqCoMud4OUNILzDihLkGTl7d4G
    qsODNF1zNy97PzqR/G02uhk7UkJBnkt0cCaAT2mISpTzmrq5VI2NFV9F+T145g+uvSTQUh
    hz16/Cyr/49qmisNWrebI6v96Y74eYzmmdG4PY6JzSCKqsETaxSumpoHPv0yyMj0ATdAEJ
    BJoedHBOgjDhP4fd1IlCUfB+nwUVUH8wjTq3m4IvQ5ycs+SaOnrTBQL9EJQGMM7U8IJ7Tx
    2WrsSgur8WQZCAczQzcuGQuaZTb4hxwr//Bnyx01WtorUmZvopAJq5PTvmK/3jNGp8sMd3
    m8hHk6Tivw57m6Ive0LnTb9V8kXN6W/42Q8m5d+j86CIJ0MJnvS6ZHRp8jKDpwqOGvbGPB
    IDdOEL28N+nRtWvahSxAP/RoU9RnAsNc5Tctg+K2tqk1BfKm7AoYdZTz86rQ
X-ME-Proxy: <xmx:ahz3aurOslNFv6Oft_IRmYk5AIAoT625RsEdEdYDmDw5APrQAfcI4A>
    <xmx:ahz3arKTRtTdAJFiMhlYCfYL6l2MUwy-TcpVhcVVh5bdjDfoEiGOjg>
    <xmx:ahz3aqDq0sSF3jR4QAVUEUL9JSTSXwDRzKeKNF_QQiy_ZtgoOw80wQ>
    <xmx:ahz3at7xfymhRZt7mmM-4RZ8HMpWmu50Rbkbcj8nM5ma0o0aw_cp8A>
    <xmx:bhz3ak9abl_Xa5ZlTqbigXkWh38eXBJYNio0F0uX0-4ttVAB2dTVm1Uc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2636932A009C; Fri, 13 Nov 2026 09:19:19 -0500 (EST)
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
X-ThreadId: ArjohY43VwOF
Date: Fri, 13 Nov 2026 15:18:09 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: sashiko-reviews@lists.linux.dev, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Jason Gunthorpe" <jgg@nvidia.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Matthew Wilcox" <willy@infradead.org>,
 "Malin Jonsson" <malin.jonsson@est.tech>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, x86@kernel.org
Message-Id: <3f53782e-5def-4ff4-8d87-27b6d3b2a45e@app.fastmail.com>
In-Reply-To: <sashiko-outbox-212720@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-7-arnd@kernel.org> <sashiko-outbox-212720@kernel.org>
Subject: Re: [PATCH v2 6/6] ARM: add CONFIG_VMSPLIT_2G_OPT option
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Nov 13, 2026, at 12:26, sashiko-bot@kernel.org wrote:
>> @@ -1052,6 +1056,7 @@ config PAGE_OFFSET
>>  	hex
>>  	default PHYS_OFFSET if !MMU
>>  	default 0x40000000 if VMSPLIT_1G
>> +	default 0x70000000 if VMSPLIT_2G_OPT
>>  	default 0x80000000 if VMSPLIT_2G
>>  	default 0xB0000000 if VMSPLIT_3G_OPT
>>  	default 0xC0000000
>
> [Severity: Low]
> Should ARCH_MMAP_RND_BITS_MAX also handle PAGE_OFFSET=0x70000000?
>
> arch/arm/Kconfig:
> config ARCH_MMAP_RND_BITS_MAX
> 	default 14 if PAGE_OFFSET=0x40000000
> 	default 15 if PAGE_OFFSET=0x80000000
> 	default 16
>
> With VMSPLIT_2G_OPT, PAGE_OFFSET=0x70000000 falls through to 16 bits
> (up to 256 MiB of mmap randomization), which is twice the maximum
> allowed for the larger user address space under PAGE_OFFSET=0x80000000.
> When KASAN is enabled (shrinking TASK_SIZE to 0x5ce00000) and the stack
> gap reaches MAX_GAP, a 16-bit random offset can exceed STACK_TOP -
> MAX_GAP in mmap_base() and cause top-down mmap allocations to fall back
> to bottom-up.

I've changed it now to use '<=' instead of '=' and hopefully handle
do something sensible for any PAGE_OFFSET value. I'm not sure I understand
if these are intended as heuristics or if there is a hard limit we
can use instead. Should this be 'default 14 if PAGE_OFFSET < 0x80000000'?

      Arnd

--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -329,8 +329,8 @@ config ARCH_MMAP_RND_BITS_MIN
        default 8
 
 config ARCH_MMAP_RND_BITS_MAX
-       default 14 if PAGE_OFFSET=0x40000000
-       default 15 if PAGE_OFFSET=0x80000000
+       default 14 if PAGE_OFFSET<=0x40000000
+       default 15 if PAGE_OFFSET<=0x80000000
        default 16
 
 config ARCH_MULTIPLATFORM

