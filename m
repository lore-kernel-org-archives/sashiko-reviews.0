Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987214;
	b=ywMbU7Zp+pMiT2130keqLJcyzZdAV9CvqCEBuh08N1EpnBllMdXtGQ/TW99/a/lJujqh
	 u8ReAFrL8HdSNfjQP4OldxTLHFCMd3Z74DFekiu0ddd6vTPgBtHhDcsmFAk2zsvwDWdYG
	 xJSKZHlaKC29mT/WFKmDPCWb9tyF5IvHK/h+624h+Zg2dpBKuDuKUVQP3C6jRDO6GxXln
	 5F/DQFJyMGIhVGXeuLCUW5mVr1g1KGDCDZMYJ9UeFD8WJBzeyIoIWe0IB/C1ry6akm3k7
	 4Rnroa5dJzuQRaGq7YusXJ4VbGZ1C2C37VVoCnMqqtqpTI+j93d2pCNKvAwIKqvPjUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987214;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=6roDSWKnYyHAhFGjefNyAWzSzOxePZ09Dwe4DFctx3s=;
	b=KV7WIyXV0WHiVxfLW2lrzKbOptJVHwrCJxO3qVfaQioDAWLFgrXv69leGUMKpKMhNwtU
	 aprti9ivloJ2rzBBEJcEVqNmvgjz3iejKSA78x5kntXiuHFe8c3/4uvYeOzvzKVHa0fyW
	 Nn3txdXwZ5WeGVndMVN85c8vdPEpFJzNxd9pDzih1TV4rt//g9T26oiVAeLGPTe91b9ya
	 ZyBOLcDWTvjWpeTHeGBjr22MfyO2XgfevrkxQTjNYGaiq/qrjPgWaWWXUa/XeKpiqlY+S
	 y3vD8Zn63xB++G3inMEqLfSGicf/xbqkd7Uq75EaWhhwUD/Wl1RCA+s8lL7LdyY1UgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FtAfBeWP;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=t+geoudq;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7A1606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FtAfBeWP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=t+geoudq
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 1F1C2EC004F
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 02:33:32 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 18 Nov 2026 02:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794987202;
	 x=1795073602; bh=6roDSWKnYyHAhFGjefNyAWzSzOxePZ09Dwe4DFctx3s=; b=
	FtAfBeWP05mO3mjgSHEhdJkMMO2Dhv1keipU2fRO41MXR3pxhwg0R1N0R/t1wVfO
	Pvd2ztDdtrGRU4bv9C3b3UIO3fwJy1qnwBbedcCKeCeRCEHNaZxzN2cgHLvosCDE
	V6EceGhBhv4pp21kYsbJNtJFXUhXBtrqip1B6qVlUTQcwt7N4s0zSiDpby1ohbP8
	dUqAR2LPUSUjzogTf2MaHVuBguFSfeicrcmV7uix4cxR/FixB5BzAmGGsRI2p8oX
	No04xYOXBCw+3qjq8QItzYM/KlWOdGyfSDfKTDqVaj32tGhhqSRNFUNbojDtMHyg
	77++Apudunpow8t2b3z/jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794987202; x=
	1795073602; bh=6roDSWKnYyHAhFGjefNyAWzSzOxePZ09Dwe4DFctx3s=; b=t
	+geoudqzCZdXI7xRBPxWAxQfDavmdSiCh3UWuA+/LzYOa72IKwEiTHpetRP5sp89
	VkAhQFFNd3lWU1McdWcoeYCsJkw/Bx/Fkjxeb7uGzi1ZFhjvqBkTtsMEBn3DNgN3
	i9vDqrWKSIOTit8wdZhhDjKVV1WE925DCvL6PYuyQByEK7DEJXqDBpSYt9Y+b0VP
	jKpzuDd7761LtlZAQhIwxHIxInhL582dH17d+RPR1kJPv1OL4ArX4BgCOc68USVL
	VI0phge7mW1vCl3d0pRBb9ZMU/XkOlxp5Nc2CBljPDN9qkSi8U8eu2vKgkr3He9s
	VpSCYiUiFhk6KiqFSVRGA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794987202; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:Hw9itU9L3QJIfDZ407K+gPRKuwf6NdlmHs+SnBKVqzl8b3d
	/tfU9GFEkhZGoRogi/TTt3mW1dwRpUlvKRcVpstuHg6hDBisIKEKQ0HIP+q4OmjW
	BI+3ZpwinMS3ZV/DBV3a/UuFpV8g4KaVFWu3Zzy9ZDK7YBPfnxFJjplSB3LIvvvu
	72MTURR9iJc/TQDAaHQINxo0EXTezP3wUOWwEF93xdqoF3KtywOO+puVXx4cUQYw
	SbtbYzypqVGqEfAzbsa8RUnvEGgGV56k/hm6I90H9kni9sykQw4as6D03RzsGd61
	OGeDpa/ZBhBoqRaKRc58K4aODcNsuH7M9s1ma2w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:5alOQ/kZTW1ADDPVsGb9Gsh1WMyH6IpMfJ+BP/o9nTY=:QhhX445hegpb8c5Ib1paEal38B/c31H5pkzqP+4lcyw=;
X-ME-Sender: <xms:tlT9arGY1N0PjzpgmJbNdzuTyx1uxPrx8g9M_yA-8Q5RAgB7arHQbg>
    <xme:tlT9ajLdbpEBLv_HeTM9N5tV-btNFdlCYpBcoBf8VYYHSZOAv975XJlelr_PFbCSz
    Aj8RDP5VYfDDjd8wAKILkvvm_N78r4CaJ8pkeJyl0FxU6gpWEW7V-gl>
X-ME-Proxy-Cause: dmFkZTGgfH0TteI8sCoU1B+TMlwUpoxX9porz38r8z/m79WUQSZM1xYeyUI1aGcSwrgj+e
    Q1mvrvvl/LusFwPOfMMEaJ9bz16L8Fu+rinuEfLzMNhUVBI6LQgJmT1IijSGA0LW4OFjXw
    +UdfYHyPk6MDpiglwvT64NWn/yfd4pnB9tliApdUNEyScvEM1TlYoWkHI0TN88P/ZFHUo7
    mkXP87EAcf5fuV1lE1TLPyhgXJQgzAtJeG9PijfYLqQCIU5O8VQRyGQ8blYp6JUkMLhpi2
    TUWr3j9E/dwBpXDQqXnQp9cpdmrkS84QGRgcXsp49ZTXEMROXpEevGXLzPo6RJHlBD7Us2
    TLDaRuqhXI4BOXwKHqYdwDkWzv4xhsHwBfeoWhm4KQS9DZdy2MRFfeSqCHXm5gJylB7Bbm
    r72OpWQbF5maiOo6ASd3oSP23jzyEq97cSh2KWFpfm5X/nPK77dE9NB6CcPopnPqoBN5J1
    opBUUTuKtCWyuYjYRB1jfKn5BkXUl4NtGSBz5HXHX9ws4CCjjlYQZONAaBDWkoBpoIT29m
    skjrk+op4paPOTFH3xz8WqlYSDzmcX4Dyp30vnBzo/boHvC+TC5AfWUFNdkmO88cgB05w9
    UHuhVAfNbea/lxB93AmyEPq2Fpwl67Vp0on4UBX9mjTrt2Umx0OHzlCHRlrQ
X-ME-Proxy: <xmx:u1T9an2YHy_2bNISHCZHsPweEgznIuxzOmT1FyTi1OUrqXNjqdG_TQ>
    <xmx:u1T9ajiBir9GWMQ0J9dNfR6i3nXcDh5Yw6gbb8dC6FTkznA2iKI3DQ>
    <xmx:u1T9an0QAswWsfX3evW7nUOYasU9Z84PK3dhhPSY3bv61kfQpiTOfQ>
    <xmx:u1T9aufrMbtRqpFHC2oiBFbQ2RGqWfvdGzG-Eq4uI58rvMaT8K6x6w>
    <xmx:wlT9aovyKSDhghaHhw9Ea8OTVkZr-_koeLJxU-AoMgxcOE6S-TLzfTi2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B13D132A0099; Wed, 18 Nov 2026 02:33:10 -0500 (EST)
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
X-ThreadId: Ackn33LzGE63
Date: Wed, 18 Nov 2026 08:32:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: sashiko-reviews@lists.linux.dev, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Cc: "Andreas Larsson" <andreas@gaisler.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Ingo Molnar" <mingo@redhat.com>,
 "Jason Gunthorpe" <jgg@nvidia.com>, "Linus Walleij" <linusw@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Lucas Stach" <l.stach@pengutronix.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Malin Jonsson" <malin.jonsson@est.tech>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Michal Simek" <monstr@monstr.eu>,
 "Mike Rapoport" <rppt@kernel.org>, "Nicholas Piggin" <npiggin@gmail.com>,
 "Nishanth Menon" <nm@ti.com>, "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>,
 "Thomas Gleixner" <tglx@linutronix.de>, x86@kernel.org
Message-Id: <ec881778-0f77-4f4e-be4e-17dc0adf8bf0@app.fastmail.com>
In-Reply-To: <sashiko-outbox-218805@kernel.org>
References: <20261116124832.662455-1-arnd@kernel.org>
 <20261116124832.662455-11-arnd@kernel.org> <sashiko-outbox-218805@kernel.org>
Subject: Re: [PATCH v3 10/10] mm: print pte in __print_bad_page_map_pgtable()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2026, at 13:50, sashiko-bot@kernel.org wrote:

>   print_bad_pte()
>     ...
>     pmd = pmdp_get(pmdp)
>     if (!pmd_present(pmd) || ...)
>                                       retract_page_tables() / zap_pte_range()
>                                         pmdp_collapse_flush() / pmd_clear()
>                                         pte_free_defer()
>                                         /* RCU grace period elapses */
>     ptep = pte_offset_kernel(pmdp, addr)
>     pte = ptep_get(ptep)  <-- bogus address or use-after-free
>
> If CPU1 clears *pmdp or replaces it with a huge leaf PMD and frees the PTE
> page table via RCU between pmdp_get(pmdp) and ptep_get(ptep), CPU0 will
> re-read the modified *pmdp and dereference a bogus kernel address or freed
> PTE table.  Using pte_offset_map() and pte_unmap() here avoids re-reading
> *pmdp and keeps the PTE page table RCU-protected while reading the entry.

This looks like it should be prevented calling conventions for
print_bad_page_map():

 * This function must be called during a proper page table walk, as it will
 * re-walk the page table to dump information: the caller MUST prevent page
 * table teardown (by holding mmap, vma or rmap lock) and MUST hold the leaf
 * page table lock.

Is that a case of do_swap_page() calling print_bad_pte() incorrectly
that I can ignore here, or should I actually change this? Is the
same race present in the upper page table lookups?

> Also, this isn't a bug, but the early-return pr_alert() above adds an extra
> space in "pmd: %s" compared to "pmd:%s" in the other messages.

Fixed.

     Arnd
