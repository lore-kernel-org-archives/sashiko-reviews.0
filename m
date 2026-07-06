Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474F92EEE68;
	Mon,  6 Jul 2026 17:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357539; cv=none; b=GJZSNTPco7Av+Ad5Glb6c3CHg347XnVGzmFhk4DK7iCPMRAWs6591UcskqMRdBClA9++/Y5cGfKhMWHi6E2H3kMim7yQf4jZEgnwWcQV2wepmJytS3+1kzknkdcA7iktbFltb8/2K3TOGsuh6vSBHRvxvEz17mzGx1wY2dA8/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357539; c=relaxed/simple;
	bh=Bh/NhYoilvEBMml7H16r4YwQp2jHb6btfgDffr7AWIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjFseDDKwx88l7Stjnosb3n69VJv+hBNwZ8cSosKO/SjB/Nb068tbubic3jQKqVDLQ1U3OnUmD7r2A/RbPrPKUk6jZbuAjUsTIz77rOVgb6cowILx18PuegBMUv2Cpc4rlhtd6kGNSMFgW+O4gFMQUWjGc/rlkYFqxpU8EOeQOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chRQfo14; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chRQfo14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50E71F000E9;
	Mon,  6 Jul 2026 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357537;
	bh=cQC0CCHeb+nRGhmnTm+kOgmt7Ax4UHsY6IFI0qwAXtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=chRQfo145b1N+VAnSPczv2KbFSL6ecr5fFLtPTg+GMbs66bYXCrB/noGAcdOHke7T
	 oBM4shzfVLhLr4nRClwSi2NNJn1oGmdKa7aNwvkeNPpBa/bSXViMr+tchtscxr0eTP
	 p3VMjwJXI5+ctIkKJaC0rXwdhaLp78LU2w+IOTdm8PX3itepPIX6+HRasuk+jfgmgy
	 Kzb4petWMyYjafC1PFDt0JPeN9/eM8yJsI/H/O9D/j4+k0xPIYwboiT8FooyQRYc2H
	 acJZDEr9IgYYDkMWOz+Nxvu+AjnovDoNayplO0GRpp38U6khMFHtb3bGsmSVqMDcPz
	 A8Hyj5Yr2z7Eg==
Date: Mon, 6 Jul 2026 10:05:36 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] riscv: Enable resctrl filesystem for Ssqosid
Message-ID: <akvgYEMC1JPHfReR@x1>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-6-c9c1342fe3cf@kernel.org>
 <20260628213007.AE2CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628213007.AE2CD1F000E9@smtp.kernel.org>

On Sun, Jun 28, 2026 at 09:30:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] RISCV_ISA_SSQOSID unconditionally selects the user-visible menuconfig RISCV_CBQRI, defeating its prompt and violating Kconfig best practices.
> --
> 
> commit 6a7bfcfac7becb358efe0bde0c988634f28e5326
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv: Enable resctrl filesystem for Ssqosid
> 
> This commit enables the resctrl filesystem for the RISC-V Ssqosid extension.
> It modifies the RISCV_ISA_SSQOSID config to select ARCH_HAS_CPU_RESCTRL and
> RISCV_CBQRI.
> 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index ee586925f9722..9c28bcbc29dc9 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -594,6 +594,8 @@ config RISCV_ISA_SSQOSID
> >  	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
> >  	depends on 64BIT
> >  	default n
> > +	select ARCH_HAS_CPU_RESCTRL
> > +	select RISCV_CBQRI
> 
> [Severity: Medium]
> Is it intentional to use select on RISCV_CBQRI here?
> 
> RISCV_CBQRI appears to be defined as a user-visible menuconfig:
> 
> drivers/resctrl/Kconfig:
> menuconfig RISCV_CBQRI
> 	bool "RISC-V CBQRI support"
> 	depends on RISCV && RISCV_ISA_SSQOSID
> 
> Using select on a user-visible symbol forces it on and overrides the prompt,
> which can create a confusing configuration experience where the option is
> visible but cannot be toggled.
> 
> Could this be addressed by either using "depends on" instead of select,
> or by making RISCV_CBQRI a hidden symbol without a prompt?

I'll make RISCV_CBQRI user-selectable in the next revision: drop the select
from RISCV_ISA_SSQOSID, make RISCV_CBQRI depend on RISCV_ISA_SSQOSID with
default y, and move select ARCH_HAS_CPU_RESCTRL onto it.

-Drew
