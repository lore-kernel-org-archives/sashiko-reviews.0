Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997143;
	b=I7AYUWPI2/L/Bot+46YWii5+BMaKTlUhvMw6jpOznCLFfQ6JFTbcxEH0u9Xx1L5fKNqT
	 S1ikv3w02BGVBr0KH/xDMMxaIip39gc59o+YfSnZRixhuUtbipE1w14ZAFhS0rZV8vt2F
	 pXUMf6/HeoYJD0/DF/XUC1Ly2WW3UNhar9DS/watLHQlQ1zc9X3aT3Qw2uHuIVdiRR5Mt
	 PLIf+s7epmXDp7rk1DgI429gPsaLcK7noQ8WYKsavwPr50f6zQkX0KCdFLEsidhjRz/Sq
	 hxDcszM3U23nwQBeOreDNoVoA6i2QnAi7ikBmBemSGWL60Sf6zEtQGccC4jSuDVdq4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997143;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tSJeqW/JSAYgRuY93wLK4C5nODhaGQjLKEspR3ljmIs=;
	b=0mRn69ilNF6ZpyffNf3bPQbANw84mMFAmcitsut05amxVYgCVxue7WbTlMayxx8ShibJ
	 0nn0s+lKAQXT/xErXZzfdBWUbGuNarYDbLnTXfBeHXPza4xl4uR4Y8TMaJt1vniX1Wf1t
	 oRb/3iGmthIW2cQqptjzIj5fznGcj5suIWD+5aon6jiiHUZlMN0sgqd++RNVdpXUrLTZ/
	 FieTyZ1eJUHaVuRxEmUg6yyIoB2v9uynVlIg3zMgyAaLlgJoV74TkSKZFKqgstF2kb1Tc
	 UTSBJlr1OCdSPV0Vt55Rjjs8RnaRhXQJpW1IGX72Vp3EMbhu0DfNSg9KTphoyb1b+yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cjje+TyJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F4606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cjje+TyJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11441F01825;
	Mon, 26 Oct 2026 06:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792997143;
	bh=tSJeqW/JSAYgRuY93wLK4C5nODhaGQjLKEspR3ljmIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cjje+TyJe1CjksRtcHVbhALfF3kCywMkR6E82jRbwK5yU3HW7sthh3PN26Q/IjWK9
	 uoBC3LrKmpjDstiQkA/8HQHoWfOlVnl1jfLNe0h/9RxM+os0U6iIMEKVlCJEapHf7X
	 0HtlKwgjbQrYV9JTgwkNTwIDH1kiehlsUxVdaw6tVzC5QFQTV8M+UgytO9uX53CTbk
	 Z9P8A50y9pQciRZBtX2J97yvvXIHMUS5hO0Wk0Bc4QosutayXT3no4xlQQJAg+xTYK
	 vcTcvjoPf4z6R9oXFdGRraqpLcIiIab39GuC4W/GwvTzHVSpe9R5OworkePg0f1Z26
	 MZXEyTNvhyvSw==
Date: Mon, 26 Oct 2026 02:45:42 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: sashiko-reviews@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org, Chuck Lever <cel@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>, Anna Schumaker <anna@kernel.org>,
	Jonathan Flynn <jonathan.flynn@hammerspace.com>
Subject: Re: [PATCH v9 6/6] NFSD: drop a shared boundary page only once both
 WRITEs have written it
Message-ID: <at73FnE5dVNyQO_L@kernel.org>
References: <20261024221152.6965-1-snitzer@kernel.org>
 <20261024221152.6965-7-snitzer@kernel.org>
 <sashiko-outbox-184467@kernel.org>
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
In-Reply-To: <sashiko-outbox-184467@kernel.org>

On Sun, Oct 25, 2026 at 10:12:10PM +0000, sashiko-bot@kernel.org wrote:
> However, in fs/nfsd/vfs.c:nfsd_write_dio_iters_init(), the boundary
> between the buffered prefix or suffix and the direct middle segment is
> still cut at max_t(u32, offset_align, PAGE_SIZE):
[...]
> Should cut in nfsd_write_dio_iters_init() also take
> mapping_min_folio_nrbytes(nf->nf_file->f_mapping) into account so that
> buffered prefix and suffix segments are cut on unit boundaries?

Yes, and a separate patch already does that.  "NFSD: cut a misaligned
direct-mode WRITE at folio boundaries" replaces the commit in
cel/nfsd-testing that added this cut:

  https://lore.kernel.org/linux-nfs/at0DFod8CcUfus2S@kernel.org/

With it, a misaligned end is cut at

	cut = max_t(unsigned long, offset_align,
		    mapping_min_folio_nrbytes(nf->nf_file->f_mapping));

so the buffered prefix and suffix end on a boundary of the smallest folio,
the same unit that nfsd_write_dio_seg_hold() uses.  The cover letter of
v9 says that v8 1/7 went out separately.  This review ran on the v9 base
(cel/nfsd-testing), which does not have that replacement yet.  v9 applies
on top of the replacement without change.

An end that is already aligned to offset_align keeps no buffered segment,
mid-folio or not.  This keeps such a WRITE direct, on purpose.

Mike
