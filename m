Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1093B5E10
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964677; cv=none; b=kTO1ABCcFi30oZ+23wPVMc+K8i4VSEQlWCYnnbaN/awR5dqTOxlzpXU0t93PcBcr1Ac1WBQzLNRVY+4zMUUHMJbcrf6cMuDXRSNmV4rPfUFFsy9CcYheE+HapU5fda03X9YvYqnqvrwjyFmW9+jfeOGzOS/TDe6uTiBEdo8BpHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964677; c=relaxed/simple;
	bh=Ez6CJkLRZapDhmqptmdL64vQEJlsrQ27lJYXeQmlBog=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUTA7lLAyIs1gELBFjMRr/I31cRZ65h+EeE9Wc55lWuRtvfpbdL78eHMo+wMtbEDunlJoME9Y7R95D3IitVivEajXdGdfhdlkB1ZbFgwULYZV+4cn9WuBUrXh8E75YpY8DdAr8AN6aSY5KkkYnXTxQII7M/za61Qdg5llvzbRLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=HYdPLwoC; arc=none smtp.client-ip=109.224.244.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HYdPLwoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786964671; x=1787223871;
	bh=Ez6CJkLRZapDhmqptmdL64vQEJlsrQ27lJYXeQmlBog=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HYdPLwoCMpOD+75uRqtJFoYD7Jf/QtQ3fSfwj/H11URk7dCZq6V30uiuZeGYb7QDk
	 hlizkmGCbHJ1ZZ37M2I4ZX4dYhLHdwsXRiKWzcz1HcAtNvbDUz+1XEr6PGhZqs0LhF
	 Z1QRCetKkv1hy2m8YeVBSuD7dE70NUiFQVU3+Izi8NwmlBWs94I9icusjyxtyaOVWQ
	 tAEvtAFLjxTaHXahTHwmqq/1qhefyHBDRvQ9mCGx3jzMqgJC4y7vj01dDGGgGaVzxI
	 e+bVQu7mbmJ4DfeGAJa9/3V9B/rnnqpCG2VTWPSGrb/j1/+/Y49dCIPMaZYvCzKn2M
	 ZT/KFQtMkGy9Q==
Date: Mon, 17 Aug 2026 11:04:25 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy Watch FE
Message-ID: <Aeip4sn1qJXjJcWtTvoE6B3ai2lPSWPhHALK2IIAWAAVKw3N0sRECwlEB_AAfLAwXEs7HzWgH0j2Meo3NoaYjDbDFbUd4eJ8r9Jb4IRmNc8=@protonmail.com>
In-Reply-To: <20260817103500.B4B4E1F000E9@smtp.kernel.org>
References: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org> <20260817-for-next-lucky7-v1-2-42ffb2b71ba2@member.fsf.org> <20260817103500.B4B4E1F000E9@smtp.kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 79ed821e28fff77a00226fd963d9bfa33d4cd91e
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Unaligned `no-map` simple-framebuffer region causes memory attri=
bute aliasing.
> - [Medium] Invalid usage of `reserved-memory` for memory-mapped devices a=
nd regions outside system RAM.
> - [Low] Missing unit address in the `misc-rmem` device tree node.
> - [Low] Mathematical error in memory calculation in commit message and co=
mments.
> --
>
> --- Patch [2]: [PATCH 2/2] arm64: dts: exynos: Add initial support for Sa=
msung Galaxy Watch FE ---
> commit 6f30a8a96fda7068a12749f38925083c1838f92d
> Author: Aiden Isik <aidenisik@member.fsf.org>
>
> arm64: dts: exynos: Add initial support for Samsung Galaxy Watch FE
>
> This commit adds initial device tree support for the Samsung Galaxy Watch=
 FE,
> including bootloader framebuffer and memory definitions.
>
> > Only the lowest 490MiB and highest 512MiB of memory are used for now.
> > The 488MiB between the addresses of 0x9ea00000 and 0xbe680000 is exclud=
ed
>
> [Severity: Low]
> This isn't a bug, but the math in the commit message seems slightly off.
>
> 0xbe680000 - 0x9ea00000 is 0x1fc80000, which is 508.5 MiB, not 488 MiB.

Will fix in v2.

>
> > diff --git a/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts b/arch/ar=
m64/boot/dts/exynos/exynos5515-lucky7.dts
> > index 0000000000000..f91ea7e44cf86
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts
> > @@ -0,0 +1,106 @@
> [ ... ]
> > +=09memory@80000000 {
> > +=09=09/*
> > +=09=09 * Use the lowest 490MiB and highest 512MiB of memory.
> > +=09=09 * The 488MiB between the addresses of 0x9ea00000 and
>
> [Severity: Low]
> This isn't a bug, but similarly to the commit message, the calculated mem=
ory
> size here is 508.5 MiB, not 488 MiB.

Will fix in v2.

>
> > +=09=09 * 0xbe680000 is currently unused due to any memory accesses
> > +=09=09 * in several ranges between those addresses causing the core
> > +=09=09 * performing the accesses to stall.
> > +=09=09 */
> > +=09=09reg =3D <0x0 0x80000000 0x1ea00000>,
> [ ... ]
> > +=09reserved-memory {
> > +=09=09ranges;
> > +=09=09#address-cells =3D <2>;
> > +=09=09#size-cells =3D <1>;
> > +
> > +=09=09framebuffer@9e0cf000 {
> > +=09=09=09reg =3D <0x0 0x9e0cf000 (396 * 396 * 4)>;
> > +=09=09=09no-map;
> > +=09=09};
>
> [Severity: High]
> Does this unaligned size combined with no-map cause memory attribute alia=
sing
> on arm64?
>
> The region has an unaligned size of 0x99240 (627264 bytes). The no-map
> property drops this exact byte range from the kernel's linear map, leavin=
g the
> remainder of the page (0x9e168240-0x9e169000) to be mapped as Normal Cach=
eable
> memory.
>
> When the simple-framebuffer driver calls ioremap_wc(), it maps the entire=
 page
> at 0x9e168000 as Write-Combine (Normal Non-Cacheable), creating an attrib=
ute
> alias.

Possibly an issue? I haven't seen any other Exynos device trees do anything=
 differently so I'll wait for a maintainer to weigh in.

>
> > +
> > +=09=09misc-rmem {
> > +=09=09=09/*
> > +=09=09=09 * Some of these regions belong to memory-mapped
> > +=09=09=09 * devices, and will be assigned to drivers as support
> > +=09=09=09 * is added.
> > +=09=09=09 *
> > +=09=09=09 * Other regions belong to the TrustZone firmware
> > +=09=09=09 * and should never be touched.
> > +=09=09=09 */
> > +=09=09=09reg =3D <0x0 0x87000000 0x200000>,
>
> [Severity: Medium]
> Is it valid to use reserved-memory for memory-mapped devices and regions
> outside system RAM?
>
> The Devicetree specification dictates that reserved-memory regions MUST b=
e
> contained within a defined /memory node. The misc-rmem node includes
> addresses (e.g., 0xa0000000, 0xb0000000) that fall within the
> 0x9ea00000-0xc0000000 range explicitly omitted from the /memory node.
>
> Additionally, since these are MMIO regions, shouldn't they be described a=
s
> device nodes on a bus rather than reserved RAM?
>

These addresses *are* part of RAM. It is just a temporarily disabled region=
.

> [Severity: Low]
> This isn't a bug, but this node is missing the unit address @87000000
> to match the first reg entry, which will generate a unit_address_vs_reg d=
tc
> compiler warning.
>

Will wait for a maintainer to weigh in on this one too, but I'll likely fix=
 it in v2.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next=
-lucky7-v1-0-42ffb2b71ba2@member.fsf.org?part=3D2
>

Kind regards,
- Aiden Isik
