Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B436D9E7;
	Thu, 16 Jul 2026 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220876; cv=none; b=AM7jJJ7/dH0bLwclrYm152eHa3od7WLCjv3UIzkGAjZP2tNDbQKszCQlO+bqts8gHHk3oJDiMlsWCoIsav79mryyrd6nTDG/kvUWlzKPw7QBowWYnJyffZ/wnuMy5poBXGkf9Hi3SmtjjNbHAppGfwUpD/UQUnWxqXX9oBbP2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220876; c=relaxed/simple;
	bh=W/L+E6Bpgf1w17HOXtiE1hRBpI2QbTBmxfxVWYeqoWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mI28V4GuAmvaq0646BIpASj8fyNGiLu5mNTkMzuxXu1qc1sYGNg8fZmrPyNn6xj/DBGT3NMgJsX3OEkGGtbIEV1fkNvGjUeKrMncP9Eal0d2gYsZfUHoZ46C7jzH68amsu6bbNbTDMZ71kDNL+lWgBjmrd2a2fsmfgJUOPVbzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N71dIZEB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N71dIZEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5501F000E9;
	Thu, 16 Jul 2026 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220875;
	bh=eizyMw1RZYBP05RNE6IyW2G1IdFAvlrLk3hdDOWwDGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N71dIZEBgnTMvh9MHwyNqWlAz4kogA6x2nLMcn/Bw1DsmwGrKmM+aRBG1E2aQLt2u
	 EAFQl+24NJYi0Y+hAgZ4xaEEFH2SSVPYU9zQjcnRGowNLKKBsOeqCNSn5gu+Nkwm5A
	 ui1muzHdvYDwWkmpH1DSXbiYcE31yXsqyrBi3fnTruvVu8KyLwWL5hze2bod8ULsmU
	 SyKsljYlt6b9ipS9Les3t/ZNwQMqcpFKoGqX/WTec0SceVDLgOayUWi7JskplYri79
	 Ntt98KoqEsoBlOPWph9J7KtOe2eYbGRI+uduoow9bm2PmrAlpCs58yxxb0WJxN3kaw
	 zWfTYItMpUhWA==
Date: Thu, 16 Jul 2026 11:54:34 -0500
From: Rob Herring <robh@kernel.org>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
Message-ID: <20260716165434.GA290489-robh@kernel.org>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142224.5FA721F00A3A@smtp.kernel.org>
 <b179ac7a-af91-da67-3232-e9e41203ade0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b179ac7a-af91-da67-3232-e9e41203ade0@oss.qualcomm.com>

On Thu, Jul 16, 2026 at 08:37:17AM +0530, Vishnu Reddy wrote:
> 
> On 7/15/2026 7:52 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node without addressable children.
> > --
> >
> > --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
> > commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
> > Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >
> > dt-bindings: media: qcom,glymur-iris: Add glymur video codec
> >
> > This commit adds the device tree binding for the Qualcomm Glymur Iris video
> > codec. It introduces a new dual-core architecture requiring additional
> > power domains and clocks, and updates the maxItems limits in the common
> > venus schema to accommodate these changes.
> >
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> >> new file mode 100644
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> >> @@ -0,0 +1,255 @@
> > [ ... ]
> >> +  interconnect-names:
> >> +    items:
> >> +      - const: cpu-cfg
> >> +      - const: video-mem
> >> +
> >> +  '#address-cells':
> >> +    const: 2
> >> +
> >> +  '#size-cells':
> >> +    const: 2
> > [Severity: Low]
> > Are these properties necessary here? The schema strictly enforces const: 2
> > for #address-cells and #size-cells at the root node, but none of the child
> > nodes (non-pixel, pixel, firmware) define a reg property, and the parent
> > does not define a ranges property. 
> >
> > Will this cause the DeviceTree compiler (dtc) to emit an 
> > avoid_unnecessary_addr_size warning when compiling device trees using this
> > node?
> >
> >> +
> >> +  non-pixel:
> >> +    type: object
> > [ ... ]
> >> +        resets = <&gcc_video_axi0c_clk_ares>,
> >> +                 <&gcc_video_axi0_clk_ares>,
> >> +                 <&videocc_mvs0c_freerun_clk_ares>,
> >> +                 <&videocc_mvs0_freerun_clk_ares>,
> >> +                 <&gcc_video_axi1_clk_ares>,
> >> +                 <&videocc_mvs1_freerun_clk_ares>;
> >> +        reset-names = "core_bus",
> >> +                      "vcodec0_bus",
> >> +                      "core",
> >> +                      "vcodec0_core",
> >> +                      "vcodec1_bus",
> >> +                      "vcodec1_core";
> >> +
> >> +        #address-cells = <2>;
> >> +        #size-cells = <2>;
> > [Severity: Low]
> > Does the example need #address-cells and #size-cells? It demonstrates their
> > use without any child nodes containing reg properties, which directly causes a
> > dtc warning during dt_binding_check validation.
> 
> Without #address-cells and #size-cells, getting the below kernel warning prints.
> [    6.953615] Missing '#address-cells' in /soc@0/video-codec@aa00000
> [    6.968288] WARNING: drivers/of/base.c:115 at of_bus_n_addr_cells+0xa4/0xf4
> 
> [    7.440909] Missing '#size-cells' in /soc@0/video-codec@aa00000
> [    7.447044] WARNING: drivers/of/base.c:142 at of_bus_n_size_cells+0xa4/0xf8

Then the kernel is wrong.

Rob
