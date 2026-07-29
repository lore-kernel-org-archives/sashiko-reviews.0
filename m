Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B266A2D73A1;
	Wed, 29 Jul 2026 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317881; cv=none; b=R+d+fSRMu3Tefld8B/uG+kAH4xequzjVH9XueLrXEOpzJJBiRRwD0SRPTrQl1CtQTtNMqaiInCuQcjlAubyiRSQCHoybJwl6JLybXBHYqGMa2/noxlwVoARLP5F021Fsi4gxtwIesvgkpWIaDWccTsZq82rXOo7m9xrOXXOQXGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317881; c=relaxed/simple;
	bh=28D5nNF4zbN3byS6jWFAsLf3aFZVFARqN4RKV7DUUt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5qT3wGvFUl27os2D3OcA+fpJUugbPl047UMhh7QAhUb9T7BHr4Jw8jPioOXj0MW7EQQ89Ue2EEjWiMsMkpuJdAcIgIH/UVTg7GoG1GmHQkntwApKRdeDUA5De+IFPbrAiJ+8XLdOPWNSfCjfFoQYJ7mAlTACcbYZon9jbLHslc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=mrMjcnY7; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="mrMjcnY7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=jdJjAQ5usu/uPD4P5xeoaT+rcjDFpo2ZWXNtcZD+yKI=; b=mrMjcnY7nPhCaAbMQmxKfVOR94
	QnAM7D6AdTeeW+wn6FeoQR+WN0qHSGk/6cwltYj579cHeOAlA4aB83Fq6ZB5cfbJN8mUJtptQfd5C
	qQmQPsSwig5PQIVVU5JxVmkaTm+uOyA3hT5jACOf/XVI4H95YxIQ//dvyGd705OyH0p0TPlhC9sPl
	Le4dSOwv/Bw/mZXuM7CCdC17lfqwjKkWUI52ykN599iVjIxLRTjqjBv20gJQRXwGuehi3pLcQGO20
	Fz4mXXFawAd7Im3B924iNfACNFVLdZpuMyTYs5k0hf4FnprlB78x8qFjb3Ftltkgcd78B37e+UhcE
	zAk+N6Vg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp0jd-00000002Jo2-2BFi;
	Wed, 29 Jul 2026 11:37:57 +0200
Date: Wed, 29 Jul 2026 11:37:52 +0200
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
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Add a common board dtsi for
 Milk-V Jupiter boards
Message-ID: <amnJ8JmhGbH_sNV_@aurel32.net>
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
 <20260728211020.1248676-3-aurelien@aurel32.net>
 <20260728212345.A0CFE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728212345.A0CFE1F000E9@smtp.kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2026-07-28 21:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch incorrectly removes the original authors' copyright headers from k1-milkv-jupiter.dts and replaces them with a single copyright claim by the patch author.
> --
> 
> --- Patch [2]: [PATCH 2/3] riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter boards ---
> commit 97e4c73a96036da2bf4f3762abb7b076f18d6748
> Author: Aurelien Jarno <aurelien@aurel32.net>
> 
> riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter boards
>     
> This commit adds a common board dtsi file for the Milk-V Jupiter board
> variants. It factors out common configurations into the new dtsi while
> excluding CPU operating points, which are left for the specific board files.
> 
> [ ... ]
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > index 3c16d0c20050e..9c4aa4f8a533c 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > @@ -1,471 +1,11 @@
> >  // SPDX-License-Identifier: GPL-2.0 OR MIT
> >  /*
> > - * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> > - * Copyright (C) 2025 Javier Martinez Canillas <javierm@redhat.com>
> > + * Copyright (C) 2026 Aurelien Jarno <aurelien@aurel32.net>
> >   */
> 
> [Severity: Low]
> This isn't a bug, but should the original authors' copyright headers be
> retained here?
> 
> While the original copyright headers were correctly preserved in the newly
> created k1-milkv-jupiter-common.dtsi file where the bulk of the code was
> moved, standard practice is to retain the original attribution in the
> existing file as well, alongside any new copyright claims.

Thanks for the hint, I'll fix that in the next version.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
