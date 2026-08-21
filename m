Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2839023F
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 07:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298749; cv=none; b=SLYYk6A7Yezcm3njhqAnC5IdLzZ8kEzqf5hMwKKV0XdBl2H2nr3/BMKotk7Nkk8CBcuFZUR+RgvIXPqXbUrQ21rfdJPuVA9hT1Tl9mJHPJwCWFxynd/BtzghYNzPuAzJJ4cJOa5WrvdbxPIl8oPZjqXq9jCwFXezVP8BmgYym0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298749; c=relaxed/simple;
	bh=ZPQouUKwxJF5orocHpl/jnc7cYKNfd3PZ/Xqx3fCIQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwVjxxmkjNIudLhBLc5q9PXNit23EN7rKP78GpbdsmLZvOLAbuKC9DFHoG5z7EtLor01aNVgcSaisCWF4su6PBAimlV30CkUjC7ebSJ1+1Ofk5JExk3u0z4QUjXRk9ji69PJIZppZv1vLpzMwsefEMp4gYPS/eFSlsf23DlBWPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ua7J29sy; arc=none smtp.client-ip=91.218.175.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ua7J29sy"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ZPQouUKwxJF5orocHpl/jnc7cYKNfd3PZ/Xqx3fCIQ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787298744; v=1; x=1787903544;
 b=ua7J29syiP8SslkeiA/VsmoQ1xiqG/paQyBx6vW8Dbfos3j72k8XnM6ygyz00TJ9jbRwsiS7
 xCn4nmM3EBS3CfcI9VGt2y/cl0aogpmbee5p82IUg36F4PT92Ce/ayrVBxp6YfZ4F0Q0YgiL1Xf
 UPMw3aUVYh9+O8m1bad+HO1E=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from mail-lf1-f44.google.com (209.85.167.44)
	by smtp.migadu.com with ESMTPS id b913a3cab014a1ab;
	Fri, 21 Aug 2026 07:52:24 +0000
X-Mizu-Trace-ID: b913a3cab014a1ab
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2a8173142so3433e87.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 00:52:19 -0700 (PDT)
X-Gm-Message-State: AFuF++mfG6Mwon/SX1iWCDkyhH2eak52I+g5heMq42zl4kEMiiheqw5J
	SomPzS34oosEO8SxwNUGpbwmd9CBC+3GerDT69yxxe0De6waQ25hspQ6VjonOo3iv/yaQ5X1s2h
	kMhocBgzZ/KlAEgGl1H1BMR0hMXzWfGbZ6d4mODw2
X-Received: by 2002:a05:6512:ba3:b0:5b2:8963:e5d4 with SMTP id
 2adb3069b0e04-5b484abe418mr134870e87.5.1787298739042; Fri, 21 Aug 2026
 00:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821064445.615838-1-fuad.tabba@linux.dev> <20260821064445.615838-5-fuad.tabba@linux.dev>
 <20260821070039.120B51F000E9@smtp.kernel.org>
In-Reply-To: <20260821070039.120B51F000E9@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 21 Aug 2026 08:51:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy-wCp=QPnoH8dxwm5H+vfVC+Y-gjBPm5AOWMwh8Y05RA@mail.gmail.com>
X-Gm-Features: AcwNN1Xbv8e0NthIb3Vxafry6St73eMHFmn6L28IW3_oO47ySmswbhNysUgzJdY
Message-ID: <CA+EHjTy-wCp=QPnoH8dxwm5H+vfVC+Y-gjBPm5AOWMwh8Y05RA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: selftests: Add ITS table save tests
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Aug 2026 at 08:00, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Unsafe DMA Buffer Configuration (ITT Size Miscalculation)

The oversized scan stays inside the memory the test allocated for the
two ITTs, and both cases pass. If the series needs a respin I'll tidy
this up, but I won't respin just for this.

> - [Medium] Incorrect Endianness Conversion for L1 Device Table

CPU_BIG_ENDIAN depends on BROKEN on arm64, being deprecated [1]

/fuad

[1] https://lore.kernel.org/all/20260811140132.22778-1-will@kernel.org/

> --
>
> --- Patch [4]: [PATCH v2 4/4] KVM: arm64: selftests: Add ITS table save t=
ests ---
> commit 00c3ff8ee303e906c6d0f346f17949dbb0abf5fc
> Author: Fuad Tabba <fuad.tabba@linux.dev>
> Subject: KVM: arm64: selftests: Add ITS table save tests
>
> This commit adds selftests for KVM_DEV_ARM_ITS_SAVE_TABLES to cover cases
> where a guest alters tables. It tests handling of a GITS_BASER<coll> writ=
e
> that changes the table, and a device whose L2 block the guest invalidated=
.
> Each case is then reset and restored to verify the save functionality.
>
> > diff --git a/tools/testing/selftests/kvm/arm64/vgic_its_save.c b/tools/=
testing/selftests/kvm/arm64/vgic_its_save.c
> > new file mode 100644
> > index 0000000000000..864da01539f3f
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
> > @@ -0,0 +1,441 @@
> [ ... ]
> > +/*
> > + * its_send_mapd_cmd() encodes ilog2(itt_size) - 1 as num_eventid_bits=
, and
> > + * vgic_its_restore_itt() scans BIT_ULL(num_eventid_bits) * ESZ, so th=
e size
> > + * handed to MAPD has to match the ITT allocated for it.
> > + */
> > +#define ITT_EVENTID_BITS     13
> > +#define ITT_MAPD_SIZE                BIT_ULL(ITT_EVENTID_BITS + 1)
>
> [Severity: Medium]
> Does this calculation configure the hardware with an ITT size of 128KB in=
stead
> of the intended 64KB?
>
> The test calculates ITT_MAPD_SIZE as BIT_ULL(ITT_EVENTID_BITS + 1) (evalu=
ating
> to 16,384) to compensate for its_send_mapd_cmd() subtracting 1. However, =
KVM's
> its_cmd_get_size() adds 1 back, resulting in 14 bits of event IDs.
>
> During restore, KVM computes the scan size as BIT_ULL(14) * 8 =3D 128KB, =
causing
> it to read 64KB past the end of the allocated ITT memory.
>
> > +#define ITT_SZ                       (BIT_ULL(ITT_EVENTID_BITS) * ESZ)
> [ ... ]
> > +static void guest_unreachable_device(void)
> > +{
> > +     u64 *l1;
> [ ... ]
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
> Will this fail on big-endian hosts? The L1 entries are being populated us=
ing
> native CPU endianness.
>
> Since the ARM GICv3 ITS architecture and KVM emulator require these table=
s to
> be little-endian (using le64_to_cpu on read), shouldn't these use htole64=
()
> when writing them?
>
> > +
> > +     its_send_mapd_cmd(test_data.cmdq_base_va, DEVICE_A_ID,
> > +                       test_data.itt_tables, ITT_MAPD_SIZE, true);
> > +     its_send_mapd_cmd(test_data.cmdq_base_va, DEVICE_B_ID,
> > +                       test_data.itt_tables + ITT_SZ, ITT_MAPD_SIZE, t=
rue);
>
> [Severity: Medium]
> This isn't a separate bug, but as a result of the ITT_MAPD_SIZE miscalcul=
ation
> above, doesn't this send MAPD commands configuring overlapping, out-of-bo=
unds
> ITT tables for the two devices?
>
> > +
> > +     /*
> > +      * Drop the block holding device B. No ITS command and no GITS_BA=
SER
> > +      * write is involved, so nothing tells KVM the device is now
> > +      * unreachable.
> > +      */
> > +     l1[1] =3D 0;
> > +
> > +     GUEST_DONE();
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821064445.61=
5838-1-fuad.tabba@linux.dev?part=3D4
