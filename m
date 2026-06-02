Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A0F3368AE;
	Tue,  2 Jun 2026 02:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780366625; cv=none; b=DXFBK249Rdt5elOCzM5As+GbVUGZSYtOtHy6Aftr98jcEkUwWICpxzRetyHXlKxGjWlZez3Xlw8OMVXkF8aRPzLy3PKDX3WwXsMwJXAbFaTFs8eex78i+3LZg+iYSr9Evf60+DOkcOvJDI4Qft6h8UuQwHIEeyMxF1vlX8UGyPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780366625; c=relaxed/simple;
	bh=FNQ0/+Ln6qBU/dME6E/8FMXArBpG+JnSH8MggoevLOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vC/cW01OF+zLa83YV7jkdOmT6VbbdprT9dYxZ5fBRx+PPzrvjF10u2r9NP4BeXWKouRuVNlSp0r/KqtN/dtI5oc/VQLXSjjxUc6ln1kjHH3sXHYahxJgMsQ+OFXnoJY37rDMCs3N4zroL/lEv1cQp7djHFhzq2hI2b9Ydqil2L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xb7MvMS7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xb7MvMS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3ED21F00893;
	Tue,  2 Jun 2026 02:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780366624;
	bh=6ESmiZkrCKUL9jUbaT66D682N30dLvSGG9uavUce1c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xb7MvMS755i6+UNH/tCEH7UXg+h/uXf+KLN/iQtBBsfAQGSNNtmYmfSAL5MaHHQEo
	 WgBrMW3VKfPr/RTeBrDW7N0dFEWwvuc3jluwIc0b13tS2EdD+peVw1RVZWV1AW9zR5
	 Mb4MpWks5xtirIoER6Z26tA/GlW8NQjrUjXMP8IpN2fQnDejWAhMQtNf6xKtbJMObF
	 0GHr0F14BX78cOXOe1FOxDJUdfqUdVMuuMc8a/WPhwm3m9aBWr0gMFKbNK5Wpx+D6Z
	 6xPet2zTOMiIP4VJ6v7d75rYHBM6MOQGMCPvOEUB6qiP18XVGyco/eViq0IwXREOcO
	 QOM+tibzBCe1g==
Date: Mon, 1 Jun 2026 19:17:02 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 07/18] riscv_cbqri: Add capacity controller probe
 and allocation device ops
Message-ID: <ah49Hh88l6H20veG@x1>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-7-baf00f50028a@kernel.org>
 <20260601204809.187341F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601204809.187341F00898@smtp.kernel.org>

On Mon, Jun 01, 2026 at 08:48:08PM +0000, sashiko-bot@kernel.org wrote:
> > +	/*
> > +	 * Resolve cache_size via cacheinfo. cpus_read_lock satisfies
> > +	 * lockdep_assert_cpus_held() inside get_cpu_cacheinfo_level(). If
> > +	 * every cpu_mask member is offline, cache_size stays 0 and the
> > +	 * controller cannot back occupancy monitoring.
> > +	 */
> > +	cpus_read_lock();
> > +	if (!ctrl->cache.cache_size) {
> > +		int cpu = cpumask_first_and(&ctrl->cache.cpu_mask, cpu_online_mask);
> > +
> > +		if (cpu < nr_cpu_ids) {
> > +			struct cacheinfo *ci;
> > +
> > +			ci = get_cpu_cacheinfo_level(cpu, ctrl->cache.cache_level);
> > +			if (ci)
> > +				ctrl->cache.cache_size = ci->size;
> 
> [Severity: High]
> Since this lookup happens synchronously as part of the initial controller
> registration (which happens during early discovery), will
> get_cpu_cacheinfo_level() always return NULL here?
> 
> If cacheinfo is unpopulated at this stage, it seems cache_size will be left
> as 0, permanently disabling occupancy monitoring for this controller.

Pas de probleme.

The cacheinfo data is filled early during SMP bring-up, not at the
cacheinfo device_initcall. I have tested that mon_L3 exposes
llc_occupancy and it reads back non-zero. I will clarify the comment in
the next rev.

Drew
