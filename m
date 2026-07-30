Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930723AD539
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 22:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785449562; cv=pass; b=TI2zax248aXAphSwT9QDLJKMA5WTOrel0h+l/qMl8HpLkOKxY9vMJzaCbxKOZr4St6ohaaxDHDnLymplV/izFhQ/ttP/3Dcg8FN3ic7ObflSUnK6Y9BLeV1a05J20htihBjXQOKMboiU4O8h9klvhhBhr5hVV74fr5f9fNIp59Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785449562; c=relaxed/simple;
	bh=wjlGwHmokdNiyJnYF+/+JleV0THfo9QsGxp+bI0tazQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q15CFi4eJNjeMP9T8NGHLxDKHrG9YFrQ1ruPmrWgIvODZsHrPMA4yqJLNragh//T4Am/DACaKO2yKeaPJzA8ZMSMsl4H7a4ck0t/Bg96O+ctUkKvcRSMu6e2JowESeocNS4RgEwm/IiOQROlV/0O5DNS0+39H8FhXUT49A4St/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mqq9r/EN; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mqq9r/EN"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a8173142so1296e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 15:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785449559; cv=none;
        d=google.com; s=arc-20260327;
        b=CTG67LF5d/4NfiT9caKZW1eeTDR/7b+djKL/pQum5d42PY++pEF2UXDoOe3yAFpC87
         kZV//dSXZSeXiBCxbv45fzJNLUFNsCdVCCxJcGQK+WdEL/c0wIPbZ3yK6sclJs7qqZvY
         OBWP38CycGIhxPLR3XKurX4pLXi0RprryuU2/3b5fljAmLk0i3fV1nba86W/zjEodoJM
         ehGvR7vcG5djYyV9U8fJd0GVY+azCFnafyFVLcEfJcs/tuFX93ys5hXgyjF/e3tfHgOj
         cLmA9RL9glxyxjxti4D3obRErItpnGUoBgevA+6aTgLBGLW2Z/Og/tWsvfiN9Jjen4xc
         GK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+aYsrEoLB8meyk6x4RqHKI0F2zpIBkilrTUObaO4PaI=;
        fh=OeLK2WmB9X8YVNLXJR1Fo0INXvbE2/nAs+Dupe9P2v4=;
        b=PQ43tZae1YGHHhfLFszF3U1V0iycuwVPeCawGA9YPaHxXCBzmfZQfN2sKlXdMklUAI
         yHN9tiwCxmc9OWg9t4mSYDnHfBAXyD7/CDHzQQEU3QHcixErqPJ+wsARvbibiLjnSJfR
         MWZdqyK1jX2knNNLhq7Zns81NtkDHq15FcPFHEbsi8FCu3Ev/bJK+JmDh+EOaLkKGmPB
         D6RKC+CXtJEDWI2eG1PDFRu/uVoUT062ZMnHe/tq6SbRO8MhWHsEsGO2R0+aNn92pTW1
         9rUAv1gzj0awcZW00aJxUGrr9et6Qj3MalDZm/x9bNETUV373j8P7gnjJIrtLR7FtH0n
         I9lw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785449559; x=1786054359; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+aYsrEoLB8meyk6x4RqHKI0F2zpIBkilrTUObaO4PaI=;
        b=Mqq9r/ENiS3QnIfvqAtIGZ/EeVIcAHujjlEPMffn7FIvha1rC+nV8NPazeoiTHW8vQ
         cGY1IIj50HLsUy9sRF2nvF1b4/UWlp5JGaP3bbJxphbezZ/IjBGQkjWiCNpnw3gBOiXC
         faheAAxTZRS3f+KwC1/QgJOSHAVLDXeHBs3vwE3DrJCV65oWnWaT2Bl5upgTb+xfol6C
         zMAxj4K6IKpv1kRrbdUU1AZHQw8UJtt2LluLHfAUQnl5+c2mb0tWJUFmaqOIDDvFACpX
         zP9dwJr3d7KAfb34GDwTKxp+yDZsptVtcw0acK0aQuYncPPfEv8qLn6qdC27O8MVjibm
         bwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785449559; x=1786054359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aYsrEoLB8meyk6x4RqHKI0F2zpIBkilrTUObaO4PaI=;
        b=q0pnxK3k9lAYu3m6L/ay+0PINvr6JqCfhd5mDh8oK3hcMIwjFmewBmjAwAosDEYqIO
         B6/nFdG/uldSf6vlQnu8XxtCTrvKzySUNFA4l3QUVAh+0Rakc/bEDS0JpgZqnkL5zzn3
         aUP+oefdUJ2TxgYCLuoVxYDvdiiC7vDnlUfX1CQfpGJ8IYBUGLqyH9ccuXyoNXIvgOuM
         gOfR9TG0WH9KvocbNke1rQ4z6GYSD5LrDoO7yF+MSxOFHzs40BKgKXWxN+CTls5ZQpxF
         H+krEoJNhxLyWWsQA+0cGym0ZhL2W+ARkNxu4ba+pMEQHtJIHbDTJ/8lBVSYBgl+CZOh
         3qzw==
X-Gm-Message-State: AOJu0Yx/bd7UAF03z4T93PJgl7NJtH7mDB870XiwSvNIUhM/HYKubXu5
	q3r4zQyutdIysCGOcdGU8wXPvcVFqNtGawHf3YUjAxigwmQtNwqI7gKwM84biMQ28fZlcsgiUVq
	cnso7+zHAjjC2yDmT30Y0KZJI9rvx7WEdiLjcZLO0szTyNg9abLy3xq771w==
X-Gm-Gg: AR+sD12cIWK2Di2igmDYW80nMhQU38NJBsGoMQj6Irq/LxSRQ3W3byxTXXwTiB1eQwV
	qGbfmI1zM6dOeWWNjRsGP6scAl80b1aXVC2YxnBFDZSPeA4c9FNx+e3Etn9liW7NzRlSTCqYBD+
	G4ghorX61/ozFV+jssdj3EOXK2KSr1Yk/WYt2UXNy7K2h1dv75A9Jq2CbDlXoNjYeMylgzmxtnU
	yilz5fBVpFCblFXwI1GScpeaevyNV26L7RtV8noyxqj86eiYskDXpP/jcaNJdiUOaUYygaL7MfX
	KXo5e5jMFk31GC1UY4DkRw0foEGHZB/EDl25LbXRzKenP3BKWLLOlfOS20NUFDwZQ6d77LBJ9GN
	79L3AL9fb2Q==
X-Received: by 2002:a05:6512:2315:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b2e04e37cemr77732e87.4.1785449558007; Thu, 30 Jul 2026
 15:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729-igb_v3_b4-v8-0-3ed236272b4e@google.com>
 <20260729-igb_v3_b4-v8-1-3ed236272b4e@google.com> <20260729224554.0C22C1F000E9@smtp.kernel.org>
In-Reply-To: <20260729224554.0C22C1F000E9@smtp.kernel.org>
From: Josh Hilke <jrhilke@google.com>
Date: Thu, 30 Jul 2026 15:12:26 -0700
X-Gm-Features: AUfX_mwFk5P9vejJ7nQfROr8g87JhPiOdle1tOwll7WR3p1mhB29QQopY5aO9MY
Message-ID: <CAAdrzjszCRNf3kkBgSLow-RrsG9whxFMS4SN1ATzGc7wKJjmoA@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] vfio: selftests: igb: Add driver for Intel 82576 device
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Alex Williamson <alex.williamson@nvidia.com>, Alex Williamson <alex@shazbot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] Hardware Testing Failure / Invalid Loopback Configuration
> - [Medium] Hardware Configuration / Frame Padding failure for short packe=
ts
> - [Low] Misleading comment about interrupt delivery during memcpy
> --
>
> --- Patch [1]: [PATCH v8 1/6] vfio: selftests: igb: Add driver for Intel =
82576 device ---
> commit e83f78e00ae490d2604290c3e38f2458c48dd9d4
> Author: Josh Hilke <jrhilke@google.com>
>
> vfio: selftests: igb: Add driver for Intel 82576 device
>
> This commit adds a VFIO selftest driver for the Intel 82576 Gigabit Ether=
net
> controller. It uses advanced descriptors and programs MSI-X routing to te=
st
> DMA loopback via QEMU's igb emulation and physical hardware.
>
> > diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools=
/testing/selftests/vfio/lib/drivers/igb/igb.c
> > new file mode 100644
> > index 0000000000000..6fc6e7c0e7235
> > --- /dev/null
> > +++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
>
> [ ... ]
>
> > +static void igb_phy_setup_autoneg(struct igb *igb)
> > +{
> > +     int timeout_ms =3D 1000;
> > +     bool success =3D false;
> > +     u16 phy_status;
> > +     int ret;
> > +     int i;
> > +
> > +     /* Trigger auto-negotiation */
> > +     ret =3D igb_write_phy(igb, MII_BMCR,
> > +                         BMCR_ANENABLE | BMCR_ANRESTART);
>
> [Severity: Medium]
> Will this auto-negotiation time out and fail the test via VFIO_ASSERT_TRU=
E
> when running on physical 82576 hardware without an active external link
> partner?

This is addressed in patch 2, but I'm going to squash patch 2 into
this patch to avoid introducing bugs.

> > +     VFIO_ASSERT_EQ(ret, 0, "Failed to write PHY control register");
> > +
> > +     for (i =3D 0; i < timeout_ms; i++) {
> > +             if (igb_read_phy(igb, MII_BMSR, &phy_status) =3D=3D 0) {
> > +                     success =3D !!(phy_status & BMSR_ANEGCOMPLETE);
> > +                     if (success)
> > +                             break;
> > +             }
> > +             usleep(1000);
> > +     }
> > +
> > +     VFIO_ASSERT_TRUE(success, "Auto-negotiation did not complete in t=
ime");
> > +}
>
> [ ... ]
>
> > +static void igb_init(struct vfio_pci_device *device)
> > +{
>
> [ ... ]
>
> > +     /* Enable Receiver and Transmitter */
> > +     rctl =3D E1000_RCTL_EN |       /* Receiver Enable */
> > +            E1000_RCTL_UPE |      /* Unicast Promiscuous (for dummy MA=
C) */
> > +            E1000_RCTL_MPE |      /* Multicast Promiscuous */
> > +            E1000_RCTL_BAM |      /* Broadcast Accept Mode */
> > +            E1000_RCTL_LBM_MAC |  /* MAC Loopback Mode */
>
> [Severity: Medium]
> Does real 82576 hardware support MAC loopback? It appears this might caus=
e DMA
> loopback to fail on physical hardware even if auto-negotiation completes.

Addressed in patch 2.

> > +            E1000_RCTL_SECRC;     /* Strip CRC (needed for memcmp) */
> > +     igb_write32(igb, E1000_RCTL, rctl);
> > +     igb_write32(igb, E1000_TCTL, E1000_TCTL_EN);
>
> [Severity: Medium]
> Is the Pad Short Packets bit (E1000_TCTL_PSP) missing from the TCTL
> configuration here?
>
> If vfio_pci_driver_memcpy() is called with a size smaller than 60 bytes,
> would the hardware send a runt frame that the receiver drops (because Sto=
re
> Bad Packets is disabled), causing igb_memcpy_wait() to time out with
> -ETIMEDOUT?

Yes, this is a bug. Verified this by modifying the memcpy size in
vfio_pci_driver_test. I'll fix this in v9.

> > +
> > +     /* Enable MSI-X with 1 vector for the test */
> > +     vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
> > +
> > +     /*
> > +      * Program MSI-X interrupt routing per 82576 datasheet:
> > +      *
> > +      * GPIE (section 7.3.2.11, Table 7-47): set Multiple_MSIX (bit 4)=
 to
> > +      * route interrupt causes through IVAR mapping, and EIAME (bit 30=
)
> > +      * to apply EIAM on MSI-X assertion (without EIAME, EIAM only
> > +      * applies on EICR read/write).
> > +      *
> > +      * EIAC (section 8.8.5): enable auto-clear of EICR for vector 0.
> > +      * Without auto-clear the cause stays set after delivery and the
> > +      * test can see spurious interrupts on the next memcpy batch.
> > +      *
> > +      * EIAM (section 8.8.6): enable auto-mask of EIMS for vector 0 on
> > +      * MSI-X assertion (effective because EIAME is set), so a single
> > +      * interrupt is delivered per memcpy batch even if the cause
> > +      * re-asserts before software re-enables the mask.
>
> [Severity: Low]
> This isn't a bug, but is this comment accurate about delivering a single
> interrupt per memcpy batch?
>
> Looking at igb_memcpy_start(), it explicitly disables interrupts before t=
he
> batch:
>
>     igb_irq_disable(igb);
>
> and igb_memcpy_wait() polls the descriptor writeback before clearing the
> cause and re-enabling interrupts:
>
>     igb_irq_clear(igb);
>     igb_irq_enable(igb);
>
> It appears interrupts are prevented entirely during the polling loop.

I'll update the comment in v9.

> > +      *
> > +      * IVAR (section 7.3.1.2, register definition in 8.8.13): map RX
> > +      * cause 0 to MSI-X vector 0 and mark the entry valid.
> > +      */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-igb_v3_b=
4-v8-0-3ed236272b4e@google.com?part=3D1
