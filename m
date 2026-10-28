Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193961;
	b=Vk+0h6CdHkisbP2Q1v8BK7JUXTjfEsi1uVmEPPyjzP8E1D1XzNuJ3knYvraEa03FucNz
	 xrxniNDuneApZx6XmWdL28dvluDbndkrU7tHUygW984+SvAWpgXvOnRJLFeNk9lDHsxjj
	 1Ss7d7HQ7oWvwqldoyQYiM1oHO4TMJkAS5hYNFGw5EJpBi2wv+1kmVw//owMW3/xk+VFz
	 XhviCGFUeC13wnawQhUNptQbI/TvQDmiIIF4+lRulDIsOKujj7zpmx9s5aRg95aIF4NmM
	 AzOTzYMUQQMotUaAQw+SqCWGNVBmCdMGbHN3EHY9EkniDelydU0Mab8TDsjC7UydeRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193961;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=tlfo139l9Rt2nBgX8WizNIcclCtcY/yZ2WQFmqA3Bow=;
	b=jpSLUZ1v5hln7DInPUEOznWF0oXjfjIqRp8BljHZ1aQ9x3okowOebHGsRNRqXuTMkxnK
	 jXT21weLb97TFpAWH3ofZ+lImfG2+OHFmfevjFK6lipxmXKPWJYZHvRApetby0ssBWQRn
	 9IpI0ms+dtdndZ6JdQvbjD55RGc1Lak1ARMm5JvHxBSk+wbD8nP4ezKZMK9zfDgGCyqOd
	 uP2PY+qisOWInWxprqW8fchcyBi+PYChIy/8UcUp9/eHEFt9jLtxB65l927S71KYOuXBG
	 CLnfLSZrz2WGPZoC9ywsa3nUBhTgVrWfYhuV4j+7Uz3AsQ4hWpt0ghNGy9nsLjIfNsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dF0hgEbV;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F00606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 13:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dF0hgEbV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793193959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlfo139l9Rt2nBgX8WizNIcclCtcY/yZ2WQFmqA3Bow=;
	b=dF0hgEbV8AhFN2zb2Wu3mgy2nn7MThPE/QEm7G6J4B+RNW93L2MrVJDKf8hvHMehsR9iNA
	I72gvjJy1P6sIU0vzrRFc2un64R0S0nVfZCN0mtSDvU7sJ9pELZhy3zlAWoUvBKzH48wjj
	0QkCAUu3ewEwH5KRgnzCsTN7IiX36uY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-tZZUOH4nNdSFCnZtJDejpw-1; Wed, 28 Oct 2026 09:25:57 -0400
X-MC-Unique: tZZUOH4nNdSFCnZtJDejpw-1
X-Mimecast-MFC-AGG-ID: tZZUOH4nNdSFCnZtJDejpw_1793193957
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99082f450bfso780653241.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 06:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193957; x=1793798757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlfo139l9Rt2nBgX8WizNIcclCtcY/yZ2WQFmqA3Bow=;
        b=LEE6Uqdqb4db8SOvGWT4laX3lJQqT2g1NNOWKfZKmmenKIeCWXKQvtBOob/4ReSP7/
         I1p55eF0vxJixyd0xPXnh9JiiR04lgSm8dj/e0LuaQx1I94mxTH6F+QpsKs4PrXgVlCF
         1TUvIVe7e7N79saAglS8msFUBWuCZs6ZptrjIqawUXT8vMXLxY8/Fni/USYrVAOKajg5
         4Uou+2OVj8bH6lLQgJv1QW+yBuIgoT7heuwcVBKSNBbDejHdac9Kn9u2oFlDeoSgQvLz
         vq7r/3bGcgNa8kAaMpue1bdPIFiwCFb/z7JFedYQb6OjSE61Y5bQpMoOdY38OaN5d32R
         nfzw==
X-Gm-Message-State: AFq9FYLRMW/247HJScKJwzNyg1wTfe3yHd/utr9I9B/Ydbf60Yhc2PNJ
	5aFEefccmytHUwrzlLKsS/Cqp3x0VTtlKk7zgaY5IRdxlpPsEtqQHQNSOY3Aemx0xbIkLYYYLTi
	xmNNf3AwtYXuilSLLB+A1snGKMPJwKEQdUeidriUsRregZ3iiYo48dZtqk0cGI1GZULJaf1EiWx
	J6Fu40YRYDGsSwB4Sy2oxHMP6AIbH3vRNeqH4g/Owkh9mEr9TsZy5qQO4=
X-Gm-Gg: AYBFou2GmUSYuek1Nhbg0m9GAR3ZRh4X75mawwGQz29o/fO9hwoX7mrmPUBR4/kn2Nj
	Y1O2JDkHpkEq/ua7UHygr9C/cF4CK6sGqPztPg1W8yj0+JFxUbsOLdZhiaixJDXZ0RvDMib6pYc
	zIXwAgBos9+MHjY4clB3VcoMonH+MqK5tGnAFcpCoq+9YLoDxA1sthKTmd/bAr657n3Gn1bJnG8
	vRxqVV25EK+1dYr1A==
X-Received: by 2002:a05:6102:370e:b0:7c3:881f:b775 with SMTP id ada2fe7eead31-7d03a52b5bfmr973845137.24.1793193957104;
        Wed, 28 Oct 2026 06:25:57 -0700 (PDT)
X-Received: by 2002:a05:6102:370e:b0:7c3:881f:b775 with SMTP id
 ada2fe7eead31-7d03a52b5bfmr973836137.24.1793193956565; Wed, 28 Oct 2026
 06:25:56 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028124328.597603-1-tvignaud@redhat.com> <sashiko-outbox-187886@kernel.org>
In-Reply-To: <sashiko-outbox-187886@kernel.org>
From: Thierry Vignaud <tvignaud@redhat.com>
Date: Wed, 28 Oct 2026 14:25:44 +0100
X-Gm-Features: AclHuK8LsLqbfPmBZ2pOrZsCXcU2SBtbZa9moKq_kUk7jaKZzWyvHeARHRw0soE
Message-ID: <CAHSMvrFXEnsLKF_BSYWz=V=ht6++RocuHJO0tkhUmPcHHvXp5A@mail.gmail.com>
Subject: Re: [PATCH] ata: libata-core: Add NOLPM quirk for PNY 1TB SATA SSD
To: sashiko-reviews@lists.linux.dev
Cc: linux-ide@vger.kernel.org, dlemoal@kernel.org, cassel@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fQOoRYULf3KkNz_lTkk4kQNjrC8WPeCBRMkPPESfvcc_1793193957
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 1:59=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] ata: libata-core: overly broad 1.5Gbps and NONCQ quirks for PNY =
1TB SATA SSD
> --
>
> commit 0d9a8ef67d5864f02d54ceedd7d99487c051f554
> Author: Thierry Vignaud <tvignaud@redhat.com>
>
> ata: libata-core: Add NOLPM quirk for PNY 1TB SATA SSD
>
> This commit adds an entry to __ata_dev_quirks[] for the "PNY 1TB SATA SSD=
"
> drive with ATA_QUIRK_NOLPM, ATA_QUIRK_1_5_GBPS, and ATA_QUIRK_NONCQ acros=
s
> all firmware revisions.
>
> > diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
> > index dadcaf9ff4622..cf36f2638fab3 100644
> > --- a/drivers/ata/libata-core.c
> > +++ b/drivers/ata/libata-core.c
> > @@ -4398,6 +4398,11 @@ static const struct ata_dev_quirks_entry __ata_d=
ev_quirks[] =3D {
> >       /* PNY CS900 (Phison PS3111-S11, DRAM-less) drops the link on DIP=
M */
> >       { "PNY CS900 1TB SSD",          NULL,   ATA_QUIRK_NOLPM },
> >
> > +     /* PNY CS900 (variant) drops the link on DIPM and NCQ */
> > +     { "PNY 1TB SATA SSD",           NULL,   ATA_QUIRK_NOLPM |
> > +                                             ATA_QUIRK_1_5_GBPS |
> > +                                             ATA_QUIRK_NONCQ },
>
> [Severity: High]
> Could applying ATA_QUIRK_1_5_GBPS and ATA_QUIRK_NONCQ across all firmware
> revisions (NULL) of "PNY 1TB SATA SSD" cause a severe performance regress=
ion
> for other users of this drive?
>
> During ata_dev_configure() -> ata_dev_quirks(), every "PNY 1TB SATA SSD" =
will
> match this entry regardless of firmware revision. In ata_do_link_spd_quir=
k(),
> ATA_QUIRK_1_5_GBPS clamps the physical SATA link speed limit to 1.5 Gbps:
>
> drivers/ata/libata-core.c:ata_do_link_spd_quirk() {
>         if (dev->quirks & ATA_QUIRK_1_5_GBPS)
>                 target =3D 1;
>         else
>                 return 0;
>
>         target_limit =3D (1 << target) - 1;
>
>         /* if already on stricter limit, no need to push further */
>         if (plink->sata_spd_limit <=3D target_limit)
>                 return 0;
>
>         plink->sata_spd_limit =3D target_limit;
> }
>
> Unlike ATA_QUIRK_NOLPM and ATA_QUIRK_NONCQ, force_tbl[] has no on/off ent=
ry
> for ATA_QUIRK_1_5_GBPS, so users with working drives cannot override this
> 1.5 Gbps cap via libata.force. Meanwhile, ata_dev_config_ncq() also disab=
les
> NCQ completely when ATA_QUIRK_NONCQ is set.
>
> Additionally, the commit title and opening description state:
>
>   For a year, I workaround it by disabling NCQ & reducing the speed by
>   booting with "libata.force=3D0:3.0Gbps,0:noncq".
>   It turns out disabling LPM fixes it without the huge performance hit.
>
> while the embedded "v2:" changelog notes and the code itself instead drop=
 the
> speed to 1.5 Gbps, disable NCQ, and remove the firmware revision filter, =
and
> the code comment above the entry does not mention the 1.5 Gbps limit.
>
> Note also that in ata_port_alloc(), port IDs (ap->print_id) are allocated
> starting at 1:
>
> drivers/ata/libata-core.c:ata_port_alloc() {
>         id =3D ida_alloc_min(&ata_ida, 1, GFP_KERNEL);
>         if (id < 0) {
>                 kfree(ap);
>                 return NULL;
>         }
>         ap->print_id =3D id;
> }
>
> Because port numbering starts at 1, "libata.force=3D0:3.0Gbps,0:noncq" ne=
ver
> matched any port in ata_force_link_limits() or ata_force_quirks(), which =
matches
> the commit message logs on sda still showing queued commands (tag#2 throu=
gh
> tag#9).

I actually used the prefix "1:" eg :
ao=C3=BBt 01 09:17:31 localhost kernel: Command line:
BOOT_IMAGE=3D/boot/vmlinuz-7.0.1-desktop-1.mainline.mga10
root=3DUUID=3D95a19996-436f-4ce1-9779-26b13c319972 ro splash quiet noiswmd
resume=3DUUID=3D18acfa47-8d6c-46f4-9700-5c9506931817 audit=3D0
libata.force=3D1:3.0Gbps,1:noncq

I mistakely changed it to ":0" a cople weeks ago, which showed again
the issues, which is why I worked on this patch:
oct. 23 10:05:59 localhost kernel: Command line:
BOOT_IMAGE=3D/boot/vmlinuz-7.3.0-desktop-1.mainline.mga11
root=3DUUID=3D95a19996-436f-4ce1-9779-26b13c319972 ro splash quiet noiswmd
resume=3DUUID=3D18acfa47-8d6c-46f4-9700-5c9506931817 audit=3D0
libata.force=3D0:3.0Gbps,0:noncq,0:nolpm

I used the 1.5Gbps quirk in the patch b/c there's no 3.0Gbps in drivers/ata
I could add such a quirk now that there's 64 bits for quirks but
honestly that shouldn't impact much this low end SSD.

> If a specific drive requires 1.5 Gbps, no NCQ, and no LPM simultaneously =
to
> avoid link timeouts, could that indicate a local cable, controller, or ha=
rdware
> unit issue rather than a quirk that should be applied unconditionally to =
all
> "PNY 1TB SATA SSD" drives and firmware revisions?

I'm not the first one to reports issues with that SSD, see eg:
https://forums.linuxmint.com/viewtopic.php?t=3D424548
https://www.truenas.com/community/threads/help-zfs-continue-failing-with-po=
ol-i-o-failures.110424/
=3D> https://web.archive.org/web/20260319124414/https://www.truenas.com/com=
munity/threads/help-zfs-continue-failing-with-pool-i-o-failures.110424/

So PNY CS900 looks buggy across all sizes, at least under Linux.
So actually my patch won't cover all affected CS900 b/c it only covers
the "1Gb" model.
I can add the firmware revision to the quirk if you insist though.

