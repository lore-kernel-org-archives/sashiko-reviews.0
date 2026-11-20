Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200438;
	b=rPbGsi5qai1Gx1Ezu+eSsRnkOyoaBTMyQ7PXqoRJl5E1lMkU+vMXBicazspmcxWLKcBr
	 lc3jqhkqCXz/WSRlbfrS4c4qzFcsZagMoAGPGpF8K+beoyVNLAh8XQnYEKRRsZcXZG9RF
	 b8VpXU69wXwBo6OgHcmN1GHr0Q9INErpYncmpCVExJnlkbDLyThcHxe5hd8DGr+0+ngUw
	 o1FlIxJtKvZ9bqanf1a32f0vvcjifndS4k0tBe9BhDSYkc7g+UPDCASznMIk1lt3I12Ft
	 Xp6G9CTuw1SJxgDiDcqym8Jav6jQTLPzTcn+fM0411EBw/wNZl33aAqscfBIm3X0JgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ewcUplbKFZ3Kf41zlADgLuzbjc/2lDvi2YHHk/8wcoM=;
	b=HS7I3lAaBcicn5iHQUIYS4Ozs6lStNM9kwtfkyEazgHQusP1CC5YtDooFEC4Bt2JDNGv
	 UKzUPJ7NFcjQQ/l/0i8Rgd+0OoSQ366kZ2TZY4TuLztPFHRa1kdnK9ntC4OoWYqoyBh/5
	 lBCe2Go5K1dnUF1rJ+cyVTq5uwWhPfVhgYUbBTmXUATYSSml/jhyMeu4l7opzIJqEfRHO
	 gX0YHsFfRC/1A8Tyj7+2UcSe+qd3r7gpL8dPsCyQBtz+ofrI+GqlaFlHeuspMnZ18pNO8
	 KjAMFvaoD0Xw6YTlMV8qTTqr6wK6o3EKswUPlY4bmi45qIrmI8UMxboYDP4J2yccEWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyXSoAah;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4380160A2605
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 18:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4380160A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyXSoAah
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a357b1c649so721112f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200436; x=1795805236; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ewcUplbKFZ3Kf41zlADgLuzbjc/2lDvi2YHHk/8wcoM=;
        b=XyXSoAah48qbYN/NRkr4nYdrEIIGJndZjwcdrBv2IZNvRouBGX6c5WJNSrYFKINMY1
         QDc5MRSTWnAnTjnEr/80k2Lb6fP6ZKFz/3ronb2WFj0+lHkz08a2LIcKMRFw9Eh/MrHs
         bU5Aic4c1Ml2HCRl+h5gVGaJxQK7VCK9LRFh2xKKIm8OczWvycOdlQ+u9vlDdHXYhQIX
         k0H4dZyPejWyIRf2hL02+TlMHGnoeVU9JQF6FIRrLC6E+Tty211Jxq9HLiP8ploLcswG
         bpjTm6mcTUdqoz8KqhuHtUZiaaSt+XOHfh7s+WiluRFEETxp7D2DeFHLuyJ17D8Tlmxm
         OBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200436; x=1795805236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewcUplbKFZ3Kf41zlADgLuzbjc/2lDvi2YHHk/8wcoM=;
        b=j7Yy/hp/dW+4K91ZcrLM10KwzQimyM+/EWDJDzwV6okTFKh/Is1IzuYSiniZnG97j5
         PtOZJIbMh0QYBYBvJTrmo+Z4gQ0aYW6etp1ABCltspe+iiMOQroupmMe3ahvL1cKhKxr
         S8kuglixTFrJnveMB+8DNEaM2r5SnshDDC7RZQOXjlwK0ls27w7G2znwZAWGxs4+o9cb
         ZWvXEbHD2ClRs5kF9jS2sY1DKQjgMbXvFNNs6uflx48ySONEUKnV2oRPKHYJ9B/b8ffX
         n0vFsWh452mruY1pi5znvsG+7VMUa+z/qgLXMFIDKOl3XDlTsFHjlFrjNnij5ohlwyJ8
         Yziw==
X-Gm-Message-State: APuU4Z/KXl/o/LPFxm8sBMiEm3tYNC87CbRQphwPHwsB5lnhh7LjGU5C
	ndzq1dexh2TGVy+kAFmmcRZ8JrkCLHTCzcigaL6V6MO2tl70PE4nKdWYAsghLg==
X-Gm-Gg: AZFdTZdAGzgZLlmx0Q5S36jiT0oqJuynmWyBQMEecMAd37XZ6TCETTBFyUTeBvCr6jW
	HmeRfq1NrwXpcWo8WeruP1c1vOC2PSbYDu1za9XIT7Xpa33E+b/q4KNmTA2Q1Zxyix059XDJqNS
	FvFCyil9j6PMlbGcovVdygh7a6mLs2GLVUkU8thPmncKEOil9bbHxnhlbWsvmHyB08hBNt7aP0F
	cGvH9firYlvQHEHi8pJvLP1ufgZDQiVKlMxl1lOrvUemdrDcc1/XjlGarAVmnT9AEPEqjQGHLVn
	ooTH1V6bzsJyKRh94ccxmfY8SZLn7X6V+BxNtFBOzwpMp0rxaZLe8HPtigUPd5mLA4b/cu4A3Me
	THHjQUzTzL9EnuA/sb+or6ipPEI2oV7LxUScrVEEm1rxQ62PlyJUx2OiU33iyvE7mSPvSnJkJzm
	bn0OkE1xZIp00COBSN/xFTu7LeP/tXPiRraoM3SzNYs/d0LpYPoqJEPSvcncDheczEWhQzk1wM8
	gYNFon5NZRUoEyFkq+50gJ9popvdHHtYv4zs1O7zTySDanjgQrRGxS1t6ZhjAsjlG8EZGC8ccEm
	rRb/ScoksJFv+gUgnmsxs2vmotu1lUzcj63bnquVgXwt086toS37MqFaWOJORVB4ZW5a0mxo/xM
	dAKCtOkmt/RrveO26U1cOH5zH547P5h3z96CQpFwmD7a95pMhmMzE+00Cy8bIIxwju/X3IJ2Lch
	I=
X-Received: by 2002:a05:6000:178b:b0:4a4:f208:6a46 with SMTP id ffacd0b85a97d-4abaf740208mr9570917f8f.13.1795200436455;
        Fri, 20 Nov 2026 10:47:16 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm7490817f8f.31.2026.11.20.10.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:47:15 -0800 (PST)
Date: Fri, 20 Nov 2026 19:47:13 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <awCVsf3BF09a0ukI@GLaDOS.station>
References: <cover.1795197853.git.stefano.r@variscite.com>
 <947a7bcf39d89b4a162f296278ccaa3db6512983.1795197853.git.stefano.r@variscite.com>
 <sashiko-outbox-225865@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-225865@kernel.org>

On Fri, Nov 20, 2026 at 06:44:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: freescale: imx93-var: memory@ node names break
>   imx_rproc matching
> --
> 
> commit 3b76dce88eb56af58d06bc8653db1a91c42100e4
> Author: Stefano Radaelli <stefano.r@variscite.com>
> 
> arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
> 
> This commit adds Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata
> and VAR-SOM-MX93 on Symphony, moving the common M33 include into the overlays
> and reserving or disabling affected peripherals.
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> > new file mode 100644
> > index 0000000000000..51ec0beea7c9f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> > @@ -0,0 +1,55 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Cortex-M33 support for Variscite DART-MX93 on Sonata-Board
> > + *
> > + * Link: https://variscite.com/carrier-boards/sonata-board/
> > + *
> > + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include "imx93-var-common-m33.dtsi"
> 
> [Severity: High]
> Does imx_rproc recognize the reserved-memory regions included from
> imx93-var-common-m33.dtsi (both here and in
> imx93-var-som-symphony-m33.dtso)?
> 
> imx93-var-common-m33.dtsi names the reserved-memory nodes memory@2021e000,
> memory@87ee0000, etc., and puts the region names in memory-region-names on
> &cm33:
> 
> arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi:
> 	reserved-memory {
> 		...
> 		rsc_table: memory@2021e000 {
> 		...
> &cm33 {
> 	...
> 	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> 	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
> 			      "vdev1vring0", "vdev1vring1", "rsc-table";
> 
> However, imx_rproc_addr_init() and imx_rproc_prepare() look up regions by
> index with of_reserved_mem_region_to_resource(), which sets res.name to
> the /reserved-memory node name rather than reading memory-region-names:
> 
> drivers/remoteproc/imx_rproc.c:imx_rproc_prepare() {
> 	...
> 		if (strstarts(res.name, "vdev0buffer"))
> 			continue;
> 
> 		if (strstarts(res.name, "rsc-table"))
> 			continue;
> 	...
> 		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> 					   resource_size(&res), da,
> 					   rproc_mem_entry_ioremap_wc,
> 					   rproc_mem_entry_iounmap,
> 					   "%.*s", strchrnul(res.name, '@') - res.name,
> 					   res.name);
> 
> Because res.name starts with "memory@", imx_rproc_addr_init() leaves
> priv->rsc_table NULL and ioremaps the vdev regions, while
> imx_rproc_prepare() registers all six carveouts under the name "memory",
> so rproc_alloc_vring() fails to find the "vdev%dvring%d" carveouts at
> runtime.  In addition, fsl,imx-rproc.yaml does not allow
> memory-region-names on the remoteproc node, causing dtbs_check failures on
> the new -m33 DTBs.
> 

This series depends on the following commits, already in linux-next,
as noted in the cover letter and in patch 2:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

The driver change replaces the direct calls to
of_reserved_mem_region_to_resource() in both imx_rproc_prepare() and
imx_rproc_addr_init() with imx_rproc_rmem_to_resource(), which reads
memory-region-names into res.name. The binding change permits that
property.

With these prerequisites applied, the generic memory@ node names do
not affect resource table or vring matching.

The reported issue applies when the series is evaluated without those
prerequisites. This series needs to be applied after them.

Thanks,
Stefano
