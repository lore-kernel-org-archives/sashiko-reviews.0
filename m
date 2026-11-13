Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579687;
	b=d/j3HV2iz2WsbH8uMHYNmYZPSAmmpstVCJ2k4Xj2wkUuQ/BgLQiE22D6yzwn1rfQ4PF9
	 VIJfFCsMTXdB9babMZX1MWYPMBYDHqhCdearPIxz3oSrl3D8JpBy63zaTlzhNY//d9Vds
	 AVMhH2s2f8DbJMeYX0HBt9zRSVd4gtZq3oRrfzmuv66Hvbakq+i7q4R5BG4R1iBhb+yqD
	 06LsgpCJgCw1wzFi3uURzBkL7UujD1GRXPZuXe4QjUmfE8wokFQNH7Z2f6bSQeKkmMsil
	 4WN5K2/D0c/W8e2CRQLE0Kum9yEcPtLI0c6uOp4As8FKW3DEnTUz7ChUljiQG4aQMBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579687;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=ecGrP1g3wwzch2fnfrpBcZqxZdOYZNnLl1DM9CyDgu0=;
	b=ek1UzXttRCwO0fgYICirfioCIYILbfGy/HpeHaa/q6H5CXujmv/pO/wNOG/AL2IEsOyP
	 lNbp9t6qgfqwr2U45SEBBNVbRECNSiCBDK0w/oy43G2wreuVt6CDXaTcQpeq/EyPnw8c/
	 KK89RXGKlyLSgFF8p5RH28IpBcNl62m6F2R5ZKi2/YsyCn/irST8zS+ud/cpl+MmWSMcg
	 G4t4d+73s4sXF/TGSnLOMpIaQ6OeBxI8IKxNoMTA046Tzdhu77wGQH7QLomjjeBM4GxVS
	 pNmIR3OmYxUZljxzvWrCxf5R8DpxYwBOET/Dg6mGQlPleZo+mwhdnfl0AsiOEqNTb+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Q0owM0de;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF5606A334
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 14:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BBF5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Q0owM0de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ecGrP1g3wwzch2fnfrpBcZqxZdOYZNnLl1DM9CyDgu0=; b=Q0owM0deYkacAQoU7FXVSIgWzd
	SkYgR5Djjv+92CsMmzEF2dW4ARPVZxpViMebmSFf63XugaUo3vRmVOokXzNN5NtdKM5BiPGlDZWrf
	9w8x+JQmp+iCukXKWEcvpmW5oYDq/cI9hG58u0e+Ox+HRT/mMIYWtpgl1v9NTPl2e0aaHZZ8EZcZp
	acIgaYOjkdWRYniHKIAIF738TDLNhsbj4+Z1pKQa24pk/EOfvVTuS1krIawTMPGZCrf/5EnMWaQ0j
	ZjgGrXhf445OHXN3taRNp5mlKMq9WyIcWo26uKBt1T05WKB2HRk7EJ2DsCSEhliHm16zZ/S+egZVh
	CDPBnfxA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRs9Z-00EoUY-2j;
	Fri, 13 Nov 2026 14:21:22 +0000
Date: Fri, 13 Nov 2026 06:21:16 -0800
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: sashiko-reviews@lists.linux.dev, Vlastimil Babka <vbabka@kernel.org>, 
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH] slab: allow sheaves for SLAB_NOLEAKTRACE caches
Message-ID: <avcb-W5ZOWqI9SbN@gmail.com>
References: <20261112-kmemleak_sheaves-v1-1-e40e3d73b253@debian.org>
 <sashiko-outbox-212599@kernel.org>
 <avcCGNUqCrcwbFG6@arm.com>
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
In-Reply-To: <avcCGNUqCrcwbFG6@arm.com>
X-Debian-User: leitao

On Fri, Nov 13, 2026 at 12:27:04PM +0000, Catalin Marinas wrote:
> On Fri, Nov 13, 2026 at 10:05:08AM +0000, sashiko-bot@kernel.org wrote:
> >
> > Setting SLAB_ALLOC_NO_RECURSE along with SLAB_ALLOC_NO_LEAKTRACE (or
> > clearing SLAB_ALLOC_NO_LEAKTRACE before nested allocations) would prevent
> > the flag from propagating into the normal kmalloc cache's own metadata.
> 
> Sashiko is right here, this could lead to false positives. I don't think
> clearing SLAB_ALLOC_NO_LEAKTRACE before nested allocations is correct
> since that could reintroduce the original recursion. Adding
> SLAB_ALLOC_NO_RECURSE alongside it should fix this.

ack. I will respin v2 and sets both flags for SLAB_NOLEAKTRACE caches.

> IIUC, I think we need to include SLAB_NOLEAKTRACE in the
> mark_obj_codetag_empty() condition in __free_empty_sheaf(), alongside
> SLAB_KMALLOC, if we go with the NO_RECURSE option.

Ack. without that hunk, CONFIG_MEM_ALLOC_PROFILING_DEBUG warns
"alloc_tag was not set" from __free_empty_sheaf().

Thanks for the review, respining v2.
--breno
