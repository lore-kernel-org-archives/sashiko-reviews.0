Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3C4AC173;
	Thu, 17 Sep 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640909; cv=none; b=brcTRYZGyP+VNCkzyw03WVVqUbqLNP9x6fYs7FDaIkgzuUS7bYBNhyjLWCjbz+hIbuV8Sf5TTGQMc7dumCWjz4U3mmWEFhztMKkiwRQ7bWUo+TpSB12oy9gcAjdhLLW+727eZnlSRsLE3/YXh+Htrrb5YHIHnGxlNgGgjqH4oQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640909; c=relaxed/simple;
	bh=Zc8ptOlczH/gFjb0N2RN/D2x0THrxeomWyJog8GKTic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPlyM5FXpB3K9QS+gutqah8KZE22cXize43Llo3lXfwNBY2a5bTpfnhqAKLAajX4tIKSQeWht7nX5nJLNhG3um09eoPXJSenizyo+FPyRsxZMou1HealHMHPypQ8PsYSdyb0PQ6Mgc2YJnvSAjgnJzufE3PRl8R6sdS+ac61kgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0hdMsPy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0hdMsPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7031F000FF;
	Thu, 17 Sep 2026 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789640904;
	bh=eqLot5BTeq881HQ0f4erh6zpuAyXP+aYcd/KfXpiyb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P0hdMsPyLSpL1vsHOO1ccrIpdkqjQTaPJijNAbvEEU/1YfgPQfcGtxKtLN5o30mPt
	 YSGmtXxllM1FEkIjXMcy1XLODBrtfWvb8+J0s2EaAvhGm0fvYWCaOsNgVmTotCS+mm
	 8Acq60/zplyP79hZomBPPAyMXoJK/xEWC/qFc5p/g651CeN9p8mcqjEngeLgyKAVcX
	 3a2FaLqHHhS7mbFjNhtxxAdg9zDz9VeasSBbA059IYPESLwdYGTijG3WRTyTQDJLnk
	 tslMFR9kvN7bo7r8kn8Hhfrg+k/L1j98Y+IA8rMZiFOOnM/Sdfh2U5PqficklEsHKL
	 hKCnWeNFM+0Mg==
Date: Thu, 17 Sep 2026 11:28:20 +0100
From: Lee Jones <lee@kernel.org>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>
Subject: Re: [PATCH 1/3] mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
Message-ID: <20260917102820.GH1605367@google.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914201456.2018403-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914202828.46A991F000FF@smtp.kernel.org>
 <TYRPR01MB15619117776C86C7E6BBF444E85B92@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYRPR01MB15619117776C86C7E6BBF444E85B92@TYRPR01MB15619.jpnprd01.prod.outlook.com>

On Wed, 16 Sep 2026, Cosmin-Gabriel Tanislav wrote:

> > From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> > Sent: Monday, September 14, 2026 11:28 PM
> > 
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [Medium] The patch replaces a standard API call with a bespoke pointer arithmetic helper to retrieve
> > parent data, cementing an MFD architectural guideline violation.
> > - [Low] The commit message description starts with a lowercase letter, violating MFD subsystem
> > guidelines.
> > --
> > 
> > commit 8098c2550655f8bdfa6c7acd0a4b1dfbc4e57e2a
> > Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > 
> > mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
> > 
> > Channels 1 and 2 are used by both the PWM and counter drivers. Both
> > subdrivers assign struct rz_mtu3_channel::dev to their own device
> > instance for those shared channels, so the value stored in it depends on
> > which subdriver binds last.
> > 
> > > mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
> > 
> > [Severity: Low]
> > Does this commit message subject violate the MFD subsystem formatting
> > conventions? The guidelines mandate capitalizing the description after the
> > subsystem prefix, e.g., "mfd: <Driver>: <Capitalized description>".
> > 
> 
> Ack.
> 
> > > diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> > > index 0a254e61ec0a5..d809436e2124c 100644
> > > --- a/drivers/mfd/rz-mtu3.c
> > > +++ b/drivers/mfd/rz-mtu3.c
> > > @@ -60,10 +60,17 @@ static bool rz_mtu3_is_16bit_shared_reg(u16 offset)
> > >  		offset == RZ_MTU3_TCNTSA || offset == RZ_MTU3_TCNTSB);
> > >  }
> > >
> > > +static inline struct rz_mtu3_priv *rz_mtu3_ch_to_priv(struct rz_mtu3_channel *ch)
> > > +{
> > > +	struct rz_mtu3_channel *first_ch = ch - ch->channel_number;
> > > +	struct rz_mtu3 *mtu = container_of(first_ch, struct rz_mtu3, channels[0]);
> > > +
> > > +	return mtu->priv_data;
> > > +}
> > 
> > [Severity: Medium]
> > Does the introduction of rz_mtu3_ch_to_priv() violate MFD guidelines for
> > parent data access?
> > 
> > The MFD guidelines explicitly state that child drivers must directly access
> > parent data using standard APIs (like dev_get_drvdata) and to avoid writing
> > bespoke helpers in the parent.
> > 
> > While this replaces dev_get_drvdata(ch->dev->parent) to avoid depending on
> > subdriver-populated state, substituting it with a custom helper using pointer
> > arithmetic (ch - ch->channel_number) tightly couples the implementation to
> > the physical layout of the channels array.
> > 
> > Could the child drivers be refactored to retrieve the parent data themselves
> > instead of introducing this bespoke accessor?
> > 
> 
> If we were to refactor the children to pass the parent's struct device
> (or struct rz_mtu3 via dev_get_drvdata()), we'd have to change the API
> and update all call sites.
> 
> What we could do rather than the container_of() solution I implemented
> here is add a backpointer to struct rz_mtu3 in struct rz_mtu3_channel
> and populate it in the MFD driver.
> 
> But container_of() gets the same data with nothing new to be stored,
> and struct rz_mtu3_channel::dev can be removed entirely afterwards.
> 
> I would appreciate your feedback on the desired approach here, Lee.

Either passing a pointer to `struct rz_mtu3_priv` as the first argument
or adding the same pointer into the channel struct would be acceptable.

Both of those solutions are better than the current '_->parent' lookup
which when conducted _from_ that parent is just odd.

-- 
Lee Jones
