Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B04908DD;
	Fri, 14 Aug 2026 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731313; cv=none; b=Q1sOm6kCZUhAbu7WzDRvzXK/0VGTyWxUCkUQE2U3n69mZHizPawIesv1aQJhbMJMApeu/loazc+vgSzMtqNhrae9CV3LYjLI3LNghQpYG1eqMoEN4KgwEPpAUu0K9rzzxjl6jzKfe3i9gqgjXH6TsZlfqt0e514y6aENLo2liRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731313; c=relaxed/simple;
	bh=FAQe8K3WtXf9zE/h1I1r4dxas6Lxm4YxHWV9a8iY4ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8PWZBBPxWD3y0uASgfDVbVQ1dmcGjp7quJ+95BEheUBX4Y83Rr1GS682/oWbGucgA5R/4QnZrCRJhuWicMTEe3n9T/iuetjFcmFSjZMb7fFF9S58fIcCt16cnLj63yF+WZWrwDv2OMk3lLFYhERV401XK6i2AGyNX7D+P/Zu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnu17Gao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnu17Gao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BE51F000E9;
	Fri, 14 Aug 2026 18:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786731311;
	bh=/3aVrEO/ZPRcGp0+GUOquBEpY6pCN/wvllzg5oTpbkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nnu17GaoNyqCgHqKyQxHj/1nOCPUyXP9tycdxQQ3omUVzWnoYN2tayo1mhYRSC/ha
	 48c/8enKupfxCByMuQ9eIVMo4tnoSuhdGJUHUR8Cs9wQDSSoffFaihh7cbYUeeZ3gF
	 vU9LZKUkYbvkCUEVe4b5nJQqXwwQeKak/HYg5xQuI1dJdbS79CWR0+T6RoNepPilIu
	 DaklX2bGTo9q14vqm1KxGK3t9pz6CTJzByiarMq+YTTXoQsWRxtTvb0K3aJfFzOZ6Q
	 LwOpb4t8Ctc4prVc+1PLKY7pRCpfK0TwVv0RkIdixRqLrmcueJvnpacTFTZGJx3/do
	 5+8szAVPyMmTQ==
Date: Fri, 14 Aug 2026 13:15:10 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Abdurrahman Hussain <abdurrahman@nexthop.ai>, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] of: property: add i2c-parent to fw_devlink supplier
 bindings
Message-ID: <20260814181510.GH1981719-robh@kernel.org>
References: <20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai>
 <20260814010950.051261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814010950.051261F000E9@smtp.kernel.org>

On Fri, Aug 14, 2026 at 01:09:49AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] fw_devlink incorrectly parses I2C slave addresses as phandles due to 0-cell supplier binding definition for `i2c-parent`.
> --
> 
> --- Patch [1]: [PATCH] of: property: add i2c-parent to fw_devlink supplier bindings ---
> commit 85f34a66eac871d9e36bccb6795b94b17ab065d4
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> of: property: add i2c-parent to fw_devlink supplier bindings
> 
> This commit teaches fw_devlink about i2c-parent so the core creates the
> corresponding device links. This ensures consumers are unbound before the
> parent adapter's device, removing the need for -EPROBE_DEFER.
> 
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -1409,6 +1409,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
> >  DEFINE_SIMPLE_PROP(leds, "leds", NULL)
> >  DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
> >  DEFINE_SIMPLE_PROP(panel, "panel", NULL)
> > +DEFINE_SIMPLE_PROP(i2c_parent, "i2c-parent", NULL)
> 
> [Severity: High]
> Will this correctly handle device tree bindings where the i2c-parent
> property includes a slave address argument?
> 
> For example, platforms using devices like the Toshiba TC9563 PCIe switch
> might use a property such as: i2c-parent = <&qup_i2c 0x77>;
> 
> By passing NULL as the cells argument to DEFINE_SIMPLE_PROP(), the parser
> assumes a 0-cell list. When fw_devlink iterates over the property, it finds
> the first phandle correctly, but won't it erroneously interpret the slave
> address argument (0x77 / 119) as a second, independent 0-cell phandle?
> 
> If another unrelated device tree node happens to match this phandle ID,
> could this cause fw_devlink to link the consumer to the wrong device,
> potentially leading to spurious probe deferrals or circular dependencies?

I think you need custom parsing for this one to read the first cell and 
ignore the 2nd cell if present.

Rob
