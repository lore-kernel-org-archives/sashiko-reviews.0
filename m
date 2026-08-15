Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4462D17AE11;
	Sat, 15 Aug 2026 21:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786828156; cv=none; b=mSGzmkFsxWEQeMO0ucbG4t1i1v7AP1spGsqvxAU2yxWySDpv1jupU+oGvvR+zmVxWcuvSM+2C/vRPwbsOxuhaIIUpnfIpqLNkEt6SDQXBYAFWmkQInBEnFTLhR7+bcU8LkomW1NXQ5jjj4Ovjp90aXvuetbgZ8GMxknQEItl+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786828156; c=relaxed/simple;
	bh=cvHtDf/MNkZzP+HuOGgIqHTbLHKklw4Of1sANfDKL/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQVnVINCmmgyVGrEOYIB8cJ0qYIUTLA5R4u4j5ljpiBJpGfvHCE35y0v5EweN5uU2OG6c2wZU9NtrNJTISbG21cDVFr6+jxGi2smMpkXG69rUdDI5Ucf6U5Jq0mkDxPs3OMnCkASh33FVPRv0MDdfyJYlj+5SeoStpwWro0oH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvKIPru8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvKIPru8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A81D1F000E9;
	Sat, 15 Aug 2026 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786828155;
	bh=SdiKS9gyo4Z/n0wKNYDT/4TsbzKJL8AhnxRoK+S57/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QvKIPru8o5AsQvFOlclGfaVkqyTYz6nHIBTvwG5bpVSJYAv7LItFVVxIPezqPWp9X
	 J1/tw8i5IBOQ2LTWYpGyQzukiWKFcPro/l8+A23unovvpectwVaYmhs2vKqhljqZJc
	 PvOcs/mq79Xqrwu2s81Vgy8eVTo+lpc0w0Xf8be3NkGuklyYEasTaqe60Xumm1Qd6l
	 +P8nFkBWXOO179GMoGgcjUF7o+CkMF169A1mZb2UrAatMaYC2/iYjR87RN5lxIq/z9
	 ySavR4E9e59nk72RqCp/nEgJdty2h+WgqdsoQa9JYbpJvIgpx5xIUKoX+1Rk+KG/TK
	 qO5wWiljZrS9g==
Date: Sat, 15 Aug 2026 16:09:14 -0500
From: Rob Herring <robh@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] of: property: add i2c-parent to fw_devlink supplier
 bindings
Message-ID: <20260815210914.GA2217724-robh@kernel.org>
References: <20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai>
 <20260814010950.051261F000E9@smtp.kernel.org>
 <20260814181510.GH1981719-robh@kernel.org>
 <DKOWMVJ31OP8.KS5H56DT4YUE@nexthop.ai>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DKOWMVJ31OP8.KS5H56DT4YUE@nexthop.ai>

On Fri, Aug 14, 2026 at 12:13:45PM -0700, Abdurrahman Hussain wrote:
> On Fri Aug 14, 2026 at 11:15 AM PDT, Rob Herring wrote:
> > On Fri, Aug 14, 2026 at 01:09:49AM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >> - [High] fw_devlink incorrectly parses I2C slave addresses as phandles due to 0-cell supplier binding definition for `i2c-parent`.
> >> --
> >> 
> >> --- Patch [1]: [PATCH] of: property: add i2c-parent to fw_devlink supplier bindings ---
> >> commit 85f34a66eac871d9e36bccb6795b94b17ab065d4
> >> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> >> 
> >> of: property: add i2c-parent to fw_devlink supplier bindings
> >> 
> >> This commit teaches fw_devlink about i2c-parent so the core creates the
> >> corresponding device links. This ensures consumers are unbound before the
> >> parent adapter's device, removing the need for -EPROBE_DEFER.
> >> 
> >> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> >> > --- a/drivers/of/property.c
> >> > +++ b/drivers/of/property.c
> >> > @@ -1409,6 +1409,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
> >> >  DEFINE_SIMPLE_PROP(leds, "leds", NULL)
> >> >  DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
> >> >  DEFINE_SIMPLE_PROP(panel, "panel", NULL)
> >> > +DEFINE_SIMPLE_PROP(i2c_parent, "i2c-parent", NULL)
> >> 
> >> [Severity: High]
> >> Will this correctly handle device tree bindings where the i2c-parent
> >> property includes a slave address argument?
> >> 
> >> For example, platforms using devices like the Toshiba TC9563 PCIe switch
> >> might use a property such as: i2c-parent = <&qup_i2c 0x77>;
> >> 
> >> By passing NULL as the cells argument to DEFINE_SIMPLE_PROP(), the parser
> >> assumes a 0-cell list. When fw_devlink iterates over the property, it finds
> >> the first phandle correctly, but won't it erroneously interpret the slave
> >> address argument (0x77 / 119) as a second, independent 0-cell phandle?
> >> 
> >> If another unrelated device tree node happens to match this phandle ID,
> >> could this cause fw_devlink to link the consumer to the wrong device,
> >> potentially leading to spurious probe deferrals or circular dependencies?
> >
> > I think you need custom parsing for this one to read the first cell and 
> > ignore the 2nd cell if present.
> >
> > Rob
> 
> Agreed. One wrinkle with unconditionally ignoring everything after the
> first phandle: i2c-demux-pinctrl holds a list of several bare phandles
> (i2c-parent = <&iic2>, <&i2c2>, <&gpioi2c2>;), and in the flattened
> tree that's indistinguishable from tc9563's <phandle addr> form. So
> always stopping at entry 0 would silently drop the demux's remaining
> supplier links.
> 
> The only reliable disambiguator I found is the consumer's compatible —
> toshiba,tc9563 is the one binding with a trailing slave-address cell.
> I have this queued for v2:
> 
> static struct device_node *parse_i2c_parent(struct device_node *np,
>                                           const char *prop_name, int index)
> {
>       if (strcmp(prop_name, "i2c-parent"))
>               return NULL;
> 
>       /* toshiba,tc9563 is <phandle addr>; every other user is bare phandles */
>       if (of_device_is_compatible(np, "toshiba,tc9563")) {
>               if (index)
>                       return NULL;
>               return of_parse_phandle(np, prop_name, 0);
>       }
> 
>       return of_parse_phandle(np, prop_name, index);
> }
> 
> Is a compatible check in property.c acceptable here, or would you
> rather see something else (e.g. entry 0 only, accepting the lost demux
> links)? If this looks fine I'll send it as v2.

This is fine. Hopefully we can prevent more cases though.

Rob
