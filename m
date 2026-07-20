Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116513859F5;
	Mon, 20 Jul 2026 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784589416; cv=none; b=c8MbQPoYBJtezkjhPirsuj+T2f7yDh6qB+jQ9sutBh7JgD8Alnc7IYrTmHS1NbwE6ntrDkR2rVcg4Msgndk9CxTwaE9BSS8Wc5mtbCeE5QJAwfMUAAWfTcCInikupdSbitKWMhSBvTLwQndQZb+BU/c0tUHbWCLmIMvWOPMVWts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784589416; c=relaxed/simple;
	bh=9Yj9ZWRDrdzmRKYdoAn+kCtmpfgcX9zHdJicsV+ghV4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DUa7i/vk9lkNn7oU+FhkTBujlcu4Gi7/isMb8XiymEWgwNhDLBgO6hdACqJV5aD93Q0AKC5j6fJ6ni8PcP1Nbzp8wCig8yOwMjliKHKs7/Syl/T1NZ3CA1pXMKSui1dybaBh7hLUgXMCfk8PHGVVBqlfOv4x329S0X9S+0yYCtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hLxtapdA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hLxtapdA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2939143D;
	Mon, 20 Jul 2026 16:16:48 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B4C73F66F;
	Mon, 20 Jul 2026 16:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784589412; bh=9Yj9ZWRDrdzmRKYdoAn+kCtmpfgcX9zHdJicsV+ghV4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hLxtapdAHP7mT+Bg5vDVV0WBmUf5Ux2fUMCgjeX//8C0DujVq8phw929NWTkvAbgC
	 UPDE8GW+WX3FHUNAAQ26CVAnXvIwQEU4aaqL/6MIQa9O9FRJy5EGmKhfFVs4Vn0bpa
	 WKCQ/a9TIGOWsjXayXNIuZ7DONGv1FPn3mHPgJ3g=
Date: Tue, 21 Jul 2026 01:13:05 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: a523: x96qpro+: overvolting eMMC
Message-ID: <20260721011305.5167d19e@ryzen.lan>
In-Reply-To: <20260720215035.ED2D51F000E9@smtp.kernel.org>
References: <20260720213832.3763-1-andre.przywara@arm.com>
	<20260720215035.ED2D51F000E9@smtp.kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jul 2026 21:50:35 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Bumping the eMMC IO regulator (`reg_cldo1`) to 1.9V inadvertently misconfigures the SoC's IO bank (Port C) into 3.3V power mode instead of 1.8V mode, creating a logic threshold mismatch.

Huh, that's interesting, but might actually point to the real root
cause: it seems like the meaning of the bits in the withstand register
is inverted on the A523: 0 encodes 1.8V, a 1 encodes 3.3V. But that's
the opposite of the H6 definition, which we use in the kernel for the
A523 as well. Which means they were wrongly programmed before, but now
the wrong voltage selection turns out to trigger the really correct
setting.

So I will try playing around with those registers instead.

Cheers,
Andre.


> --
> 
> --- Patch [1]: [PATCH] arm64: dts: allwinner: a523: x96qpro+: overvolting eMMC ---
> commit e4c261c388d6e406babdf0d56ac61d104d537230
> Author: Andre Przywara <andre.przywara@arm.com>
> Date:   Mon Jul 20 21:38:32 2026 +0000
> 
> arm64: dts: allwinner: a523: x96qpro+: overvolting eMMC
> 
> This commit changes the eMMC IO regulator voltage on PortC from 1.8V to 1.9V
> for the X96QPro+ device. The goal is to improve eMMC stability and performance
> without drastically limiting the clock frequency.
> 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> [ ... ]
> > @@ -194,8 +194,8 @@ reg_bldo4: bldo4 {
> >  
> >  			reg_cldo1: cldo1 {
> >  				regulator-always-on;
> > -				regulator-min-microvolt = <1800000>;
> > -				regulator-max-microvolt = <1800000>;
> > +				regulator-min-microvolt = <1900000>;
> > +				regulator-max-microvolt = <1900000>;
> 
> [Severity: High]
> Does bumping this regulator to 1.9V inadvertently force the SoC's IO bank
> (Port C) into 3.3V power mode?
> 
> Looking at sunxi_pinctrl_set_io_bias_cfg() in
> drivers/pinctrl/sunxi/pinctrl-sunxi.c, the driver uses a strict check when
> evaluating the voltage:
> 
>     case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
>         val = uV <= 1800000 ? 1 : 0;
> 
> Since 1900000 is greater than 1800000, this evaluates to 0 and clears the
> PIO_POW_MOD_SEL register bit, incorrectly configuring the IO bank for 3.3V
> mode while being powered at 1.9V.
> 
> Could this mismatch alter input receiver thresholds and drive strengths,
> potentially causing signal integrity issues or long-term hardware
> degradation?
> 
> >  				regulator-name = "vcc-codec-sd";
> >  			};
> 

