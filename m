Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCDB37DACB;
	Fri, 15 May 2026 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831274; cv=none; b=sJx9x0hfHLBSP2tIVt/4AEY79FY9vgZMzaccf7t1Qrp7h4qg9cbQN40V120ZYEW1Fzr65IORsE8vsa0VyYc/s9EigzVKkmCtpRi/xd/lD1s2+aEU9a8U5K2+g6NDwPDAKVwdUyNaHko+ly0lOlXJTx/2UBhoPUSW3DLcYB7UDm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831274; c=relaxed/simple;
	bh=izNuGR6qE4zq7M8ypskK9BWaIcT/nZhg9aHxbsgjr/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lt93LNLY2/I7T1HQhySh2/bvchHBHZPrkgZ/+Cjq7OPRNjrCvHV1vc4e7cMXA+jPIkk5J0ZjqeUGgoZhbPyY1odNbDhwnHjuoIBpopg9aFwUDRj/Pvfne9yXzo2mP1uoMLCuta5h7xGvBKm6ATYpT/fsOvRIlP+UBCJ+/wj1eNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pfhq/DRf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pfhq/DRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCBCC2BCB0;
	Fri, 15 May 2026 07:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778831274;
	bh=izNuGR6qE4zq7M8ypskK9BWaIcT/nZhg9aHxbsgjr/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pfhq/DRfGP/PVqA8gNwwlMi5lTugFu8k9OSgBEU6jFruuQrMjyjpwBnCJ1DbAqsjv
	 aic7MxO91HvmWCqQTfU+grKaeYH0bU8O0BlV+WXobTF26vqjkYrexfNoTFdrZ1Q+9N
	 u/wGNymQ8Y1AFBmRdLo616i+19oy3Azoo6Iu0a+sZeTrEbL9/YTwsiTk+vFpXPWr/o
	 LfSaEckJ86G4OvzJc6Ex9++oU97pKS/TxDiGgaUlMEUAzjFGNY7e6jx9qUD64A5juF
	 GRwVTvS9rNgx2wNvjiYgqglAtiX9z4p/w4ZlgqszoKXgiAxQ8LXkMYRnoQ76/g5ddw
	 8n3qAutOws5ng==
Date: Fri, 15 May 2026 07:47:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: drop unnecessary power supply from
 PCIe
Message-ID: <20260515074751-GKB3663945@kernel.org>
References: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
 <20260514005435.484B5C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514005435.484B5C2BCB8@smtp.kernel.org>

Hi

On 00:54 Thu 14 May     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Removing `vpcie3v3-supply` from the PCIe controller node breaks power sequencing because the `spacemit,k1-pcie` driver expects it on the controller node.
> --
> 
> commit ab7558e23a3bb4900f7961804151870f4c1f99fe
> Author: Yixun Lan <dlan@kernel.org>
> 
> riscv: dts: spacemit: drop unnecessary power supply from PCIe
> 
> This commit removes the vpcie3v3-supply property from the PCIe controller
> nodes in the Banana Pi F3 and Milk-V Jupiter device trees. The commit message
> states that the supply belongs to the child port node rather than the Root
> Complex, aligning with the dt-binding documentation.
> 
> Link: https://lore.kernel.org/all/20251113214540.2623070-4-elder@riscstar.com/
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index e20daa50a152f..c70081856606f 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -316,7 +316,6 @@ &pcie1_port {
> >  };
> >  
> >  &pcie1 {
> > -	vpcie3v3-supply = <&pcie_vcc_3v3>;
> 
> Will removing the vpcie3v3-supply property from the controller node break
> power sequencing?
> 
No, I don't think so, the PCIe RC do not require external power supply

> Looking at drivers/pci/controller/dwc/pcie-spacemit-k1.c, the host driver
> calls devm_regulator_get_enable(dev, "vpcie3v3") during k1_pcie_probe().
> 
Right, I think the vpcie3v3 supply should be removed from host driver

> Without this property on the controller node, won't the driver fall back
> to a dummy regulator?
> 
Currently, yes if above code not removed, it will fallback to dummy
regulator if no vpcie3v3-supply specified

> Since the spacemit-k1-pcie driver does not currently integrate with the PCI
> power control framework (by calling pci_pwrctrl_create_devices()), does any
> driver in the kernel actually control the power supply for the child port node?
> 
Yes, the PCIe sub ports node will request the power supply, in 
drivers/pci/pwrctrl/generic.c:119
 slot_pwrctrl_probe() -> of_regulator_buck_get_all()

> While this issue might be masked on the Banana Pi F3 and Milk-V Jupiter
> boards because their vpcie3v3 regulators are defined as regulator-always-on,
> does this change break dynamic power management for the PCIe slots?
> 
> Should the host driver be updated to adopt the pci_pwrctrl framework before
> dropping this property from the device tree?
> 
The host driver already adopt pci_pwrctrl framework

> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org?part=1

-- 
Yixun Lan (dlan)
