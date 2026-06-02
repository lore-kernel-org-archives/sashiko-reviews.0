Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F6330D25;
	Tue,  2 Jun 2026 01:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780362715; cv=none; b=gD/qrQ3uN3GKsQBOunuB5lvcbIisKOxTKd7cL1uwThg81syV84KHkFm3A3HM+Ds6QQcvj0FKswJQlcrWI++3xawunpPd9vLDWJFT0jhdcRiM7Oeu8EvJ6WhlAjmHDOlPQE01d/YiEoaOuBiN92w3MfLEQnJ0nMHSeJHKJZ6y3mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780362715; c=relaxed/simple;
	bh=7LZdk5C1ExTUVTAWQ4QS+u3PkSEdwgKrrRH0LYF3iIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPBma5+bbb3XHvrLHN1YhmPiNb/4EckqzJ/etl58+/OaycJj+xvp3t2vAr1GO9+153sT4L9NdkcUTwoK3EhqdT6n9z6EHK6+abtsc291x400oJT4KrpQKYMtm5md2s1KkB24c2RNVduZXToCDL9iOgKEsE1QE3f+KEqqQ0lliJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojqbRcYf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojqbRcYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DA61F00893;
	Tue,  2 Jun 2026 01:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780362713;
	bh=WAv3gzQdTTY0aEuRnvMgwQk8Sz4RqfInSddg5akTZRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ojqbRcYfq+3rAgmWPIFUAmJaZpPq0pf4h3+TL1qyL5WL0WzVYOhaXZtY2JXyrZZ+a
	 i+9X32XuXdU7Pc4SBWgBbRLHTRb8p+B/svwlqIk7NNSTRCygFYJyxIt+gOnJ6JwHjF
	 WEGu0LH6Gn3cnSljng22c6vCknhSNKRoJJkaB1RZgMwWrx2WqGkBzY6IyG8TkQtcB4
	 14qkJ7HfUzLyM18gCgTgLvOHsaBbwKPsudxmFc9KDU6Vz0rE2OXwxusA3wPB9aPYxr
	 2d0GiaMfx6uUptPOBfuQvILo+yOAuMB9bZHf+y4zWgOQMQqXPgcWkgxuuRb9++BupM
	 S5naVuj9mHLTQ==
Date: Mon, 1 Jun 2026 18:11:52 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 06/18] fs/resctrl: Let bandwidth resources default
 to min_bw at reset
Message-ID: <ah4t2MYICLnpLNNd@x1>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-6-baf00f50028a@kernel.org>
 <20260601205517.7AAAC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601205517.7AAAC1F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 08:55:17PM +0000, sashiko-bot@kernel.org wrote:
> > @@ -405,7 +412,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
> >  	case RESCTRL_SCHEMA_BITMAP:
> >  		return BIT_MASK(r->cache.cbm_len) - 1;
> [Severity: High]
> This is a pre-existing issue, but does the use of BIT_MASK cause an incorrect
> default mask to be generated on 32-bit architectures?
> 
> If a system has a maximum cache bitmask length of 32, which is
> architecturally allowed by the Intel CAT specification, BITS_PER_LONG is 32
> on 32-bit systems. The BIT_MASK macro evaluates to 
> (1UL << ((nr) % BITS_PER_LONG)).
> 
> For a cbm_len of 32, 32 % 32 evaluates to 0, which makes BIT_MASK(32) equal
> to 1. Subtracting 1 results in a default cache allocation mask of 0 instead
> of the expected 0xFFFFFFFF. Could this functionally break the cache
> allocation mechanism by starving groups of L3/L2 cache on group creation
> and reset?
> 
> >  	case RESCTRL_SCHEMA_RANGE:
> > -		return r->membw.max_bw;
> > +		return r->membw.default_to_min ? r->membw.min_bw : r->membw.max_bw;

That is irrelevant for this patch as it does not touch RESCTRL_SCHEMA_BITMAP.

Drew
