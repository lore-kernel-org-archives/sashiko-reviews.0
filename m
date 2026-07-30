Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C83CB918;
	Thu, 30 Jul 2026 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406828; cv=none; b=Qw7V+3o7kAQ//oOKPtb1Mb7uZkHXLNp0nb1PfBq37VOzegSZtISDBUXX9cdoItG63rwGvARO+txRezlnX14GbvDjPZ+DHa35ck1CABpBxNf6lUP3rDS6qKaenOQWfkNbVDJDOb1YmS/pDTKkumKROr1HGWlwHDdgl87mskT9s24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406828; c=relaxed/simple;
	bh=SItzjP6NCZc85QcMoy3zvMBmct771MJHUZdy8mn7nmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emq4w+yreKt5Iq9DcIoyexxPYQqarxOqHgFmYsdOW0Y+Gjxusi0fK2fSqhZ09kHNTt6zH7qxgekx3TCvTcY4eCAiJbxrlnQOZa2lXDo1zKXCnmL3wDG9Ik8c1nUbKGOW4OpNSedFtNf6vJJ8sn3C5+27KsI3hc6qkIdyhDcRi2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=PRD9oYAi; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="PRD9oYAi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=lqe6fn6xE+B9TzlhACzO3A+XqQ4Cb+nHYZWBZjRrgM0=; b=PRD9oYAiPvn8MnJFynejZC0mPM
	4X8LcLNZ8r+fNQxnCUfUnKjSbTqpPilc8my5exZ9QqpqzpjaZ/rQ6N7iGB3v/E2X6Dfoxf8O8Q83z
	5frEMatty3w+YdbmuiYFNQuYlGd0p0ma67ziujDgDbMaRYqPiMh2dz1oPtNzuXTAO/xYLNvEecAXC
	AS2hBPnC8E0zhu5gESIenxIQ7td40MY7OwoHdXR6Lxq2gwUpBSrgkmu7fnTONYA9p/dkDm3/fwRLW
	sDGB3kjcNm6tA+SC3xo9Xgg+RUvevNs6KIOHOG9vohXVPxerRGx1B56NvF7lvfbhlRMCRCFz29WD3
	anaRXvmA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wpNsF-000000040VI-3Jhh;
	Thu, 30 Jul 2026 12:20:23 +0200
Date: Thu, 30 Jul 2026 12:20:17 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: sashiko-reviews@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: k3: add USB3 B and C
 controllers for Pico-ITX board
Message-ID: <amslYcO2uXLKkHLw@aurel32.net>
Mail-Followup-To: sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260729172450.1660418-1-aurelien@aurel32.net>
 <20260729172450.1660418-4-aurelien@aurel32.net>
 <20260729173332.51D661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729173332.51D661F000E9@smtp.kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2026-07-29 17:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Mismatch between the length of the `phys` and `phy-names` properties in the `usb3b` and `usb3c` device tree nodes.
> --
> 
> --- Patch [3]: [PATCH v2 3/4] riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board ---
> commit 2aa9a6448bde1ee249cba54ddbed1021d4ace1cc
> Author: Aurelien Jarno <aurelien@aurel32.net>
> 
> riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
> 
> This commit adds the USB3 B and C controller nodes and their corresponding
> USB2 and USB3 PHY nodes to the SpacemiT K3 SoC device tree. It also enables
> them on the K3 Pico-ITX board in USB 2 mode.
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index 0eb24fac4733e..b786f119d4f95 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> [ ... ]
> > +		usb3b: usb@81400000 {
> > +			compatible = "spacemit,k3-dwc3";
> > +			reg = <0x0 0x81400000 0x0 0x10000>;
> [ ... ]
> > +			resets = <&syscon_apmu RESET_APMU_USB3_B_AHB>,
> > +				 <&syscon_apmu RESET_APMU_USB3_B_VCC>,
> > +				 <&syscon_apmu RESET_APMU_USB3_B_PHY>;
> > +			reset-names = "ahb", "vcc", "phy";
> > +			phys = <&usb3b_u2phy>,
> > +			       <&combophy 2 PHY_TYPE_USB3>;
> > +			phy-names = "usb2-phy";
> 
> [Severity: Medium]
> Does this mismatch between the array lengths of phys and phy-names cause
> dtbs_check schema validation to fail? The phys property defines two items,
> but phy-names only lists "usb2-phy", omitting "usb3-phy".
> 

This is correct, i'll fix that in v3.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
