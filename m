Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D536F39CCE3;
	Tue, 15 Sep 2026 21:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506371; cv=none; b=W8QuSjtCBmEFzYzwQxJhTcwaztl2hItMnOcEdXpqOksIOgDsXfrk19DpOVCTdVpFHRH/iG6IfSXzbmOGDXhMA82LY1Etj1Vl5ZqzgnToDwu9zW0jFRFaaDYyvvetJmAnoDMJJ/RZzoJh8QF6sxR7EpTxFSNCHAawBjV8SdUXIJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506371; c=relaxed/simple;
	bh=aBOJJP6A5C4hrhURb7yE5SYUAJ3oqx3hzU/msHVqdxg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nfEWu8Y7giDmGPSkVXhQufMrsDKVb26SdGe/ZX0NK9Jgd56gRH+oN3DEU8SCBqZljOPGO75d6PTQnIZyD1inXVXBU7j7oy8DBaTlmFbO4qK05yBWzklBoR5f22XR5cZ/aEOvSWXkpl3O5P+TiLrq8bPFYBWeD2Nxnz5l4HS0HZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jSlvK8hI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jSlvK8hI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83893152B;
	Tue, 15 Sep 2026 14:06:03 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB4CE3F882;
	Tue, 15 Sep 2026 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789506367; bh=aBOJJP6A5C4hrhURb7yE5SYUAJ3oqx3hzU/msHVqdxg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jSlvK8hI/FX84XvakztHpnE/7R0Z6+ZuVc99SRY+6AiDkO249I8rxrCC+H2rkgp/G
	 oFeKtc80XxfP5T2VAcUkk58Cdnclh9mX7b7FX0ZnGLgL+C0mGjEJdpJa452zNT/nMG
	 eXdnb6ApIDdvmxTOk9ARS8B1VIHubs4iqIlGsmDU=
Date: Tue, 15 Sep 2026 23:01:27 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 robh@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 conor+dt@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
Message-ID: <20260915230127.7aa4386a@ryzen.lan>
In-Reply-To: <20260915-flip-steadfast-9198d002f381@spud>
References: <20260914210115.28151-1-andre.przywara@arm.com>
	<20260914210115.28151-3-andre.przywara@arm.com>
	<20260914211940.256A11F000FF@smtp.kernel.org>
	<20260915005122.40ba2d7a@ryzen.lan>
	<20260915-flip-steadfast-9198d002f381@spud>
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

On Tue, 15 Sep 2026 17:58:50 +0100
Conor Dooley <conor@kernel.org> wrote:

Hi Conor,

> On Tue, Sep 15, 2026 at 12:51:22AM +0200, Andre Przywara wrote:
> > On Mon, 14 Sep 2026 21:19:39 +0000
> > sashiko-bot@kernel.org wrote:
> > 
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [High] Missing SoC fallback compatible string 'allwinner,sun50i-a100' for the Teclast P80 tablet breaks CPU frequency scaling.
> > 
> > Well, there is more to it. We should rather add the a133 as an explicit
> > name in the driver, like we did for the H616 family. And the whole OPP
> > table is still from the old A100 days, it doesn't really cover the A133
> > or A133P values, which go up to 1.6GHz and 2.0 GHz, respectively.
> > The bin selection in the driver is also not adequate, the BSP code
> > seems to use the SID cell at 0x00 to select one of two speed bins, at
> > least for the A133. The A133P is probably still different.
> > 
> > So I'd rather keep the a133 fallback compatible, and adjust the driver.
> 
> Can you explain the complaint from Sashiko to me?
> From where I am sitting, without awareness of allwinner SKUs, it seems
> like the bot is suggesting that you add a "random" fallback to make a
> driver probe.

Well, this is about the DVFS driver, which doesn't really have a nice
device to match against. The nodes under /cpus carry the cores, but
there is no notion of a SoC here, it's just about architectural Arm
cores. So the solution was to match this against the machine (fallback)
compatible, which always carries the SoC name. I think other platforms
do the same.
And while we have DVFS support for the A133, this only supports the
"allwinner,sun50i-a100" fallback string, as this was the only chip of
that "family" at time of upstreaming. The A133 is using the same
die, it's just a better bin, but there are virtually no A100 devices out
there, as they were superseded by the A133 very quickly.

So what Sashiko (somewhat correctly) mentions is that with that
a100 fallback string we won't get DVFS support. It feels odd to name
that tablet A100 when it's clearly not, so I went with the proper SoC
name.
We did the same for the H616 family: just adding all the names using
the same die to the DVFS driver will solve this problem as well, which
is what I am planning to do - unless people have different opinions.

Hope that helps!

Cheers,
Andre



> > 
> > Cheers,
> > Andre
> > 
> > > --
> > > 
> > > commit 582b866f1ad9000afddf47eb7e4c9d37a95dfbc8
> > > Author: Andre Przywara <andre.przywara@arm.com>
> > > 
> > > dt-bindings: arm: sunxi: Add two Teclast tablets
> > > 
> > > This commit adds devicetree bindings for the Teclast P80 and P85T tablets.
> > > The Teclast P80 is based on the Allwinner A133 SoC, and the P85T uses the
> > > Allwinner A523 SoC.
> > > 
> > > > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > > index f04db28c630ac..28437c47ac01b 100644
> > > > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > > @@ -933,6 +933,16 @@ properties:
> > > 
> > > [ ... ]
> > > 
> > > > +      - description: Teclast P80 Tablet
> > > > +        items:
> > > > +          - const: teclast,p80
> > > > +          - const: allwinner,sun50i-a133
> > > 
> > > [Severity: High]
> > > Does this strict two-item compatible array omit the necessary fallback string?
> > > 
> > > The sun50i-cpufreq-nvmem driver in drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > requires allwinner,sun50i-a100 to exist in the root node's compatible array
> > > to bind via of_machine_device_match(sun50i_cpufreq_match_list).
> > > 
> > > Without this fallback string included in the bindings (and subsequently the
> > > board's Device Tree), cpufreq-dt will not be instantiated. This will cause
> > > CPU frequency scaling to silently fail on the Teclast P80 tablet, leaving
> > > the system stuck at the bootloader-configured frequency.
> > > 
> > > > +
> > > > +      - description: Teclast P85T Tablet
> > > > +        items:
> > > > +          - const: teclast,p85t
> > > > +          - const: allwinner,sun55i-a523
> > > > +
> > > 
> > 

