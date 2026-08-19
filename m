Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5181B18E02A
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139155; cv=none; b=DcHLfc74fcPu322PlBpsM6eYEwUICzhqLMbelgAqnu4KvwAaGNGJp2S8978/HAImtJW+tibz0ZKOC+3FP4jq3frHeHZRDdAk3t9G0B3C4VhygM10r6GZJLkXFEcDHaUpnTXkFtMnjyhRIfmetdRh6buBXEch4aHorKkehe8+y5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139155; c=relaxed/simple;
	bh=7kuSuoJJdc3sOBEd27Sm92Ikju28wiXHnOLulfVVU6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MliMntFe8ONABUamHNhzQyAPoOjWi+I70c/oRKJTsbwgP0Vhe8qWw48Zo2DgYvl3rRgnHJkJjdZ5tgaNsAOk5A7PXpznqV+JpLgFAQYEIM1U0VPLAtMNSK7Zt/nTXtJ09EoqwXUFtM9ple4s/vLmpE8stA/Rv4PUMcf6mOluxxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NhI8i8mJ; arc=none smtp.client-ip=91.218.175.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NhI8i8mJ"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=7kuSuoJJdc3sOBEd27Sm92Ikju28wiXHnOLulfVVU6Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787139151; v=1; x=1787743951;
 b=NhI8i8mJ/SDb7qclEaYW+ty5frO+t4SJqHSLLgGhT65YbfxoznbkRr+kf1ayrhOH53Q6doZl
 OKQSeaI3CLKPeFna+aQLCmwjyYQQLIhhrUJg0ZJrOfbCCH2PXpnwvno6dqDOprrbLlXyWw4xpnw
 O/pExrsZMijVWTSb30K13mWY=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from mail-lf1-f48.google.com (209.85.167.48)
	by smtp.migadu.com with ESMTPS id 502f3d6e0741ec4f;
	Wed, 19 Aug 2026 11:32:31 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso7165e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 04:32:30 -0700 (PDT)
X-Gm-Message-State: AOJu0YxZpTEv2z7wN82k7grKUB/9fLwR+ZiwamXcNLHTxNd6ScyJUB/Q
	5NxYBRb3vMDamsweUuB/KYkLCY9A3Iiki+oDTH97W+tcvCxo5i7RkSzdwYjD6+aDbdXnre+MWuj
	RsxAiM0/++xKc3BZij8bbiBnOMf/1r3A9N0e3vM0I
X-Received: by 2002:a05:6512:3ba5:b0:5ae:b918:79d5 with SMTP id
 2adb3069b0e04-5b47889a5e6mr132588e87.2.1787139149438; Wed, 19 Aug 2026
 04:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819102809.310708-1-fuad.tabba@linux.dev> <20260819102809.310708-5-fuad.tabba@linux.dev>
 <20260819103933.C86671F00A3A@smtp.kernel.org>
In-Reply-To: <20260819103933.C86671F00A3A@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 19 Aug 2026 12:31:53 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyiRadkDPLt5--zuHySw6=OCZiT4MX_7AwnM5YAe2MUyA@mail.gmail.com>
X-Gm-Features: AcwNN1UAcvP9sDAr8oUrNxlSM1dVpeAVtWPR-2YrrRRiWzlLHdDZ4SeD65PK180
Message-ID: <CA+EHjTyiRadkDPLt5--zuHySw6=OCZiT4MX_7AwnM5YAe2MUyA@mail.gmail.com>
Subject: Re: [PATCH 4/4] KVM: arm64: selftests: Add ITS table save tests
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Aug 2026 at 11:39, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The guest code writes L1 device table entries using native end=
ianness instead of little-endian, which will cause corrupted data on big-en=
dian guests.

arm64 big-endian has depended on BROKEN since 6.18, and is being
removed [1], so this is fine for a selftest.

> - [Medium] The guest code modifies GITS_BASER immediately after clearing =
GITS_CTLR.Enable without polling for the GITS_CTLR.Quiescent bit.

KVM's emulated ITS permits the GITS_BASER write whenever
GITS_CTLR.Enable is clear, so the poll is not needed here.

/fuad

[1] https://lore.kernel.org/all/20260811140132.22778-1-will@kernel.org/


> --
>
> --- Patch [4]: [PATCH 4/4] KVM: arm64: selftests: Add ITS table save test=
s ---
> commit 277abfaff8f849d670b2c74f45ab3607f657788b
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: selftests: Add ITS table save tests
>
> This commit adds selftests for KVM_DEV_ARM_ITS_SAVE_TABLES to handle two
> cases where a guest leaves a table in a modified state. It covers a
> GITS_BASER write that drops described collections, and an invalidated L2
> block that causes a device to be skipped.
>
> > diff --git a/tools/testing/selftests/kvm/arm64/vgic_its_save.c b/tools/=
testing/selftests/kvm/arm64/vgic_its_save.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
>
> [ ... ]
>
> > +static void guest_shrink_coll_table(void)
> > +{
> > +     unsigned long offset =3D its_baser_offset(GITS_BASER_TYPE_COLLECT=
ION);
> > +     u64 baser;
> > +
> > +     its_set_enable(false);
> > +
> > +     baser =3D readq_relaxed(GITS_BASE_GVA + offset);
>
> [Severity: Medium]
> Is it architecturally valid to read and modify GITS_BASER immediately aft=
er
> clearing GITS_CTLR_ENABLE without first polling for the GITS_CTLR.Quiesce=
nt
> bit?
>
> While KVM's synchronous implementation might tolerate this sequence today=
,
> could this missing poll cause unpredictability on asynchronous hardware o=
r
> future emulators?
>
> > +     baser &=3D ~GITS_BASER_PAGES_MASK;
> > +     writeq_relaxed(baser, GITS_BASE_GVA + offset);
> > +}
>
> [ ... ]
>
> > +/* Turn the already installed device table into an indirect one. */
> > +static void guest_make_device_table_indirect(void)
> > +{
> > +     unsigned long offset =3D its_baser_offset(GITS_BASER_TYPE_DEVICE)=
;
> > +     u64 baser;
> > +
> > +     its_set_enable(false);
> > +
> > +     baser =3D readq_relaxed(GITS_BASE_GVA + offset);
>
> [Severity: Medium]
> Similarly here in guest_make_device_table_indirect(), does this need a
> poll for the Quiescent bit after disabling the ITS and before accessing
> GITS_BASER?
>
> > +     writeq_relaxed(baser | GITS_BASER_INDIRECT, GITS_BASE_GVA + offse=
t);
> > +
> > +     its_set_enable(true);
> > +}
> > +
> > +static void guest_unreachable_device(void)
> > +{
> > +     u64 *l1;
>
> [ ... ]
>
> > +     guest_make_device_table_indirect();
> > +
> > +     /* Both L2 blocks present, so both MAPDs are in range. */
> > +     l1 =3D test_data.device_l1_va;
> > +     l1[0] =3D L1E_VALID_MASK | (test_data.device_l2[0] & L1E_ADDR_MAS=
K);
> > +     l1[1] =3D L1E_VALID_MASK | (test_data.device_l2[1] & L1E_ADDR_MAS=
K);
>
> [Severity: Medium]
> Since the host code later reads this memory using le64toh(), will writing
> these L1 device table entries in native endianness cause data corruption
> when running the selftest on big-endian guests?
>
> Should these entries be converted using cpu_to_le64() before assignment?
>
> > +
> > +     its_send_mapd_cmd(test_data.cmdq_base_va, DEVICE_A_ID,
> > +                       test_data.itt_tables, ITT_MAPD_SIZE, true);
> > +     its_send_mapd_cmd(test_data.cmdq_base_va, DEVICE_B_ID,
> > +                       test_data.itt_tables + ITT_SZ, ITT_MAPD_SIZE, t=
rue);
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819102809.31=
0708-1-fuad.tabba@linux.dev?part=3D4
>
