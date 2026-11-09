Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225502;
	b=owMuZ1AalNBfdlRuciO0mT87tRGMwhU0HDsQHYo27wlw2M8ixQ2iWV8hPXN1qC61tCAA
	 /NE5ySKn9P4h3NdU0Lzae/8DSfy+CPMB4JOm2583NwlahCyonTIHRDTn9SeD6aq3OnKgm
	 bduIr+b9IHB1zzUbx9s7Ny5cgYdd3+v4WN2y2DoQqJZCdV0D/KoHyHHwvnstxG6NDEFu+
	 yzVGmy7DyYLZM1KlJ0yj4xX0v1IpuFJgvqkHMEuqFFtd+qR+OM8JYPKY6rSQuFhcCUgVX
	 HBrWJt5GJ/pV1wg3eN9KrHhhFXY80zH3zqFqM3rfwkKNF7PnsvNgrl2lO1tbJBXGZSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225502;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2f74xI8ENOaYm5Fxf2K0EU/+aEKl3TphPyCxFled6CU=;
	b=Oops3ITSv6l2WXaouoYvE6+pO3mEr4bODZDdV1Y1cXgwv/wol3lut0QUcYpC1zoRApma
	 8s8/75OurTzErJ3UUGSD1a9PI820fRxuhvsWLgGnxFnQWTc/zdedZwg8TujgUwU/sBPuc
	 EmLC0Vdk4YtiMmEURt70ABaECMZOwtz3fb5BjNd1DbDqFVeNGIsT7W/vZp2xWNih8e4eZ
	 d9B/ibYAyCiBkTm9VdMCu6TmcFSyUuMeGka5DeXZ8ZIqMoNHjjhPAE0rWKwwwBTTVjW55
	 teTOFk6EeT/h965kc1tVX39Uw4JeQ4zlnM3GhCQhBANiBcp6cBd0GpzKqdq8gr0dtdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=qsTj4MUJ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FecShwTH;
	arc=none smtp.remote-ip=202.12.124.141
Received: from flow-b6-smtp.messagingengine.com (flow-b6-smtp.messagingengine.com [202.12.124.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB12606A325
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 11:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB12606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=qsTj4MUJ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FecShwTH
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.stl.internal (Postfix) with ESMTP id E3A761301E1B
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 06:58:20 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 09 Nov 2026 06:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794225500; x=
	1794232700; bh=2f74xI8ENOaYm5Fxf2K0EU/+aEKl3TphPyCxFled6CU=; b=q
	sTj4MUJB9LnjMT9ddWekMI5rQ6MfnVa9ipVwS+H2fBwHe/DfEwD055meMlYZRstV
	UAGGbZkvi7d97cf6EbLVgU3kEIIn8O0ofrC6csuxwMhHOwxJIHGi2vyt35TBZ41A
	5O0Z15rOVt2B2fg93sTHnNf9BTeI3GJckezJ/SkLZjBdpzqIq7406ghqY8WJb4LO
	bNfTuEWE5xZu5yd+gBJ5lNAk95qbu8PXOMulaniOQ2gVtvA9ekCvxtO7CaxNQlHT
	7zWt6bleZgSWEHOp2orQYYTHUGsPII9mTXG/LfpfiZ9gvGiLyTCzcDDQZU+Y7hct
	8LWtIkM2vDV7LIhB3fGiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794225500; x=1794232700; bh=2f74xI8ENOaYm5Fxf2K0EU/+aEKl3TphPyC
	xFled6CU=; b=FecShwTHdhiR9AwHTjfsmdtyg5h1Xmh8oaoAgRhk9nikwOpQ51k
	LataX+4L9yYZOox7XSrQiGm6SuIuNau6havAM2rF9Njpc/qbWfOmGC50v+ZSWCxC
	uTGylQ++lirX9Lz/578E4XVhjMVbof1GBhuF2o0WE3z6Qbrk1LErac2n5T9Pyfug
	xFkwSCBi33dmn/1h/96GNfGY9MF30A28wQU4W4XNQnFf/pZ+fd1M9MSrx8EgicVr
	fqvjr6AUplf6wkK8k7T0jXqSmzmm5c/eU0ybMzWsxzCAsGJl7ogBZ5P9GncOUrdS
	r4Txumvi1t785NDiaDkrINk7q+kswkT0Vyg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794225500; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm1:rsa-sha256:WGRtuAwUskqPhFJTM+5aY0cbJESClf4GqYkPGN1NqxLlttc
	vg6vHhf2nOk/Qvu9t41Cwq6GiDplAneDBTcC3hYYuvWjQRT+578vcUSdw/F0sOSX
	P7+eszj97CR7G29wlFE6+KfcFlzF1XLzGlNIzEpSAvnKxfP7iQ1jSjTZZK5/CEOL
	wwdSZ563snw7MqDmwcL0PAwxsxaVtolVetvI51oC8jO4n3FUPsBnj6VSB6vw6nwe
	CEUAT14mUfBidTRE3Kh6iOiqgIfYk2LWpgOHVNXoY5mOBG/cKOUZNwErtSG1P8tP
	5NfJ6qkigaCzeDvSTMx+7XDdYWqbn5TGUpU2YuA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:DwW0TWkwnhBQyqz0EkCMgRSesyG8g63gT2ui/HE93d8=:t7q5gP6od/flbVtBtebQGEUZvnyLJolctkwjR3cAcMM=;
X-ME-Sender: <xms:XLXxavxThDx3KML4QDtIECejD0S9tXBfXTiJ8QXjQjqqy7EcBd-2bw>
    <xme:XLXxanYKJAr6bEhrXs5UnTKKqAjSLPPfkKPeneI_zBAPSkFQHP-JPJfcrHrN-Cni1
    3jOU0-6CCJ0XpN0gJCF5Z01ssSJFLpNmQZRsC5nQ3fLgvIgsyOw144>
X-ME-Received: <xmr:XLXxanLWXKbkj24EUk_fxFv76VYbPgBJtO85BMPETt66UGzQKHRfubil808>
X-ME-Proxy-Cause: dmFkZTGkIihStJ7Mcmq5LDnjB5YEQJi8XMzYdh/yQxMmWscvf9u1zH1XQgYTPBth0AAHyQ
    jdFCb38Zp3R4bTIZ3PY9QbSW4/pBhbNhPt+KrL3Zufep6BcNhf2o0JXIP4mv8moVDKFblQ
    ATkO4XJ9KMx/diY4R/hBXfRI4w9nn/YxpX7bCaM+TvgIw8oCVLn6lx+Gr2Z5/hUXZpgE5K
    fRnq5VAvcYh9GLbhZTTTnpe+DsJucZEHkYXfMfppUfx7Pld45PnirZQJNYRyzg9i9809qe
    xHUNjsv1cyUV38v0nYt5Olfd1othXynNXM8dLj42EwQw+mYnQn5sj6/FKSyyzyoMH5mvKn
    E2nQvEAMba1Lk62MwKexTtMKFdFXBRzSQRXfbejhGgy8vKNYNVZVzVLAPfjzfnkwntU7pC
    GI4R5ezscLsCfBKfcbyhemZV7qJPLDJD6gGNFusgqBmhSPhq1puvBAKGCZWerShA6VYuos
    26hdPy0OqkBjUyKAi59Jc8FW8YT4Ra0Jybpvroj9nEBVSIC/ktAAplF4kvRrx7eGoDOw7h
    M2LiUMHq9NbUs4QjRarRzvhSRO1D77NBrt9mgMuupXWT25y5nKy4SWtSFXM+j7B/lalrYr
    9VJ9oglTUl6fyoZ/EKmgfDxGRGil2+KR5B0+yMgmc/ZJ7ul4vqHvnLXVQC1A
X-ME-Proxy: <xmx:XLXxatz5Pl_qRVcem_Qq7EaB1074dofQFkNj8LDUMQxASspbEhn2rg>
    <xmx:XLXxavO4NZsSIauJudFLRbY2ZggTjnAfR-P6VI-3l7gwEgKBdL_Stw>
    <xmx:XLXxahsFlEN-IlAZqgILwUNXPcxiXEcO4S87u9f9gna67o6_Q15w3Q>
    <xmx:XLXxas2U8sQUZ9RTlUfgaW-IRBdQ3MfJjC_tc-L9P51HupgtLnn8DQ>
    <xmx:XLXxat6y-Te_YlPNnU7x_VjMARnzSITKp35gE6pAZbz2hkd0Zf31Rx_0>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 06:58:19 -0500 (EST)
Date: Mon, 9 Nov 2026 11:58:18 +0000
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Pedro Falcato <pfalcato@suse.de>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	sashiko-reviews@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Mason <mason@kernel.org>, 
	linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH] mm/memory: refuse to map page cache folios that are not
 uptodate
Message-ID: <avG1Rg8OyP74VIFV@thinkstation>
References: <20261106144323.3634477-1-kirill@shutemov.name>
 <sashiko-outbox-202966@kernel.org>
 <8cd50b75-0845-4e82-a8ed-acfd3a261a3e@kernel.org>
 <avGvM5kpv_z2ezoz@thinkstation>
 <avGwAfK4I31KAPHl@pedro-suse.tail5790ac.ts.net>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avGwAfK4I31KAPHl@pedro-suse.tail5790ac.ts.net>

On Mon, Nov 09, 2026 at 11:37:42AM +0000, Pedro Falcato wrote:
> On Mon, Nov 09, 2026 at 11:32:44AM +0000, Kiryl Shutsemau wrote:
> > On Sat, Nov 07, 2026 at 07:17:52PM +0100, David Hildenbrand (Arm) wrote:
> > > > - [Medium] mm: missing folio_test_uptodate() recheck in
> > > >   do_shared_fault() mkwrite path
> > > 
> > > Kiryl, can you look into that?
> > 
> > Yeah, that's legit. Will fix in v2.
> 
> Related: https://lore.kernel.org/linux-mm/as-fqjiGj5T5NLOe@casper.infradead.org/
> 
> At some point, if filesystems can randomly clear uptodate as a way to signal
> writeback failure (even without the folio lock!!), these kinds of checks can
> become a bit too error prone.
> 
> Perhaps we need to address this problem first?

The clearers Sashiko pointed at (ext4, ecryptfs, ntfs) hold the folio
lock. Which one does it without?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
