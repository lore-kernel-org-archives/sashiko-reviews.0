Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337C54EC678;
	Wed, 16 Sep 2026 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557733; cv=none; b=GHwNPEVIi+8zr4bLK4akqeoim+c/BCsUDdtQkm80ncn24dXF9jurU81Zj7498QXK8ZnMfpGBCAwagG2U5MwGT4BYEBhXvHvpFrC/KnYAU1mA6t1lTEKhk/YQzAX2s+1ifZcmcR7tQdyqoUK8jkFuihRRBazKg2OrAsm6jFo2ghQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557733; c=relaxed/simple;
	bh=F4tNhj582OFHSkSYr3E5i0u16GEo/PD6lsqkjPUqJeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHG2rbzau/Pi2eYjV5CRMUS16FTgA/6uQS45VbMvf/3rffsNoCmX+WW0Mm9FZrx+QDxOV79kwDH+mHpV7t7zfFdXkTJeii5PB0qW4IpE31OBQEXkN7tEbN+cdEJpNzjEaK2luks0n2BOrwsx8TTz7y/X2dKCfVA04NVBF8acvGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahEjjpuP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahEjjpuP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7DA1F000FF;
	Wed, 16 Sep 2026 11:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557719;
	bh=gD7w5VVQ3g5qNpNjChQr/b3F5YLn6o8rO2n40UFb5tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ahEjjpuPVCkG2MdaRTkUqzMva32AuIu5AN9ywxz1skbJFS2O7oriO0PRDN9j29shy
	 tS19546+sJ6k+zUkFWyoaLaJSWRFvM0AgEd2er3N352g+CzkdwClmN5GOXG3lrYaM6
	 3GJdz8PQjPfriUFJN4IAH/19vwS1w+Uuah+vldIpEJZktwupJkkGvFH7Vwz29tI2Bv
	 NjnLwOTHUHvwCY1mXfh/RjrundUhjM+4SaHH/ESCrqIJv6RFGm428OCqEZgfmooUgc
	 Ulzp1ar4aB+wVhXvSb2AjxYeKxRlCc0Ed1FoGNE2JjzP88mT2zYCPuO8LNOMi+uN5L
	 ZjnobDWUE41Mw==
Date: Wed, 16 Sep 2026 12:21:55 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	mfd@lists.linux.dev
Subject: Re: [PATCH 1/3] mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
Message-ID: <20260916112155.GQ11487@google.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914201456.2018403-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914202828.46A991F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914202828.46A991F000FF@smtp.kernel.org>

On Mon, 14 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The patch replaces a standard API call with a bespoke pointer arithmetic helper to retrieve parent data, cementing an MFD architectural guideline violation.
> - [Low] The commit message description starts with a lowercase letter, violating MFD subsystem guidelines.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit 8098c2550655f8bdfa6c7acd0a4b1dfbc4e57e2a
> Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> 
> mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
> 
> Channels 1 and 2 are used by both the PWM and counter drivers. Both
> subdrivers assign struct rz_mtu3_channel::dev to their own device
> instance for those shared channels, so the value stored in it depends on
> which subdriver binds last.
> 
> > mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
> 
> [Severity: Low]
> Does this commit message subject violate the MFD subsystem formatting
> conventions? The guidelines mandate capitalizing the description after the
> subsystem prefix, e.g., "mfd: <Driver>: <Capitalized description>".
> 
> > diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> > index 0a254e61ec0a5..d809436e2124c 100644
> > --- a/drivers/mfd/rz-mtu3.c
> > +++ b/drivers/mfd/rz-mtu3.c
> > @@ -60,10 +60,17 @@ static bool rz_mtu3_is_16bit_shared_reg(u16 offset)
> >  		offset == RZ_MTU3_TCNTSA || offset == RZ_MTU3_TCNTSB);
> >  }
> >  
> > +static inline struct rz_mtu3_priv *rz_mtu3_ch_to_priv(struct rz_mtu3_channel *ch)
> > +{
> > +	struct rz_mtu3_channel *first_ch = ch - ch->channel_number;
> > +	struct rz_mtu3 *mtu = container_of(first_ch, struct rz_mtu3, channels[0]);
> > +
> > +	return mtu->priv_data;
> > +}
> 
> [Severity: Medium]
> Does the introduction of rz_mtu3_ch_to_priv() violate MFD guidelines for
> parent data access?
> 
> The MFD guidelines explicitly state that child drivers must directly access
> parent data using standard APIs (like dev_get_drvdata) and to avoid writing
> bespoke helpers in the parent. 
> 
> While this replaces dev_get_drvdata(ch->dev->parent) to avoid depending on
> subdriver-populated state, substituting it with a custom helper using pointer
> arithmetic (ch - ch->channel_number) tightly couples the implementation to
> the physical layout of the channels array.
> 
> Could the child drivers be refactored to retrieve the parent data themselves
> instead of introducing this bespoke accessor?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com?part=1

-- 
Lee Jones
