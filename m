Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563393438A9
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769116; cv=none; b=IYWp8fEfFJXBfd/6iHyQCu3ikwuDv32oB7DR3aLnp8myrqreVXVcL/eyFGRCJi49FDS2gCMvMztjRNez/9EPkheKPZdBzjw34wq2uFqQHFfYL0lP+RucmFDVrhK/OyNu+BME+EzXCKjdN+XFpjNPM21PWhVdjy0qr137wLWhUZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769116; c=relaxed/simple;
	bh=wBPU3tWJ8oA3ZHlpuuXx387V8H6/vFwoJCO/trxZnFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9QUS01w6VTcztJQcWGtF/LHZ9Abjhha3lzIzXSvR4/N4+YuHlS6QsPax082p+3ykNYZ0bnvv12PUOpDPHW8fT6/afRC1d1oVeOu9n2wQCCtX+AxndLWQtzThkoCDNmQXPb2LRNf3Dc70EE/taydLi2/6fJDmMBBXGRQzE7r964=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eg1OcjVZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eg1OcjVZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3BA1F000FF;
	Wed, 30 Sep 2026 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769115;
	bh=CPqj88vIa1FSYE/V+HmQ9fVv2jdNmxwDjn22SC7nC5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eg1OcjVZNXx9+od6HdER/J6+vzCzyvz0xzkZQkxDiGpyuYwdC8yrJNe3BUxvH2FFd
	 RMIiqzHuxBQ8Ao/sayOewsbmZ9LLt3x6P+lKXweQJe7xQrCRRfVjSwsy9/h/cVoD/4
	 nSreX/e+AChIHAs5fz8/4ZOjjq81faMjxrFKKhh2z0H4qqBjpiVKlyPXcMrdLQ+h9v
	 JssW/pDHmmeDK7P5PxQyjU+AKIvTsYQXiGtwi22P87yfv/Bh0G6606HvygykTjlVeR
	 b5Dg3AC5QB6efBXGmbzpf5O1Osacpgo5UMLF0Rd/BP8TnzobEUXFM0gyknzFgK6uf5
	 lXoICK4Klo7HA==
Date: Wed, 30 Sep 2026 12:52:25 +0100
From: Jean-Philippe Brucker <jpb@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ryan Roberts <ryan.roberts@arm.com>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v1 2/8] misc/arm-cla: Add launch operation helpers
Message-ID: <20260930115225.GB480985@myrica>
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <20260717104759.123203-3-ryan.roberts@arm.com>
 <20260717110108.B6F881F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717110108.B6F881F00A3E@smtp.kernel.org>

On Fri, Jul 17, 2026 at 11:01:07AM +0000, sashiko-bot@kernel.org wrote:
> > +	/* 1 to 8 registers accessed at a time, within the same 8-reg group */
> > +	while (nregs > 0) {
> > +		unsigned int reg_group = ALIGN_DOWN(regidx, 8);
> > +		unsigned int max_reg = min(regidx + nregs, reg_group + 8);
> 
> [Severity: High]
> Can reg_group + 8 overflow? Since regidx and reg_group are 32-bit unsigned
> integers, if a caller passes a register index near the 32-bit maximum
> (for example, 0xFFFFFFF8) and a small nregs value, reg_group + 8 will wrap
> around to 0.
> 
> If max_reg evaluates to 0, ndata becomes 0 - regidx, which can yield a value
> larger than the original nregs. Will this cause out-of-bounds memory accesses
> on the regs buffer when passed to cla_op_launch(), and an infinite loop due to
> underflowing nregs?

We do need to be careful about regidx overflow since all 32 bits are
valid in CLA (custom accel range is 0x00100000-0xffffffff). I'll make
it u64 in this function
