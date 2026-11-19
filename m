Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102909;
	b=MvPKJO15aSgHrkMEnr4zqo7zxixs2bnKfakFmmRGnaFeASY+1+Ku9URhBnSZDixUy4qw
	 SU+HzfevDXldgon1GLWIKox+nh8GNKliKDXRZvLAe5lLsfrI2eXpYhnVIX04S/mD5btWE
	 XyT3elhyPL3w57P0Gxfzd1wer3JeA9PaNKb4p7n5lSAP831rp9m/2q7DqDh2Aplh7wIls
	 aGWOrV8ZwDhZV6Bu1G6mCZom2k7EdeJkhVwsky9burj9fVja6aN+JvYtrE9JAVBFJu7X2
	 z/EXp+e+N/NhNwYgGCwmFHouznBQohCc9bXheV5y3NczjgnmxgtYXFXfOFql1o2B9tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102909;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=B90skwYd1qAmd6vMKCEeV0qmpHWsdX1OY5Q+tOw1v8k=;
	b=F0vDEd+e7hrT/QtSbKvS5i7EMmVxd8dSeblsuD7PnM5dJ87kBCz6eGvasBBXKC/qT9MZ
	 bNFC7DbpM1KjIGXoOkXK8YhlOuY/0Tn7gnvX6iFUGdFX/r5e/niXje2uojiHV8uzo4V/A
	 XkndqazQtf8p0UO+S7ng0Ywb3AI+NFQ0SFXqd3g+2R6aSK1MYyzaI1Z1SICHPfVrmQS6E
	 1zP6i8YaKF45f3+ttN1XjdyzhONBPUQE3Uox1zPs9LuD0EbJAiv8tx2+XCUPtTZgY1cd+
	 WM8lf8NB4eBRE+foC+7MO6TdE3r/syMJsO/K/0MfCaDO1pd3tZ8e1guJ5kmqNE3nFug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=jxBs8QIz;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=2YS139lF;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2FA606D6CF
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 15:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2FA606D6CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=jxBs8QIz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=2YS139lF
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 2E29FEC09CA
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 10:41:47 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 10:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795102900;
	 x=1795189300; bh=B90skwYd1qAmd6vMKCEeV0qmpHWsdX1OY5Q+tOw1v8k=; b=
	jxBs8QIzA0cRfP5Vyv27H7cm/Mgi2VLx+9pXZf/uUtuZxWU5R7hk2YhivLz8e+l0
	Dr3BmhpPvjCU43mmBeOHDIoCrUF26KS5s7bb9ZA/spMjm88qxIrnSmWheGr4ZvDN
	oGYg2e5QaWf7Wryhzp4vVkmtpCXQ2f8Mr5ZaOXAuALKe5b5+ND2kHefB8Jrl0WLo
	X5yGG06pmih0n/YjABV2WTk73/IcZKZLx0yszpb8Wb1QVQBbQLFXYDehGVlBnl0i
	XBVsKHwfqsu3o93tg2WPt1TyCnQGaB/c87Ymc+AHVLUUgDM/LMeJQ/dLj5959qHE
	eYMbO1oWxILiLKKmIbF+/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795102900; x=
	1795189300; bh=B90skwYd1qAmd6vMKCEeV0qmpHWsdX1OY5Q+tOw1v8k=; b=2
	YS139lFRvGoiiNjtE9oJ8CsAxkEm+Hi2UMvQUE6hsulPeutovXmasdKtXvINVHY7
	V+6KaaSjf4Z6N7uLNpnvtDuBjRHtwn2vfzfMEL93jdAEXdbh0MKvbocWHZQHpmM3
	tHp4Xh9tz4AT8o5ypSeMpk04e3g3Fb8xNOCLoHfKrVS7U6zZnZNG9c4fjPF7txQz
	pFjTuIK3mPH8Lf+gbPf/V5MuUIGTf6hqaR5dnxbdGkVp+HFQ75jomfna3sNCEezl
	FszscMm70xUmCiJEzEB/nwdhD974kan+M3LnHMqrUAHLwBPcfMCUz8KTC3oZ7ULQ
	W4893cFUeIKnGP9MwVo/A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795102900; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:RyXNelzWwHzB2yEDaPxUmJZ6nKX3tSgjHis7TiLL23SrPZI
	vIIcrZTPme1rZOvvVjCCxDiZG1zdnNCGqQ5nbG5pWL+eMi0ZsaRHbXox338PydQP
	qOnD3Wtt1fZMC3o6bZa84rbLUOFDm6vyX6EKbE7E+npMusF2Z8b9EHSjlTrvMFJO
	N14lnV/li3beUMOlCf3I56GeS9/DykaYY0WQjwTfv5FsVlX31OsvEkvB1foxrvBg
	11i502YCrD1VaRBRnv6gl1Dth4bdwWHXCX2c37tK0awOO2m2mlp1ztT1WqixM1yp
	agP1/mreLweU5OALnLDkrfzbIdsBRoYjnYpiAuA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:cqK5PiLMkNzckENgfaCg7nbFyFe9CIzKtv2VFzo4Kk0=:PDLbKJ94g9ptr4Hqb/6hre2VJV5CWdTnyy9JTZKadEE=;
X-ME-Sender: <xms:rBj_aqaGtwHUeudDvg3WxR4DEB1BTFIPp7YQsWl6UAtkPo0y9TGVXw>
    <xme:rBj_aoNMtI6tj7q3bAgadN6dl_fKAOqckIAGABersr4FFnr8JwkKfuzRgoHZpU9kU
    pDnbFe9MWKlo7LBgQu4oFiRh3yp8BSN_9WDBxpo6_rz8rLbncMuquz1>
X-ME-Proxy-Cause: dmFkZTGhxffOCKON5IDM7Hol7QKiToOPnne2UeAT+FsCmz3R6i3Hgq3Jan1P0d6FqT+qjo
    iCZIEOB6f5lnrCHI4o4vRFSt1L7+HTKcGr7QtGEHeICoss0BI1XhhqHJrigSqQFW7dq2HL
    7Rk2rhBtNaspcSiipyqCP2/czVK4QA9YLJHv+/fDvHKSaZm0rrSIjzLBiLDjJXvi17arWJ
    QnkrXiS51C2TDiiAqWaXo3FN7Ta6z9IX/Ag6g4ZbxR88bPXD7DLzbZWBkpctW9YIJjBCok
    kjpjJDN9r56ACjf8Jwid1kuZYRpjhhboc/eB75i+uJMPjZEWOaw3PQEKErEKN762tHV8Aa
    529teFEBUyfqqupt1LcliMumuqD3uSVX6co1EbcH2cp2yR/Ih6aEWp0Qx068lzv+R1yDLP
    sGO4gBS2KSTBEgdTTw6g915PHBv5DV4vZ172ZYM2Aya5MY07W0WlnW+Zl8sDOWjmP+FJFx
    DIhRiP8mLb4SxNQeWycgzdKw29lUrlnA4U+PwuXtqzzbx6I2x3Aue8N03WaJSFPWznVTck
    krJr4WJUDINASA9FM2ECeYzolHmiXppHdNdkbxbyZr8uInMu4vNx0b96vbew89iiXqgO2y
    q8WTdYfvmPgts41KlqjaSVwAoE2OS3pGApdG5XlBr5RWzh57+2y+BPH92lvw
X-ME-Proxy: <xmx:rxj_ahfv8VBMqTglDmN7YK3JRLurqk2byWctVi7rYqQrdHPHx0PgHA>
    <xmx:rxj_akzWuOJdHmREYyeup7ZXGt3NCk5Q9OC7NmP9JaEDQE7-AImPMw>
    <xmx:rxj_akEOnSMorn-vHSp4Y90jKOOaNHvPk4OT5IxKSOU2OmSwmTGX3w>
    <xmx:rxj_ar21H6bhJCqdoucIDzu8IPpt__63s0DpRZwhYKBSdz789VjFPw>
    <xmx:tBj_ak5Yp4mt2ns3XUMTLZN-yrtIM5uObcBHY_ZE4z2LrBuprcmDH6aM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8351B32A009E; Thu, 19 Nov 2026 10:41:32 -0500 (EST)
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
X-ThreadId: AQiCUw1cg2MN
Date: Thu, 19 Nov 2026 16:41:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: sashiko-reviews@lists.linux.dev, "Arnd Bergmann" <arnd@kernel.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Gregory Price" <gourry@gourry.net>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: larips <larips950@gmail.com>, "Zi Yan" <ziy@nvidia.com>,
 "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Rakie Kim" <rakie.kim@sk.com>,
 "Ying Huang" <ying.huang@linux.alibaba.com>,
 "Lorenzo Stoakes" <ljs@kernel.org>,
 "Brendan Jackman" <brendan.jackman@linux.dev>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "Jackie Liu" <liuyun01@kylinos.cn>,
 linux-mm@kvack.org, "Kees Cook" <kees+treewide@kernel.org>
Message-Id: <cac60b9d-e969-4933-8b0f-85b7983ec838@app.fastmail.com>
In-Reply-To: <sashiko-outbox-221984@kernel.org>
References: <20261117211635.2472067-1-arnd@kernel.org>
 <20261117211635.2472067-2-arnd@kernel.org> <sashiko-outbox-221984@kernel.org>
Subject: Re: [PATCH 2/2] [v2] mm/mempolicy: replace copy_nodes_to_user() interface with
 put_nodes()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 18, 2026, at 22:16, sashiko-bot@kernel.org wrote:
>> @@ -1733,12 +1736,12 @@ static int copy_nodes_to_user(unsigned long __user *mask, unsigned long maxnode,
>>  		if (clear_user((char __user *)mask + nbytes, copy - nbytes))
>>  			return -EFAULT;
>>  		copy = nbytes;
>> -		maxnode = nr_node_ids+1;
>> +		maxnode = nr_node_ids;
>>  	}
>>  
>>  	if (compat)
>>  		return compat_put_bitmap((compat_ulong_t __user *)mask,
>> -					 nodes_addr(*nodes), maxnode-1);
>> +					 nodes_addr(*nodes), maxnode);
>
> [Severity: High]
> Can this leave a 4-byte gap of uninitialized user memory in mask when
> called from a 32-bit compat syscall?
>
> nbytes is sized in unsigned long units (a multiple of 8 bytes on 64-bit
> kernels) and is not adjusted for compat, whereas compat_put_bitmap()
> rounds bitmap_size up to a 32-bit compat_ulong_t boundary:
>
> kernel/compat.c:compat_put_bitmap() {
> 	/* align bitmap up to nearest compat_long_t boundary */
> 	bitmap_size = ALIGN(bitmap_size, BITS_PER_COMPAT_LONG);
> 	nr_compat_longs = BITS_TO_COMPAT_LONGS(bitmap_size);
>     ...
> }

Correct.

> When nr_node_ids spans an odd number of 32-bit words (for example, 1 to
> 32 nodes, where nbytes is 8) and a compat caller passes a buffer with
> copy > nbytes, clear_user() zeroes starting at mask + nbytes while
> compat_put_bitmap() with maxnode = nr_node_ids writes only nbytes - 4
> bytes, leaving the 4 bytes at [nbytes - 4, nbytes) untouched.  In
> addition, when maxnode is between 34 and 65 on such a system, copy is 8
> (equal to nbytes), so the copy > nbytes check is skipped and maxnode is
> not clamped to nr_node_ids.

This all sounds like it should works as designed:

- when userspace asks for a larger mask and only the first 1 through
  32 nodes are set, nbytes=8 is correct as it copies all eight bytes
  of the in-kernel nodemask and clears all additional bytes.

- When maxnode is between 34 and 65, userspace expects a 64-bit mask
  to be written, which the kernel correctly writes from the first
  64-bit word of the on-stack 'nodes' mask, which are always valid.

Setting nbytes to the smaller value as I originally did would
also work in both cases but seems more confusing. The only difference
is that it would pad four bytes explicitly with clear_user()
rather than copy the zeroes from the in-kernel nodemask.

      Arnd
