Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CFE37416B;
	Fri, 17 Jul 2026 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784326659; cv=none; b=Z+gLuFB6cezjLHvBWCzOlk334vbrh12mwcNnuMcAT3Yg2eeJd8g+03Xm7Hi18iHj4bGXUKrUMuCGg+48fnHmWwljfHr/jWcTo4LSuSss71UNv1pOE1Ljl5D/HM6mmzH/OeH0YVfqwh/guBAzD2ZXgspWE7yUY0xcHuHPlgBZ0Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784326659; c=relaxed/simple;
	bh=uiPvNVt36vo9F3GrJhZK+cIaYzZ6AAbvmRNVzZnOq8I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tIOd3ZsG2wmO6tsvffoUoaDbcl1yorkwsRxfK9qEJbIHGk47XiNGP76D5Jpa2TSXUic9u2Xo5UTfeXs8v15EyvoTLWGMLA0OtKKQKlHqD83IfWPfpwk6nuaUObCG1J/1sByGhUTwgpb5w+C+lKf7/PeDLVkWYKhA4dsWkm/PygY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Yk5fIPeU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Yk5fIPeU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6169F1476;
	Fri, 17 Jul 2026 15:17:31 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 408E73F905;
	Fri, 17 Jul 2026 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784326655; bh=uiPvNVt36vo9F3GrJhZK+cIaYzZ6AAbvmRNVzZnOq8I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yk5fIPeUW0x2i9VLP5P9RdwcZkeAz0AxuayUClU7kXKKR5brczCOBLM7bM+JDrY7n
	 L8qXNmEciRt9mlF5FGiNVvsM1Mvp6csRwaHCv9Hu2QBi8vGDwGQGXWRKiJiYHFPMHc
	 QOAo1rmFFaIq57oMDaLnqjrWHCMNXpNOXo+gv7oU=
Date: Sat, 18 Jul 2026 00:13:51 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Junhui Liu"
 <junhui.liu@pigmoral.tech>, linux-sunxi@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Message-ID: <20260718001351.5e2c6bb5@ryzen.lan>
In-Reply-To: <20260712081340.438D21F00A3A@smtp.kernel.org>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
	<20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
	<20260712081340.438D21F00A3A@smtp.kernel.org>
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

On Sun, 12 Jul 2026 08:13:39 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing reset controls for hardware modules R-TWD, R-PPU, R-TZMA, and R-CPU-BIST.

Those devices indeed have no reset controls, so the code is right.

> - [Medium] The mux shift for `r_cpu_timer0..3` is incorrectly set to 4, which is anomalous for PRCM CCU clocks and likely a copy-paste error.

Those timer control register differs from the other ones, so the code
is correct: CLK_SRC_SEL is bits [6:4], S_TIMER<n>_CLK_GATING is bit 0.

Cheers,
Andre

> --
> 
> --- Patch [3]: [PATCH v2 3/8] clk: sunxi-ng: a733: Add PRCM CCU ---
> commit 52650c9e3c767283edee5eb6338cdb409a63f50e
> Author: Junhui Liu <junhui.liu@pigmoral.tech>
> 
> clk: sunxi-ng: a733: Add PRCM CCU
> 
> Add support for the Power Reset Clock Management (PRCM) module found in
> the Allwinner A733 SoC. This clock controller manages the clock control
> and reset functions for device modules within the CPUS domain.
> 
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> > new file mode 100644
> > index 0000000000000..a56cd3edff5fe
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c  
> [ ... ]
> > +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
> > +				      1, 3,	/* P */
> > +				      4, 3,	/* mux */
> > +				      BIT(0),	/* gate */
> > +				      0);
> > +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1", r_apb_parents, 0x104,
> > +				      1, 3,	/* P */
> > +				      4, 3,	/* mux */
> > +				      BIT(0),	/* gate */
> > +				      0);
> > +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2", r_apb_parents, 0x108,
> > +				      1, 3,	/* P */
> > +				      4, 3,	/* mux */
> > +				      BIT(0),	/* gate */
> > +				      0);
> > +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer3, "r-timer3", r_apb_parents, 0x10c,
> > +				      1, 3,	/* P */
> > +				      4, 3,	/* mux */
> > +				      BIT(0),	/* gate */
> > +				      0);  
> 
> [Severity: Medium]
> Are the mux shift values for r_cpu_timer0 through r_cpu_timer3 correct?
> 
> Most of the other PRCM clocks in this driver use bit 24 for the mux shift.
> If the hardware actually expects the mux configuration at bit 24, writing
> to bits 4-6 might fail to select the correct parent clock and could
> accidentally overwrite other configuration bits, resulting in incorrect
> timer frequencies.
> 
> [ ... ]
> > +static struct ccu_reset_map sun60i_a733_r_ccu_resets[] = {
> > +	[RST_BUS_R_TIMER]	= { 0x11c, BIT(16) },
> > +	[RST_BUS_R_PWM]		= { 0x13c, BIT(16) },  
> 
> [Severity: Medium]
> Should there be reset controls for the R-TWD, R-PPU, R-TZMA, and
> R-CPU-BIST modules mapped here?
> 
> These modules have clock gate offsets defined (0x12c, 0x1ac, 0x1b0, 0x1bc)
> elsewhere in the driver, but are omitted from this reset list. If they do
> have corresponding reset lines, missing them could prevent their drivers
> from taking the hardware out of reset during initialization, potentially
> causing uninitialized states or bus hangs upon access.
> 
> > +	[RST_BUS_R_SPI]		= { 0x15c, BIT(16) },
> > +	[RST_BUS_R_MSGBOX]	= { 0x17c, BIT(16) },  
> [ ... ]
> 

