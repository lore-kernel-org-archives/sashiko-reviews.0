Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6270935292A;
	Wed, 29 Jul 2026 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318067; cv=none; b=XH75zVuMuU/WHKZrvD+HTax8Q9MlGMClc5BO428ISMl6b84wXn6FM8FW9HuTwRALviPWJllS5YyBF4YVUCKQVpAuTHwcVExbXAt5627yvYv+MkQ0DRBbwDw0SfnfZi0Tspu+AF+R2yi0Bvj9KoCLzdpD3SPskZxFZ4dqBUt5eWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318067; c=relaxed/simple;
	bh=28PEkWt4RMljGHu1GrTk/miZPLjirv1MgiZ6RPcVhHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbiLzIMkjtVqZIDHsEtyc9t2DvIQGMz4rq721yJLTJoG+rPETU4HxiroI9PzHT2VfJ0Ig6gPF4RUaexBxXgPj5jrBU89VQ/FoIeffSVNvgMyXDWb32HJk6PhYSuwJ+YyVH/XRnVInRBrX2zWlSNPgN6G+K41e2MrPowjNjbCkq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=j7BY7TdB; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="j7BY7TdB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=hL/qldDJTl+VvmHT8jGl8j0M57hUFNJ7M6uiPTcU7cI=; b=j7BY7TdBVyhXWeD6//D97vLAOu
	s21Rh2ezwWSJWJAuigc0nhKOuAJz9+i9C9qJnXP+Yq2kR22nZCBOmfDZC4fc7r3lOxaRb9L8TZWAj
	oPp8LuD/zeGPwNnqVQoqZKmIzKCY9b0+k4uVikJo4bN5n5ALMAUO8bVfZDoaOJr6lZczBG+BAEIZ7
	exTqGMCU4PRwJIQ1bqqA01ub7fk6Q2M8N4ZdThurNARpM/7WKOpCsJb3yTFxJumhfI9HpD2x8Pk8p
	yqZJcz27MqRxrOmz7OVUCuvnqf41jjlQy7MS/HPVEJ9JMLY1fcItb5P4clMcQ/3sbn8XE1aQpcOCA
	flBBtR9A==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp0mc-00000002K2v-2Hr1;
	Wed, 29 Jul 2026 11:41:02 +0200
Date: Wed, 29 Jul 2026 11:40:57 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: sashiko-reviews@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: Add Milk-V Jupiter board (M1)
Message-ID: <amnKqQ1POSlVQnxb@aurel32.net>
Mail-Followup-To: sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260728211020.1248676-4-aurelien@aurel32.net>
 <20260728212841.4C3E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728212841.4C3E41F000E9@smtp.kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2026-07-28 21:28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing unique board-specific `compatible` string for the M1 Jupiter board variant, which inherits the identical compatible string as the K1 variant and breaks DTB matching.
> --
> 
> --- Patch [3]: [PATCH 3/3] riscv: dts: spacemit: Add Milk-V Jupiter board (M1) ---
> commit 2d54397a3a4baaa8a2eee569d6fe3f912a3c7661
> Author: Aurelien Jarno <aurelien@aurel32.net>
> 
> riscv: dts: spacemit: Add Milk-V Jupiter board (M1)
>     
> This commit adds support for the Milk-V Jupiter board with the M1 CPU.
> The M1 is similar to the K1 but allows running at up to 1.8 GHz, adding
> a new device tree and an OPP table for this higher frequency.
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
> > new file mode 100644
> > index 0000000000000..32e1468385ca0
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2026 Aurelien Jarno <aurelien@aurel32.net>
> > + */
> > +
> > +#include "k1-milkv-jupiter-common.dtsi"
> > +#include "m1-opp.dtsi"
> > +
> > +/ {
> > +	model = "Milk-V Jupiter (M1)";
> 
> [Severity: Medium]
> Since m1-milkv-jupiter.dts includes k1-milkv-jupiter-common.dtsi, does this
> board inherit the identical root compatible string as the K1 variant?
> 
> If a bootloader like U-Boot uses a FIT image containing both DTBs, it relies
> on the root compatible string to select the correct one. If they are
> identical, could the bootloader mistakenly apply this M1 DTB to a K1 board?
> 
> If that happens, would the K1 board be allowed to run at the 1.8 GHz
> operating point defined here, potentially causing instability or hardware
> damage since it is only rated for 1.6 GHz? 
> 
> Should a unique board-specific compatible string be added to this root node
> to uniquely identify the M1 board hardware?
> 
> > +};

That's a valid point, I'll fix that in the next version. I believe we 
want to keep the spacemit,k1 compatible even with the m1, as the 
difference is rather a property of the board and not the SoC.

What could be the compatible for the board? "milkv,jupiter-m1"? Maybe 
the existing board should have been called "milkv,jupiter-k1"...

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
