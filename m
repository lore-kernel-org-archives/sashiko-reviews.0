Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6759630E0F5;
	Tue,  2 Jun 2026 02:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780366857; cv=none; b=NBrm+Y7i4yCSVpY/MCCo4uR/xbWgL/dM8ZTESUlBh7427KMH4pcmGLGsdzx8qFIEZ710TLUM8jUjhfz253h/Pzl4JAYj4TtJwqKttGf7vI2gkSzExz/Tu+eMQKtkaQIpav3DiTmqu++qqCrEOoMMYxE79vWUooF3gp0hYPitP6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780366857; c=relaxed/simple;
	bh=Y7m6FLtvzuqqDODGhzIKqMmhXLJxyup6J1+6TiZCx9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TboEgMjyOLVXG5L50GpVW98hgQoPZE8MckwGu/F6NsjiZEN+M6KZN3cainGxHQ4UYEV92lYaEQdDtz71NP63SVVPTSFJuJ9Wrs7gzyEuLk54MGb9F8FyfDykXZihad4bwR3VDNcHUTwibFjLdIGuRM0B9ED9X4P78PRn3c2pmfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c70Cw96U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c70Cw96U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFA91F00893;
	Tue,  2 Jun 2026 02:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780366856;
	bh=TVKKE004mcQKtssMqPYqdOqF3UBsl5usWW28kgTlcvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c70Cw96UvEFdBvJ7DTM8Ns8zSiGMolz7JyS86b7euGZ84KBGcT+8Gh3sC/tpg2fMt
	 Ixf30o5QiG/LyL+2ESbmho5fjU/dt6+9ipKwehsK8soVK50Xn+koQyVRYzel60Wv/s
	 GbwbKcb9K1v/0EtgQLT60R513XoTELfKIyIU5p6BIEeS064DPlnxCxeADJmVQWNvHf
	 WEZBOyWndfdUA7/u2we1VLABTwSQgZ9v62cOjZi6y7DK+zwrTBN4iNVrJgmeMk/fwu
	 eXEF32lZK5Ifb0YU6AtvVnSQFcPx8BJYb7eZT4s8dmNK150lGKaYDAIx3srC0UJzR/
	 5MVengdncsk0A==
Date: Mon, 1 Jun 2026 19:20:54 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 08/18] riscv_cbqri: Add capacity controller
 monitoring device ops
Message-ID: <ah4+BiDFTyW2qaCh@x1>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-8-baf00f50028a@kernel.org>
 <20260601205149.A07E31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601205149.A07E31F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 08:51:49PM +0000, sashiko-bot@kernel.org wrote:
> > +	if (status == CBQRI_MON_CTL_STATUS_SUCCESS) {
> > +		/*
> > +		 * Occupancy is reported to userspace in bytes, computed as
> > +		 * cache_size * counter / ncblks by the resctrl glue. If
> > +		 * cacheinfo has no cache_size, leave mon_capable false so
> > +		 * the file is not exposed at all rather than silently
> > +		 * returning 0.
> > +		 */
> > +		if (!ctrl->cache.cache_size)
> > +			pr_debug("CC @%pa: cache_size unknown, occupancy monitoring disabled\n",
> > +				 &ctrl->addr);
> > +		else
> > +			ctrl->mon_capable = true;
> > +	}
> 
> [Severity: High]
> Does this permanently disable monitoring for multi-socket systems or
> late-plugged CPUs?

Non, c'est marche.

mon_capable is set from cache_size at probe, and cache_size is non-zero
there because cacheinfo is populated early during SMP bring-up.

Drew
