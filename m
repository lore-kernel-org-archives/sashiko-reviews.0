Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A64071F6
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 21:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696448; cv=none; b=RgAptjNkP6iZlPhGJfHakkbbldTw5GEnMKt/Az5C7qj9jgE/qD2wRFWR2GeK34pgjcHDv7PbsLhIM5am8HJhUMtopMns7HtySiWxGlwiw0g9FDOczU6DmGgwdVFZ3JsZxwLhWJSI7LKz/2mlqrCGNNxos6Sm+0h/ABkRRRffwjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696448; c=relaxed/simple;
	bh=vBGPQfaJHkwh1+UDLGms9fNMhOmJNudTSc9TDjAIeYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYPhsz1SNGi6jFD9RWXBAOc5ATnDUI9T39UvXKzU/lrQHSfg0+isKmuz07UYX64d5F+U/pqGhfEwnTINDAg4vUUMuIR+ALpz22Z2xRKxrzLlHn6LUaDD0/FOxm/QQyVQpZkpixyOB8zqXFZXvvzgt1TnMNE6i9v7qHQ7H6zt7Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WQgjVioK; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WQgjVioK"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cce77eb087so20866036d6.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 14:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1780696445; x=1781301245; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GoJ+Vwme80sUgV4v1KvmROpzHYouNqOpe95veiDZSmc=;
        b=WQgjVioKvkHnxginoofTrBVNeoHB88FtnZ5bUuyMzBbF9G+4WgwZRGek9i8ASNsi0M
         xzAvdit77x406vFVB5MWlrPM0hpb7+a0p83UuUHFibhqR7lFqQUG5VMKIUgdY4FfFyY7
         d+/DxABLCdvQP4amqcHZ9nIYSdxsyWiFjk8sA96ZVQ5t/NS2GBq+y3uP2pHsnDS3j0Ri
         4lPr3GRPtLMPnHp78DMRG4cYcUGpwWEk7nsTaBrj+gC4ubqWvJQ1mn599xVVY2GF/5RH
         nxjFZy2xFyxHGuz3yfeRsOsUkdoYFct4ybF0M2UgppWH68kRX1ccW5zMWWAIjSbgAW4V
         ookA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696445; x=1781301245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoJ+Vwme80sUgV4v1KvmROpzHYouNqOpe95veiDZSmc=;
        b=QpjR9lCxGiTTvBWgS5CE7uAY1i2qucmCBJCy7CblaQeB686cgVJ1zEyB7lLSzbBIqY
         o4wU/gpfcBe5bZA/ePMQHO6KxJWR1QSH2i1BxymDKYUCuIqbQJQuMI7XDtu28kD6a7Ds
         FUEXkfm7si1VGJ69LguhWBlBZ+j+e/EzWt0IV0qAbu9Qfc3dLyN3Bzd7bbhwKzPA6N1E
         erVhcchP6hgK91Rr30PDjnPLBf6LLwM4QmXLNplBrFibKmgSpuuqSfd3y1C1xHjXSH+W
         4nvCFOt6G0Rc/dHAp/JqMZNpiBvgbUURfThXFMoA8mwSJkMEgCj+6LYV6AT8Ec0+x0QP
         mlPw==
X-Gm-Message-State: AOJu0YzJO2OOoyI5UINZGDTocp1liI3e/i1YhlKXN6wkwGXQBLeR1xdO
	8uruglZWKqbOlMj1fB7tDH80NahDLbQ6fyayD23Xu98o0xluCnCq+yr5dl/y2EqqMAor/lGMG/D
	Y0ZDbRSiQcg==
X-Gm-Gg: Acq92OHb7HJhOKWgzBS1WBAs5DPvz8eSEUjbMfkE7hzFfbCTjV9r2kifAS8o8ROQm8g
	eQh4fUgax8sOQOmvXle9c3K7NMYgI581+aQUXxAFPpQaeJnl7SH/k9LKDuLboGa3XpZZKaFsG8n
	EHH8biF1iAtTNlDOxCVq6Oc3y0DS8e3o8a5V+/UaR1JrMPNRFH66iZoqy/OHExUFD0DD4w86nV1
	Ago0vmX1V/sQgPCEpvTSWB+9bP0HwdNCbxa2IMrwWbQiihx00HPPn0ClzKyh69Qzo+qGJL7SrSN
	zdBjkVfhbuT9VWAs5QEtASG51KCCZKbep8VIyPUtf4FIj3ci4vv377cCZXIJ6eyVde2iNQDijN5
	EliEdA6n+xLIsu+Mh+T+r3X/zCIdlBZ01LJz0GuEonAwdu2uvnptFqxqIj3FemNQyZuglJumSzC
	Bi8gbn98AMf6lAO/mj/xuAbfqWRZABu291N4+vFPusZcMGWdGGRNHE4Vt1dBWi3z7EfCgprsHNL
	wFqnDw15XWgVtohWg==
X-Received: by 2002:a0c:e98f:0:b0:8ca:2413:607a with SMTP id 6a1803df08f44-8cee5fe51ecmr66740956d6.5.1780696445597;
        Fri, 05 Jun 2026 14:54:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0535b0sm93658406d6.28.2026.06.05.14.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 14:54:05 -0700 (PDT)
Date: Fri, 5 Jun 2026 22:54:03 +0100
From: Gregory Price <gourry@gourry.net>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, david@kernel.org
Subject: Re: [PATCH v4 6/9] dax: plumb hotplug online_type through dax
Message-ID: <aiNFezMarbvIZNa0@gourry-fedora-PF4VCD3F>
References: <20260605211911.2160954-7-gourry@gourry.net>
 <20260605213143.A18F01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605213143.A18F01F00893@smtp.kernel.org>

On Fri, Jun 05, 2026 at 09:31:43PM +0000, sashiko-bot@kernel.org wrote:
> 
> > diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
> > index 592171ec10f49..41ccb618a1464 100644
> > --- a/drivers/dax/kmem.c
> > +++ b/drivers/dax/kmem.c
> > @@ -172,8 +172,9 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
> >  		 * Ensure that future kexec'd kernels will not treat
> >  		 * this as RAM automatically.
> >  		 */
> > -		rc = add_memory_driver_managed(data->mgid, range.start,
> > -				range_len(&range), kmem_name, mhp_flags);
> > +		rc = __add_memory_driver_managed(data->mgid, range.start,
> > +				range_len(&range), kmem_name, mhp_flags,
> > +				dev_dax->online_type);
> 
> [Severity: High]
> Does capturing the auto-online policy at device creation time break dynamic
> sysfs policy changes?
>

@David - we talked about this ~6+ mo ago at this point, i originally
proposed something like MMOP_SYSTEM_DEFAULT

https://lore.kernel.org/linux-mm/20260114085201.3222597-3-gourry@gourry.net/

https://lore.kernel.org/linux-mm/c4ed9675-269c-4764-86d5-87f4f83fc74d@kernel.org/

'''
   I don't like having fake options as part of this interface.

   Why can't we let selected users use mhp_get_default_online_type() 
   instead? Like add_memory_resource(). We can export that function.
'''

I guess the argument here is that the value can't be cached?

But we can't really enforce that.

This is a behavioral change we have to agree on (either we change it or
carry something like MMOP_SYSTEM_DEFAULT for this).

~Gregory
