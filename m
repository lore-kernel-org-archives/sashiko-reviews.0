Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E44EF14B;
	Fri,  2 Oct 2026 16:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959839; cv=none; b=I5/MhACCh21nhMoOWOeeBMV1GEEuc45CHWCVU8DaoITL3wbqIzujEMDNwA2UYiWWya8Go4K2enHt4o5i5vxGGtgYhyY67NF5XTv7ASCyCJFzY+pLNaNt+wWV5B83pGUZ4hvvWcS5D1q4AlbBzdG9DbQRZb6pXdYNR3kuWNF2ZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959839; c=relaxed/simple;
	bh=95x3xlDiI2815n07zzg/LipKgqeGPOjrYNNYimMmE1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+ynHX7Vu6Glsyy0o0PavOfpnhwgX6xJWfdQoryrRea+0qENtn1vOGqPDQqam858qNFayX/Iz+IE0aHIzf2TY0PnFuowrWC3Wkz4GyPc1SYWPxGBxiMs8GFAqdJRP1X8WJ3yx0YHB+0THm9kENEnSUoPglCU4Qg9sDp824xPYQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfYLT+H8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfYLT+H8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125E71F000FF;
	Fri,  2 Oct 2026 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959838;
	bh=iU941MCnit9NZoso/+yvrXLFeMMiJWq38g6mRlpKti4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VfYLT+H8WSRoWF9w6/ROPOg49cJC06QH4zKtnt7J1ullfUBQYnkk7xMmxm3bPw9oj
	 KgStcyUdRMX5AnjLGKtQsrhFOYUevWT3UauGdHscls1SvrNHb1QK7s0XugQojHmMBo
	 UWYrCK5uQO/woS80RaZ0Y7aMTxWQza9YlTTciQiTSd+tk7UoU6nwx1MnnMsuFx/x3s
	 oSZG3V5sUCdN0UQgSlW+bJ8SAKt0Gw2C4N6SC0U1D22oKh/F7/s2ARzaY6OiBExr2w
	 Epz+zsVr9V0POS7kM2k5RwnFrrsid4yte5JoVyKovs42ee/8O0ks2hNFEoPw+k7Z1G
	 Ht+Bb0r1GqHdw==
Date: Fri, 2 Oct 2026 11:50:36 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2] dt-bindings: net: Convert HiSilicon hns-dsaf
 to DT schema
Message-ID: <20261002165036.GA2622685-robh@kernel.org>
References: <20260930201919.76465-2-robh@kernel.org>
 <20261002091340.E8C1C1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002091340.E8C1C1F0089A@smtp.kernel.org>

On Fri, Oct 02, 2026 at 09:13:40AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] dt-bindings: additionalProperties false ignores properties from $ref
> - [Medium] dt-bindings: missing required properties desc-num, buf-size and subctrl-syscon
> - [Low] dt-bindings: driver still uses removed top-level phy-handle property
> --
> 
> commit d25b601aef3405df25a4432415cfd3e767a90222
> Author: Rob Herring (Arm) <robh@kernel.org>
> Subject: dt-bindings: net: Convert HiSilicon hns-dsaf to DT schema
> 
> This commit converts the HiSilicon hns-dsaf device tree binding from
> the old text format to the new YAML schema format. It drops the
> top-level phy-handle property and adds the media-type property.
> 
> > Convert the HiSilicon hns-dsaf binding to DT schema format.
> > 
> > Drop 'phy-handle' at top level as there are no users. Add undocumented
> > 'media-type' property.
> 
> [Severity: Low]
> Is it entirely accurate that there are no users of the top-level
> phy-handle property?

Yes, there are no .dts users. It is not even clear if these platforms 
are even being used. HiSilicon folks can add it back if they care.

> 
> Looking at hns_mac_init_phy_handle() in
> drivers/net/ethernet/hisilicon/hns/hns_dsaf_mac.c:
> 
>     np = of_parse_phandle(mac_cb->dev->of_node, "phy-handle",
>                           mac_cb->mac_id);
> 
> The driver still explicitly parses this property from the top-level DSAF
> node as a fallback if port subnodes are not present. Removing this from
> the schema without removing the fallback logic in the driver will cause
> out-of-tree or legacy device trees relying on this feature to needlessly
> fail schema validation.
> 
> Should it remain in the schema (possibly marked as deprecated) until the
> C driver is patched to drop support entirely?
> 
> [ ... ]
> > diff --git a/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.yaml
> > new file mode 100644
> > index 0000000000000..36251b45abeb9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.yaml
> [ ... ]
> > +patternProperties:
> > +  "^port@[0-5]$":
> > +    description: DSA Fabric port node
> > +    $ref: ethernet-switch-port.yaml#
> > +    additionalProperties: false
> 
> [Severity: Medium]
> Does additionalProperties: false correctly allow properties inherited
> from the $ref?
> 
> Under JSON Schema semantics, additionalProperties only restricts the
> properties explicitly listed in the local object, completely ignoring
> any properties evaluated via a $ref.
> 
> Would it be better to use unevaluatedProperties: false here so standard
> Ethernet port properties aren't incorrectly rejected by dt_binding_check
> when present in the device tree?

There aren't any properties from ethernet-controller.yaml used. Again, 
old platform, no new users, and possibly unused.

Rob
