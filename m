Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A3D31F99A
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 22:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783637318; cv=pass; b=na+Y+r6OEVG5TfktR4yD8+hm35DN8NIH3gyxHhK9UhYcQFscQKQR03Eb5pzowMsjP0fHc16mG8j4p8T6fnCGGYoiExI7AZs99y2CKM/7DeBzM2LysRUWlOGbZc2Z0szoimQ5oiIIWgHADshTdxLGiYt/rAVSlvgkUsmgpdZ+r80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783637318; c=relaxed/simple;
	bh=zRp/I/8neDSIoOEJkaMLrRzcN+q40Ef5gSFoTmd5P60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfKC7pfmrNJAoGFd8P1bMb8RJFEIowDS5QSznBwAaWV7jIyLTRbQLsbQxxNO5t/pZXPewJJ7hLVTxrMEkUeOlrwIb25y1966TYqdaiKotkdmpV0AAFaT0V6bO7wQj1i4nyaqf9B44StPRybAF8Z4WXb74pWZ6oNkPG/ehNHmUh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FT5mgJC7; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FT5mgJC7"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so1480e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 15:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783637315; cv=none;
        d=google.com; s=arc-20260327;
        b=ghgu+k5lfWGRP6vAIW9heETTKkfgjE6yfwx5gkFBdNBUaicr5EiwS0/zCKOhRYSHed
         Mm3wIOJLjZu2VqvVg6WerVplOUJxh0jVYfyS/NRvi5UecSTh+D65AjuLLusWxwd09DuH
         Qr87+1fkOdDVj3Iynk6MlC3AQQtgkSkNogHLPMZ/LY+sgv48YQqvXbzCpg2xLAB3bfdk
         sGZeuZMMAsxOQFJ5RUi8oun+E0WlyBiJHBqVQhcDzrjjSGXvUwSZMyDidNHahFUMmz/o
         JY2AdHLDkII9EMOsdxV4NcFxIGnJzoRtjefwZtEp8bFwgzUL88Wm2/Hbp/CoYGahFNxX
         IOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SY7xyhWtcEw02NKdEe3OAZxo7Ixy9y453ZhOAn8j2lo=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=Rh/AguxB2MF23C0I4OJP21zBZvaylvmlkGbj86hcL6Y3oi6bYXW+tcAZv3BlZRnKnh
         y4qGEVTbb7jEoLYAnvMsa8QFJuupws18VpLiUnKSGct5dMdB2JhSFht4oXH9ZADpvyfQ
         suNy9ytQC3PP8IR7pf2GILqyvk8aeX9rAtlypLv8ZvIxV3Rm8TBE9ki6TM2xcn2IPGbL
         Az5EvQfGSxYRyYEymk6/cErj87UEsRUhQclbTS+QWHDrM3rq3H3JKGtGz2tTW6pQvwLQ
         4uTpokZfFUnzW3v+f7r0bDiGufNcT4knfTQ20Tsxt3iRfBLFRutfIGDZlW+yClLNo+TV
         3jAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783637315; x=1784242115; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SY7xyhWtcEw02NKdEe3OAZxo7Ixy9y453ZhOAn8j2lo=;
        b=FT5mgJC7TXPGvIYG4Qqf6ymQdGiiU3tQpgJzWoqaowE1nfEAmDYQRHtziwQXDBfulN
         BiiS8blG9SFqOfUj4EbfGYYQv+gSpBZGebegACKTod7aYEBU6Dn96crRP7zdzjzUmNVO
         JxdY8nzCJxO6dtGfLx3bhTxlEXG9Rmehq0LkQ4uvk1iYZkgqdqNIbXEDp2J4urDAL1Bx
         ioZnRGsSmHps+zG6bIbENptsiODq5WNkv1KDeh2PsQY+PysCUsJ+ArVp92r+xwYgLSO3
         +WdhS/3EB+LEgRsgJNxEa6ENXYr8Vwiw2Q4H8phkRYO6NcpJTBKFS3vaOnsv3BwtUBrL
         OPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783637315; x=1784242115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SY7xyhWtcEw02NKdEe3OAZxo7Ixy9y453ZhOAn8j2lo=;
        b=sqUJxkUGNCL07ZUqzpLmsjZZfusHOWGk07burPK135Gr8o1spGie3N8J1z/R5Pk+CS
         /Kahvz90+C7KyBJkMzpVRYG1rbhuQNWOT9k7/Q1MXfVVKQzKocfl2xuA6x6VOwnsAaGf
         xcMxmMh+WDONIGLA9+K+3EOvWRqrbLUoZPS0tVIvt6Wv9HNdZ8LZ1vU1lEEWzK5+BJ02
         XHOPftejel0W38ailmEy4c3Kvncj5fW0ECNY+CCnVknGDD6DBdf3ggb1LBsgJxfyYbv8
         qGuL4/DhCAwL+lDsbPt8IWR8+oP44ZSDmS2oSWJUJ6o91oyz9ac8RCn5Zy9RP1ztOnGq
         W7og==
X-Gm-Message-State: AOJu0YxKCup9rBtIM+bfMKug2IlFtjnu935QOaxQXae9qyN6iUoFcygu
	qZ0F0OASZRckeY9oSmERV4+hJp14e8LpW3u2Una6NdRPT+su0Md7BycUU0hfaH7Eo3vHcBVb9qF
	re2A2Wxg38A/03FRTbe7iBIhrMKYEXKiDgKHx8PRUXr0EYIhcvav0E6w=
X-Gm-Gg: AfdE7ck9nV5PUjh+c/D6OMtcCBu2KSyR+EciontvT5NzHDGDzxm40Pshfd6b0Ar5EoH
	7MOHbv/5RKNx2pwoga5+jxJ6Cw7gJZ+o625xhpRq/XuZXs/rR+nQXUwF5GwVcZrJvDZRFyphLgB
	xT12WV9X6NZHATUETfbEx6oLf0uhg5LUboNe+SDND+RCgO7EvtkuihhKfBx5gDQarsQSr7J9OZn
	7j7LDlTyW8O+QscpbxQu/EqvZlQKvfvhTns6V5twPNEj9tcgpk4R4sWxdpsZhxv891h
X-Received: by 2002:a05:6512:158f:b0:5ae:b7a3:6dbc with SMTP id
 2adb3069b0e04-5b01cd3d59dmr27701e87.3.1783637314841; Thu, 09 Jul 2026
 15:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
 <20260708-igb_v3_b4-v3-6-1272650ca614@google.com> <20260708233123.F2EEC1F000E9@smtp.kernel.org>
In-Reply-To: <20260708233123.F2EEC1F000E9@smtp.kernel.org>
From: Josh Hilke <jrhilke@google.com>
Date: Thu, 9 Jul 2026 15:48:23 -0700
X-Gm-Features: AVVi8CdyHq0ad48N0jZUiqGuwL-IA5tEvvsKNT1F6W7hvplFSut8SBR-ACjsbMI
Message-ID: <CAAdrzjuyWgODnZR=OiRBxOcbEDdsBRN777hzo_dm4R+s2i23xA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] vfio: selftests: igb: Disable PCIe completion
 timeout retries
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Missing SW/FW synchronization semaphore when accessing PHY reg=
isters via MDIO.
> - [Medium] Missing DMA read memory barrier (dma_rmb) after descriptor com=
pletion polling.
> --
>
> --- Patch [6]: [PATCH v3 6/9] vfio: selftests: igb: Disable PCIe completi=
on timeout retries ---
> commit b47012b45a463be841715f383fb27408df2c020e
> Author: Alex Williamson <alex.williamson@nvidia.com>
>
> vfio: selftests: igb: Disable PCIe completion timeout retries
>
> The mix_and_match test intentionally submits TX descriptors with an
> unmapped source IOVA so that the DMA read fails.  By default the 82576
> re-sends the request after a PCIe completion timeout (datasheet section
> 8.6.1, GCR.Completion_Timeout_Resend, bit 16, initial value 1b).  On
> real hardware this turns a single fault into a stream of retried reads,
> keeping PCIe AER and IOMMU error handling busy and interfering with
> reset recovery.
>
> Clear GCR.Completion_Timeout_Resend during device initialization so a
> failed read fails once and stays failed.
>
> > diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools=
/testing/selftests/vfio/lib/drivers/igb/igb.c
> > index 1848be6cd46c9..a7a30660b23ed 100644
> > --- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > +++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > @@ -219,6 +219,18 @@ static void igb_init(struct vfio_pci_device *devic=
e)
> >               vfio_pci_config_writew(device, PCI_COMMAND, cmd_reg);
> >       }
> >
> > +     /*
> > +      * Disable DMA re-send on PCIe completion timeout (82576 datashee=
t
> > +      * section 8.6.1, GCR.Completion_Timeout_Resend, bit 16).  The
> > +      * mix_and_match test intentionally submits descriptors targeting
> > +      * unmapped IOVAs; with the default (set) value, the device keeps
> > +      * retrying the failed read indefinitely, which keeps PCIe AER an=
d
> > +      * IOMMU error handling busy and interferes with reset recovery.
> > +      */
> > +     ctrl =3D igb_read32(igb, E1000_GCR);
> > +     ctrl &=3D ~E1000_GCR_CMPL_TMOUT_RESEND;
> > +     igb_write32(igb, E1000_GCR, ctrl);
> > +
> >       /* Configure PHY internal loopback for testing. */
> >       igb_setup_loopback(igb);
>
> [Severity: Medium]
> Does writing directly to the MDIC register on real 82576 hardware risk
> colliding with the firmware or BMC management engine?
>
> When running tests on physical devices, accessing PHY registers without
> acquiring the E1000_SW_FW_SYNC semaphore can cause corrupted MDIO
> transactions or hardware hangs.  For example, in igb_write_phy():
>
>         mdic =3D (((u32)data) |
>                 (offset << E1000_MDIC_REG_SHIFT) |
>                 (1 << E1000_MDIC_PHY_SHIFT) |
>                 E1000_MDIC_OP_WRITE);
>
>         igb_write32(igb, E1000_MDIC, mdic);

The risk of this happening is low for physical hardware, and for QEMU,
it isn't even possible because writes to MDIC are synchronous.

There's a couple of ways to address this:
1) Do nothing and add a comment stating the risk.
2) Add a simple retry loop that checks MDIC ready and error bits.
Technically data corruption is still possible because the MDIO
protocol doesn't have a CRC, parity check, or checksum.
3) Implement the full semaphore acquisition which requires about 60
more lines of code.

> [Severity: Medium]
> Can the CPU speculatively read the destination DMA buffer before the hard=
ware
> descriptor writeback is architecturally complete?
>
> In igb_memcpy_wait(), the code polls the status bit via READ_ONCE() but
> returns without issuing a dma_rmb():
>
>                 status =3D le32_to_cpu(READ_ONCE(rx->wb.status_error));
>                 if (status & 1)
>                         break;
>                 usleep(1000);
>         }
>
>         igb_irq_clear(igb);
>
> On weakly-ordered architectures like ARM64, the test runner's subsequent
> memcmp() reads on the DMA destination buffer could be speculatively
> reordered before the loop's status poll finishes, resulting in stale
> data reads and sporadic test failures.

Will fix in v4.
