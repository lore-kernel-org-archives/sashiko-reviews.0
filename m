Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C161F94F
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 22:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783117094; cv=pass; b=nPOsLGNhAGJucwovLOadpFma6uCZemuqPmZPtHuzUFp2So9q6UlP+9E23ubbtwJ4rAdBIx/ZJyme3Geb2iN00juN6bNMPsFSDtIDxoJOjQV3e9yTiKmQrRZSc7PD6enC+MUEsklmJeBqAC2o+D3xYJXFwipfB/p5gRAQZ3Z0MFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783117094; c=relaxed/simple;
	bh=mjwuQ3N0OVI+o56jIG+twM3faktMneyLA7TDmjbcSuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyqecrEu9jA8d/zG1qkr+2doohPzixv7gsDU4nnnkk2r143By4a2slCbfoPY85NvozGqhhnnrgsC9MxST67P7BAU5+BqWyJxVE1cN/Wq3pSMYH1anTcnRbQ6LzIfAYpwaZ/XEn2BGJW3YhmDl88AHM3qQyA6E6JZvdy2iX6KBkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYCIu/ho; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYCIu/ho"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so1363354a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 15:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783117091; cv=none;
        d=google.com; s=arc-20260327;
        b=do5UkNsHMuKAsAL7aFHCeSgCQTtvtue0OqLLPTbGtb7P1liYdAiN60ghqNSXi4gEf6
         Rf6NPFP9qUWu79J3oVFECvYnSCLcB9e4ytcqlFHy8fTlP8eELgGfcaJ61S0B3b+8Z1wl
         9T0pnuOUBhtM1Dk44cA2prWdDCGBsp8CDP3YsquXdJDQRX70PYIIN5IDp8Z0N3O7Ezqh
         sf6W3x5sUo4LcIIlcShqyUN4iZBDvV5dkSnP5SJl3lxmu9KhbUuIc+V2ZN5N8GmYPsxG
         kCiiX3ZphfMHK4XPF9E9tnx4CCpcr9W44HFt9nJyW4Foki5dW+RhWNFf/tVphmbe44PQ
         kPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+xHnip0cuaNSCAQMubL1LiIso9IuG6Ch3oOSD+V/3cA=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=MBp4ymN1lhpGQ2kpY4kaGq/tNednzRIGMxOrXy5E9pEO2gt7Zd2nPYn4Witg2ZQ6Tf
         pZwDDXfOlEs4SjeCjtgLZl0T22FVdoCLtxfleI/c0NMylAmWNcnmgQYfP9JL6gtt5NjR
         6iw2nFY7ww9n9Hnb2w9vFl0BtlNdmRhXVoA+LgLoCODnkwKG1L5DpVn9/xSTYT8mKgNo
         L8jQN81u/ywqgsagvamtkvJJ5m2vDKkTIsDAtiqOEzCHUUk2rxnzlHORJ4Xd2eH7Ita0
         3JhnKCktVOwc3dZdb7Q8bDFLz7k6d5j8tKHoADjBIid90MaL0ckY26y5d10jPQP5zh+a
         BtfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783117091; x=1783721891; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xHnip0cuaNSCAQMubL1LiIso9IuG6Ch3oOSD+V/3cA=;
        b=MYCIu/hoRAyCX2vHxjVV9M/LT/RMcaE3N/fNc2QlHVl0O4qdHM9sKGAaYL/wL2uN6+
         3J//VD7FmkDrN+Kuy8U5lNfGmgUuMGHT+43umNtR6PtYrCkZsomwEdQvfykWhpPZ8FPP
         WuKpzWIJ9QZIp8eMcv/SXDgNYsyVDW1SWpSpAI5ABqj5wlhRx707lf/GZjbwC+KwdH07
         8TgnYygrf0aa9tB8k7jtI/gX7/D4SzKmPYqx1XCy3dz7rLhO9pEoA+ohOiLUpREWgRi2
         pfm4pJWlAWpuq4sQOeL41FroVZB5+oJRH0JTG3hxK4BIBYVqvMCfKDrDVuxJOvSGK2JM
         PlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783117091; x=1783721891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xHnip0cuaNSCAQMubL1LiIso9IuG6Ch3oOSD+V/3cA=;
        b=JOjIf7M1PDzniM1APV9DWZGhA5/HBer8PqgxO3iQB+dJksuIP/GuEUgEg2H++m4kIg
         7b9zCaXloXlBW/ywFjShXIJzZE06DuveGnM34N1uo0qx/cI67YuSCvO54488hMZ1lqa8
         g7A0HFwGFdXjO9wrhKACSSJsnUaX8t0tSWfU/HKjw9ZkLVQS4uplzGt4SkZfcHn/hf7h
         +hFdQq4yMtQfBr2nBCeMKTQP/zxqa0lrcc8tuYDHpuDX6kVGxn+gyYH+X2kcIxvghC4e
         5SeUzFgcQQ8kh7YH6GgzyBRPNEFHwB5ymIMclW7bQ+e0SX9dS9RR+cuAa7iM2NF3RebA
         3pow==
X-Gm-Message-State: AOJu0Yx/JzWFbLB3JEAqLoUYkkPt+t/pWoy1NXhcDBSFDuXjmkb5yZzU
	HNGnOBnRZ4QFwx9FqEIy9u7hU28mhbBaQktnhs9ZR5yTAU94+e89CG/gVuIO2TaOJjiva+c8fUX
	JQci4j/L/lGiZLWQgKLjmKWrgJijfFOOfeuYd
X-Gm-Gg: AfdE7cm93P0DYf0e1kV78UVKeT/xflrRdwt6kJwyIl0zbMfmxUnvKZ3usykzWoWE9HS
	sXsJWjjVEXKs1fTvsoVZ3wKRROyOD76XiFvj8VutxkIN5QmL2vouG1VmXG1IEpT3HfBwf5AmklW
	pEz9bQysIk2EUnY6Gu6k3u1ClUvURRb+4X/80Rd2CBG7Z75VO88k6HWy6vhviAqO5cL52ae7/6z
	8dV+5pfIfK3gujEIJNGPhy0bpQzmLM7IZ2yjO9bkpuzK/ofQOvKA+VIOnqnDnsyVYyebAueEKMZ
	c22gsMzehZwPcOK8yZc5ne9PJG4RMaV/dWJzjf1EXzSaNP9AWt6AF/xQBVZRU1DrLXflPW6CyS7
	5tAhUB7pVgdTC8cG0kK8aIiEIOB0=
X-Received: by 2002:a05:6402:4014:b0:697:e8d9:6bcd with SMTP id
 4fb4d7f45d1cf-69a1a3ad585mr390450a12.28.1783117091262; Fri, 03 Jul 2026
 15:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628231156.1254012-1-rosenp@gmail.com> <20260628232714.BD9581F000E9@smtp.kernel.org>
In-Reply-To: <20260628232714.BD9581F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 3 Jul 2026 15:17:59 -0700
X-Gm-Features: AVVi8CevX4VTz70uK7iuU8f26JnXOHvs7xu2YZvdFO5ofn9wxQlXZIu9UGROBOA
Message-ID: <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 4:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Removing the PCI memory ranges from the parent `axi@18000000` bu=
s breaks outbound PCIe memory mapping because the child `pcie` nodes can no=
 longer translate their addresses to CPU physical addresses.
> --
>
> commit 4f061464281d4964ce46dab60d36a09328f14862
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
>
> This commit removes extra AXI bus ranges that overlap with DRAM on
> BCM5301X/BCM470X SoCs. The intention is to restore the original
> single-entry mapping and fix PCIe routing issues.
>
> > diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts=
/broadcom/bcm-ns.dtsi
> > index 392a257136696..a1062245e5a01 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> > +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> > @@ -95,10 +95,7 @@ L2: cache-controller@22000 {
> >       axi@18000000 {
> >               compatible =3D "brcm,bus-axi";
> >               reg =3D <0x18000000 0x1000>;
> > -             ranges =3D <0x00000000 0x18000000 0x00100000>,
> > -                      <0x08000000 0x08000000 0x08000000>,
> > -                      <0x20000000 0x20000000 0x08000000>,
> > -                      <0x28000000 0x28000000 0x08000000>;
> > +             ranges =3D <0x00000000 0x18000000 0x00100000>;
>
> [Severity: High]
> Does removing these PCI memory ranges from the parent axi@18000000 bus br=
eak
> outbound PCIe memory mapping?
>
> During system boot, when the PCI core calls
> devm_of_pci_get_host_bridge_resources() to parse the pcie child node's ra=
nges
> property, it translates the PCI memory addresses to CPU physical addresse=
s using
> of_translate_address().
>
> Since the pcie nodes are children of the axi@18000000 bus, the translatio=
n
> must pass through the parent's ranges property. Without the mappings for
> 0x08000000, 0x20000000, and 0x28000000, the translation fails.
>
> This would cause the PCI core to drop these memory windows, resulting in
> pci_assign_unassigned_root_bus_resources() failing to allocate memory BAR=
s,
> and endpoint drivers failing at pci_enable_device_mem().
Different AI says:

The review's analysis is wrong because it assumes PCI MMIO windows at
these addresses must translate successfully to be usable. Here's why
the commit actually fixes things:
The problem was that the translation succeeded.
On BCM5301X, 0x08000000, 0x20000000, and 0x28000000 are DRAM
addresses, not PCIe MMIO space. The old AXI bus ranges created 1:1
mappings for these addresses, so of_translate_address() returned them
as-is. The PCI core registered valid-looking resources pointing at
DRAM =E2=80=94 MMIO accesses went to memory instead of the PCI bus, corrupt=
ing
data.
With need_ob_cfg =3D false (no brcm,pcie-ob in bcm-ns.dtsi),
iproc_pcie_map_ranges() is never called. The bootloader has already
configured the PCIe controller's outbound windows correctly. By
removing the extra AXI bus ranges, of_translate_address() fails, those
bogus resources are skipped (the OF_BAD_ADDR check at
drivers/pci/of.c:377), and the kernel stops registering DRAM addresses
as PCI MMIO windows. The hardware continues working with its
pre-configured outbound windows.
So the review's objection at https://lore.kernel.org/all/... is
incorrect =E2=80=94 the translation was producing wrong resources, and the =
fix
is to stop producing them.
>
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628231156.12=
54012-1-rosenp@gmail.com?part=3D1
