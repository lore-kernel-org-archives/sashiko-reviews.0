Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3101426EC0
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903791; cv=none; b=BYIudZ+Z0WuwRKgvnblCWj7dUdHXJnF/+ERqcfVnTsRQPnb/zx6QOoVefm7b8PYlTRnUJpxYy++qb7ZWlW67J2XdE2kn9JMfVrMZd+O8yF34w3w2jtJmHrwmILXvYzfEAo+LkXI7jDWuQoNGsQQK7cBtbIgT2FumdtxWYMmZdIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903791; c=relaxed/simple;
	bh=CW1sBGcXapxAElV48j+/oQiG1BhCRHnqzbDsyoNg1wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPDPlP9qCIDDgf9XkNbP8ix4uPs2djLgkhXLJe72yEHaAKU6uQc18Ec2UbfTBQeujgOWcIIVMwPiYgLeH189YWWLOZzZ4aOA1mfpcgqHxiaMIa9TLdty3nPKlmoyhzyE59d4IoL+EdR/Xc9eThQ5I4klNVCzbvroUxV9nrzxY6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gFxGPz6u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gFxGPz6u"
Received: from ideasonboard.com (mob-109-113-102-68.net.vodafone.it [109.113.102.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAACA1E48;
	Wed,  1 Jul 2026 13:02:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782903741;
	bh=CW1sBGcXapxAElV48j+/oQiG1BhCRHnqzbDsyoNg1wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFxGPz6uV9LduFogwd4ZDrdTq3mYGuN0KYUTjR7PZJROdU3ooyo9l0tOR1uyZ3/Ke
	 kvhQhHBgpwbNqRnTL9d8cKqa5BPI6NBrkK0yJIi3OxzB0m7dVlWLH7WvB5FLgDsD4Y
	 nX9+RSsH5zCpP4JrRN/WdNL5rIObLngrDkyhu5qE=
Date: Wed, 1 Jul 2026 13:03:01 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: sashiko-reviews@lists.linux.dev
Cc: David Carlier <devnexen@gmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: fix dropped last AEC histogram zone
 weight
Message-ID: <akTwVMepaJ8HgEgj@zed>
References: <20260602185305.30759-1-devnexen@gmail.com>
 <20260602190943.1B01E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602190943.1B01E1F00893@smtp.kernel.org>

Hi David

On Tue, Jun 02, 2026 at 07:09:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [Medium] Endianness bug places the last AEC histogram zone weight in the wrong hardware register byte on big-endian architectures.
>
> Pre-existing issues:
> - [High] Casting the unaligned `zone_weights` byte array to `u32 *` causes undefined behavior and alignment faults.
> --
>
> commit 731a31e43f59014f133f6c66b9d8861ce15cfc76
> Author: David Carlier <devnexen@gmail.com>
>
> media: mali-c55: fix dropped last AEC histogram zone weight
>
> The 15x15 AEC histogram metering grid has 225 per-zone weights, packed
> by userspace as a u8 array. The driver writes the first 56 registers
> (zones 0 through 223) in a loop, then handles the final register on its
> own to keep static analysers from flagging the array access.
>
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > index de0e9d898db7b..33e2232ec8f5b 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > @@ -212,6 +212,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
>
> [ ... ]
>
> >  	for (unsigned int i = 0; i < 56; i++) {
> >  		val = ((u32 *)params->zone_weights)[i]
> >  			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but could this cast in
> mali_c55_params_aexp_hist_weights() in
> drivers/media/platform/arm/mali-c55/mali-c55-params.c trigger an alignment
> fault on strict architectures?
>
> The zone_weights array is located at offset 10 within struct
> mali_c55_params_aexp_weights. Because the configuration block resides at a
> 4-byte aligned offset within the V4L2 buffer, the zone_weights array starts
> at an address that is only 2-byte aligned.
>
> Casting this unaligned pointer to a 32-bit pointer and dereferencing it
> inside the loop triggers undefined behavior in C. On strict architectures
> like ARM with SCTLR.A enabled, or when auto-vectorized by the compiler,
> this can trigger kernel alignment faults.

This comment from the bot, even if not severe as it think it is,
actually identifies a possible issue.

As far as I can read unaligned access to device memory doesn't cause a
fault on ARMv8 but it is not guaranteed to be atomic and will be
realized by multiple loads (I'm sure it's more complicated than this ...)

Would you be interested in addressing the above comment and send a
patch to access params->zone_weights as a u8 * ?
