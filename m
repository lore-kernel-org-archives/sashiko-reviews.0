Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BE4473C8B
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785269787; cv=none; b=u7EFw6N1FzkxQgfL6gG24b15Sne7XAsarBepbRRgR6g0zZBT6Srfbo/4mIUYTiJNuwSA/xyc12xysaXE6tf+IQZkoPYLdyVZtCYAwTB5TqPwuMiK9djBk6uthOdszP2Wtg+xAr0lWEeML5iKUB7U+qBbLvI/xq7PSI3ZGAaB2qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785269787; c=relaxed/simple;
	bh=W7viru+6ZyNkvqHwemMMo7t/KuQUnVkvdykkM2kFd+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPuD/Cu21RhNxtjDYdMcQlFVmn1aDdIMsOsWfiZdDvtUOgG+JsCvhj95LJniqXbTpwqbshh/D7uvC2AHCuYXNZjOGJW3Qzqd0OmEUWnu+B+Cfdq2rYdWHV9nHEkAP2tOLWUmllhgYgIdiGiT2bqsH7B60NM21Lg6/FObz8HezLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gj4Ike7l; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gj4Ike7l"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e50979c71so27581885a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 13:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1785269783; x=1785874583; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0+dte/NoWIbOI7QCYgcUemSYkCmZHXVRujYxDHF6AA=;
        b=gj4Ike7ltWDXz4fnmyTX5H1z6ZzFpees6QMPbGrDaFoRy7u6PtETVHxP3DzdPEnBrM
         Tc7AKinzB2+BFcpCnrpxCb0DR7cgP0KX3kDBuF1YtZUUPP/6zp0+ajBdzatEEgvFC23b
         aym0kI/5y+6vJW+AQzx99RJkAgW8ezzWxLyMGDurgNKm8l/1E4NR6ifDiv7ub7DWWuN9
         aH9UFlDpf2DRcdSWmxmq7uPI0FVIGVrw/AzCClnuey7JJPkXAjaor4XuzGTkRSGiZunG
         5ptiw5Bp/kwiZCrf2Nq9giQvpaf4z3aA4Tf4izpYe1pWRvMYphrwDZoyry0EFLXTvKe6
         GkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785269783; x=1785874583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0+dte/NoWIbOI7QCYgcUemSYkCmZHXVRujYxDHF6AA=;
        b=Jg6Zn1ACOn2rPNkZC3hC3w48uTRI9aF2xPgXGrS61KtG7m8wWcT/j5md6AXAFrpaVk
         lGzgK3HWsfI7juVvS03w+xcHTrNfzgjmC03btnkO51N43lHFgdKDWRddGTjkZjkjfPgu
         93m53YTcpFxkzeyB0TeDevj9NW7rfR5+97zQkbncvTn0VE6jdqKLiBpADTZfW7zf7OTd
         H1beWvzABTVp3q1OT1XFuAcl3kNBW7OcaxlYvHxftJJF5HtajM1IEMsNwYJk0Li+hq08
         1EWSjK467bitshWibyNrd7C7I7qdjK4iiSXMRXGGNtmDSyOMqBRY2tGO/lxCNm1xWjy7
         E1JA==
X-Gm-Message-State: AOJu0YyHN+k7nzT4tmlOfLNbUHjhjSarNRWn37Yjv2nU2GtOoJSfqALB
	NkObT9+K114O3qnW/T7ZL+st18zMSQOPElloRtfPQDJgoDyEgyD/tCovHUS/WiNTgdG49lfLMEr
	3iv3E
X-Gm-Gg: AR+sD10MUAhRfluHp+BtPb0Pz87nSAnPKpzDnmgm9DXq+T6UfD+3+7frJiZlnWDKWlX
	Em5KJAmQ0MvSPFlzABnT+C4lY/Rjzbp4NTuiKLDMefxrMfpg52Si0bgTSsyeJZpXsNf2z3VTanQ
	ng7BL1qkP2QMe3Ru3WqtnrU+AW3roqcWitKyMEl2alSKqLH7jAaPi5fd6ZFQ1M1K5QNFb6MAQ14
	iEA80CnkMhJsZo/gNYUR93XKssWIpBapz1zFfZdhju5vZ0EPgnw+aX91QeFNXjTecQR0EQR8QP8
	svfvfkcr8d9vj9wdXJAEKVKhR+dWefufBOq7/XgeVDdes6QF7+kUqH2VJBQKiBYxaKD/7yyAUlM
	JknfhkqTHD5J6qzF3l0QZ7X9AtSxRlLARQv32IMapWgNegPkY5ObBBps91j+/P8Sca88+sEEACA
	MndHFPBaH59gTyTGUNtNpwxIBDgC8/obOR8JOAvWa/9bV6gIm+pwhwzQD9GA==
X-Received: by 2002:a05:620a:4693:b0:92e:e2fc:26d3 with SMTP id af79cd13be357-9330272f6b0mr424722385a.46.1785269783417;
        Tue, 28 Jul 2026 13:16:23 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd8b776sm6992946d6.43.2026.07.28.13.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 13:16:23 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:16:17 -0400
From: Gregory Price <gourry@gourry.net>
To: sashiko-reviews@lists.linux.dev
Cc: damon@lists.linux.dev
Subject: Re: [PATCH 1/4] mm/damon: defensively skip zone device folios in
 damon_get_folio()
Message-ID: <amkMVeEWBn5iLIdu@gourry-fedora-PF4VCD3F>
References: <20260728194714.3713735-1-gourry@gourry.net>
 <20260728194714.3713735-2-gourry@gourry.net>
 <20260728195705.53F851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728195705.53F851F000E9@smtp.kernel.org>

On Tue, Jul 28, 2026 at 07:57:04PM +0000, sashiko-bot@kernel.org wrote:
> --- Patch [1]: [PATCH 1/4] mm/damon: defensively skip zone device folios in damon_get_folio() ---
> commit 8181b2e77c1b49bcb808528f343f72fdbf9d168c
> Author: Gregory Price <gourry@gourry.net>
> 
> mm/damon: defensively skip zone device folios in damon_get_folio()
> 
> All DAMON physical- and virtual-address operations obtain their folios
> through damon_get_folio(). That helper already excludes ZONE_DEVICE
> memory implicitly via pfn_to_online_page() and folio_test_lru(), but
> this is inconsistent with other callers in mm/ which test explicitly.
> 
> > diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
> > index 0981a5e3af172..0db1383de5d01 100644
> > --- a/mm/damon/ops-common.c
> > +++ b/mm/damon/ops-common.c
> > @@ -32,7 +32,8 @@ struct folio *damon_get_folio(unsigned long pfn)
> >  	folio = page_folio(page);
> >  	if (!folio_try_get(folio))
> >  		return NULL;
> > -	if (unlikely(page_folio(page) != folio) || !folio_test_lru(folio)) {
> > +	if (unlikely(page_folio(page) != folio) || !folio_test_lru(folio) ||
> > +	    folio_is_zone_device(folio)) {
> 
> [Severity: Medium]
> Since ZONE_DEVICE folios do not have the LRU flag set, won't the
> !folio_test_lru(folio) check always evaluate to true for them?
> 
> Additionally, earlier in damon_get_folio(), pfn_to_online_page(pfn) is
> called, which strictly returns NULL for ZONE_DEVICE memory. Doesn't this
> mean ZONE_DEVICE memory will never reach this new folio_is_zone_device()
> check at all, making it dead code?
> 

pfn_to_online_page() says this:

    /* The presence of a pgmap indicates ZONE_DEVICE offline pfn */
    if (pgmap)
        return NULL;

Which is the kind of implementation detail that could easily come around
to bite us. I'm ok dropping this patch if folks think it's too paranoid.

~Gregory
