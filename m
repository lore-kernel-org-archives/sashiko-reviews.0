Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB73C3B2FE4
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625055; cv=pass; b=osie523t4Uq4MHK12tGy4MUie7JRCuCBbHfwNt+KTqB+STQF/F1br8DE82YdjD55lbbOy4eGsnp0yGZ2bCQq/2+aOER2M8/iODRYLp4md11Iz2rsU+OZH8EeWHCMh+folJYvOMS0ssFYaq1HU70RMLRn9gosF/H+YERkS6RI+M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625055; c=relaxed/simple;
	bh=a9Nyzp5h/11v0q9SYXSnb9FiDYrwRTPyoIvqHXqocGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBPwZ6YA7srYnM6zrpxabFFMeimN9wX+JALWQmMS6bs8874w2D2tezI2wvo4A5tP6OoPyxecsq1icFWLjCjJqi6tOWWhpDw5B6Y6FbvJpYKANTs5lERQRuhWe6EX/r9mbve3sXqFF3nuG8k3rhxemeA2OLx1zmn6Z/BNjuXMMt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZOq6ecMw; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZOq6ecMw"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb6bdeaeaso1364e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 12:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783625050; cv=none;
        d=google.com; s=arc-20260327;
        b=eMNxcCg0sFbbMP2JLTyAoe8fsDO5n0BQeZvt8lWfoVEPnohgBtS0Uh4VQX1EMk7Y6w
         fIIuLW90edhJ37/qpUI8TV5XFj9WSEMnkAhWve3HgQS0+w+jWq2HjXiqWlZVXZnPtbPA
         sRTKaY2Bi5phpRNiPSpoBfwhwGpM3oRuMMu+OlNAQL8jcQdULSa3tHGfe7uW9QIGQlt4
         BxMOva1xQ66D0Wd9lMMH5b/HS+gWVRUKGVERy8YL4ncNvH1WLYVW1L3J2wDHd5snPAG7
         N951+pvoLnGFYEemNE5zVpQhn4pDY0xy9FbCwbY3eFKlZp80HqdS57hGgeSUhRBytJ7Z
         J+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I25j4NEeSKak63Qb+HSetEoQ8CJw2iYRk1TEpKrwxTw=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=lKyvO6BO0tbFIl+KIkyCf5059F2GF5H37JQGJp3s/s/v6S7OAxCbFAT9fmJr8/15QC
         M57wBxDDbLo0c/jm+qAjzPPLCNH6N3y8L/x3kM04t4989rsujCyEs1waN5zUKl84HWAf
         +aperc9e71fRV8/XQkkdv+KrRWcfkyHvhAzynBM6VHVaITPgSf7+fHhbpSpZNemr4A7v
         mmidNr5H5Cn58hvAWbxE1PwKj9ZMmUfm/5RrARqYd/MlJBWpangx224lmYWy7XkHBn3j
         /eh6hD5lQ4o/aXZ6DDdEj8laY+UoyeAq/FkJnrXsOFy8AViA/CrK/qPGyrtWfsLO2O9h
         +ETA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783625050; x=1784229850; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I25j4NEeSKak63Qb+HSetEoQ8CJw2iYRk1TEpKrwxTw=;
        b=ZOq6ecMwNcG2wn0/uxrMyUZk5CyqXsU5mmNpWRIgGYjMN77MWg8pOhM0BmLE3oIFKA
         5MMknDHIQPiCPYPnY2iwwQM00Ce4mlQmXtxtMyxw7K+JCtgYgdWo67923sbeIGC18HqZ
         vFbNaL/1pJCNBHwbhCuUH/R/wqiMKF05eM4qz+dlqrICw3z1n8InSsK+5NrkwymBf7qQ
         AnVeXyE2gnDkRYY1bGufSO0vML+rKF+bAOd1/lkJlxJaCge9SbuADBldE9FLsEbTYXrb
         YVr7dOckPHzPGum/j0UfNH7HShFJ3zSqzaX4a09aKszmBH1fFykeVThqv6lVcIhOIUHP
         w4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625050; x=1784229850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I25j4NEeSKak63Qb+HSetEoQ8CJw2iYRk1TEpKrwxTw=;
        b=DZPGTbtoHagARRa4pGJ8R9Bewjc+j6tuTDgkvplx8Ir/8mypS1QyuAi43/zAOblRsK
         ld/gvbnRVAjSmOu25vXdvfFRRmVWKzuSAYfytaIFtz120w6S61Sj6vR9TRLaOSe+WuSP
         C4YB0bAmoS1j3n2BCcDFicfFlyVPYf59UsXMjLJpE1IqxjG3cVIv+maEjy84Pf61G/t0
         jxUQeepR2MumLe12onJIc32gjSM9vnVF6MmU829+3/QJ3Gb37HcbaOOPq+l2LluDOn3M
         Kqbw0MN2lHOpF0Vh55z5olv/hQcxjzpC23mkVPbbw/RTvadVRkUaNCKyRAnc6z5dtIs4
         k6MQ==
X-Gm-Message-State: AOJu0Yw+igUuFZ3Z1E8M6ENOzsiDCjlvE6AwKNql9nsLxUGB2MlUxgrg
	9Xfe1G+eoKt2rUi+1yy+wzeYkWUF8AchMOL+tTfsXLH237g2i7f7t7MDW9OXjy51yiCl1VdOo/U
	bb8lEuAk0vzPeU6F1e1hYfeHsE8xEiBj11Atr6PwZ5KpQO8gsUn3yLkOSMA==
X-Gm-Gg: AfdE7cmju/6qZoXuxs+KbMo6BxWnAE3V5noe73SrHfm8ojMyUDIPxp9ybPij91LXhR/
	N8IE/rDgmhy70LoCn8mjyLNl5w1LpHLK9hguI9zTCmOBK2ZHriiAkX9/KCDiT6VUM2GcI/0r9gs
	YQycEDl/JY/KhNIkL3Zq6kyp5yd2HO4SpidrlovTj/UthX/VPZH4oiGOJeu3MyDyCf1Yn5adrtx
	CWFwRCf0Izqp8UAqMIwiyls6eFro0V73abKiI0eXs21gEfhZ0qaTsWiIO5cxFfouVEf
X-Received: by 2002:a05:6512:3b0c:b0:5ae:add8:f1ff with SMTP id
 2adb3069b0e04-5b01c83a829mr28215e87.5.1783625049189; Thu, 09 Jul 2026
 12:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
 <20260708-igb_v3_b4-v3-1-1272650ca614@google.com> <20260708233151.6EACE1F000E9@smtp.kernel.org>
In-Reply-To: <20260708233151.6EACE1F000E9@smtp.kernel.org>
From: Josh Hilke <jrhilke@google.com>
Date: Thu, 9 Jul 2026 12:23:56 -0700
X-Gm-Features: AVVi8CdhEPpBm7l9s0IjnXHy9W0ADejT_RWImIR_E5Q-RZbVyB4otcxU7sZDAnk
Message-ID: <CAAdrzjsC607Ke_rpdeDq50n3BratY=vQnq0NLNt7=wSBPR_dvA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] vfio: selftests: igb: Add driver for IGB QEMU device
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] Advanced Receive Descriptor Misconfiguration (SRRCTL)
> - [High] Unsupported MAC Loopback and Link State Deadlock
> - [High] Interrupt Delivery Failure due to Incomplete MSI-X Configuration
> - [High] Fault Recovery Failure due to PCIe Completion Timeout Resend
> - [High] Inadequate Wait Timeout for Large Memcpy Batches

It's worth noting most of these issues are specific to the physical
hardware. This first patch intends only to do the bare minimum to get
the driver tests to pass on QEMU IGB. Alex's patches add the necessary
support for the physical device. I think keeping those patches
separate makes it easy to see the differences between the QEMU device
and the physical device. I'll add comments for each issue below
stating which patch addresses it.

I'll also update the commit message to clarify that this patch does
not support the physical hardware.

>
> --- Patch [1]: [PATCH v3 1/9] vfio: selftests: igb: Add driver for IGB QE=
MU device ---
> commit a7e0dd62086e602fc2886d15801884902daf6cba
> Author: Josh Hilke <jrhilke@google.com>
>
> vfio: selftests: igb: Add driver for IGB QEMU device
>
> This patch adds a VFIO selftest driver for the Intel Gigabit Ethernet
> controller (IGB) to allow running VFIO selftests in QEMU without requirin=
g
> specific hardware. It utilizes the IGB loopback mode to implement the
> required memcpy operations.
>
> > diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools=
/testing/selftests/vfio/lib/drivers/igb/igb.c
> > new file mode 100644
> > index 0000000000000..339ca88b9c555
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
> [Severity: High]
> Does this configuration work on unplugged physical hardware?
>
> Writing to the PHY without enabling BMCR_LOOPBACK and relying on
> autonegotiation will block indefinitely and time out after 1 second if no
> network cable is connected.

Fixed in patch 2 which sets up loopback for physical hardware.

>
> > +     VFIO_ASSERT_EQ(ret, 0, "Failed to write PHY control register");
> > +
> > +     for (i =3D 0; i < timeout_ms; i++) {
> > +             if (igb_read_phy(igb, MII_BMSR, &phy_status) =3D=3D 0) {
> > +                     success =3D !!(phy_status & BMSR_ANEGCOMPLETE);
>
> [ ... ]
>
> > +static void igb_init(struct vfio_pci_device *device)
> > +{
> > +     struct igb *igb =3D to_igb_state(device);
> > +     u64 iova_tx, iova_rx;
> > +     u32 ctrl, rctl;
> > +     u16 cmd_reg;
> > +     int retries;
> > +
> > +     VFIO_ASSERT_GE(device->driver.region.size, sizeof(struct igb));
> > +
> > +     /* Set up rings and calculate IOVAs */
> > +     igb->bar0 =3D device->bars[0].vaddr;
> > +
> > +     iova_tx =3D to_iova(device, igb->tx_ring);
> > +     iova_rx =3D to_iova(device, igb->rx_ring);
>
> [Severity: High]
> Could an unmapped IOVA access permanently lock up the physical device her=
e?
>
> VFIO selftests intentionally submit descriptors targeting unmapped IOVAs =
to
> test IOMMU fault handling. By default, 82576 hardware sets the
> E1000_GCR_CMPL_TMOUT_RESEND bit, which instructs the DMA engine to
> indefinitely retry upon PCIe Completion Timeout or Unsupported Request fr=
om
> the IOMMU, flooding the system with PCIe AER errors.
>
> Should the initialization sequence clear this bit in the E1000_GCR regist=
er
> before starting DMA operations so the device can gracefully recover?

Fixed in patch 6, which clears the GCR retry bit, and patch 9 which
implements FLR recovery.

>
> > +     igb_write32(igb, E1000_CTRL, igb_read32(igb, E1000_CTRL) | E1000_=
CTRL_RST);
> > +     /*
> > +      * Must wait at least 1 millisecond after setting the reset bit b=
efore
> > +      * checking if this device is ready to be used (82576 datasheet s=
ection
> > +      * 4.2.1.6.1).
> > +      */
>
> [ ... ]
>
> > +     /* Configure TX and RX descriptor rings */
> > +     igb_write32(igb, E1000_TDBAL(0), (u32)iova_tx);
> > +     igb_write32(igb, E1000_TDBAH(0), (u32)(iova_tx >> 32));
> > +     igb_write32(igb, E1000_TDLEN(0), RING_SIZE * sizeof(struct igb_tx=
_desc));
> > +     igb_write32(igb, E1000_TDH(0), 0);
> > +     igb_write32(igb, E1000_TDT(0), 0);
> > +     igb_write32(igb, E1000_TXDCTL(0), E1000_TXDCTL_QUEUE_ENABLE);
> > +
> > +     igb_write32(igb, E1000_RDBAL(0), (u32)iova_rx);
>
> [Severity: High]
> Will the hardware use the correct descriptor format without configuring
> E1000_SRRCTL?
>
> The driver's struct igb_rx_desc expects the Advanced One-Buffer format, b=
ut
> without writing E1000_SRRCTL_DESCTYPE_ADV_ONEBUF to E1000_SRRCTL during
> igb_init(), the 82576 hardware defaults to the legacy format.
>
> This causes the hardware to write the status byte to offset 4 instead of
> offset 8, making igb_memcpy_wait() poll an unpopulated offset and causing
> the test to fail with an indefinite timeout on physical hardware.

Fixed in patch 3 which implements advanced TX and RX descriptors.

> > +     igb_write32(igb, E1000_RDBAH(0), (u32)(iova_rx >> 32));
> > +     igb_write32(igb, E1000_RDLEN(0), RING_SIZE * sizeof(struct igb_rx=
_desc));
> > +     igb_write32(igb, E1000_RDH(0), 0);
> > +     igb_write32(igb, E1000_RDT(0), 0);
> > +     igb_write32(igb, E1000_RXDCTL(0), E1000_RXDCTL_QUEUE_ENABLE);
> > +
> > +     /* Wait for TX and RX queues to be enabled */
> > +     retries =3D 2000;
> > +     while (retries-- > 0) {
> > +             if ((igb_read32(igb, E1000_TXDCTL(0)) & E1000_TXDCTL_QUEU=
E_ENABLE) &&
> > +                 (igb_read32(igb, E1000_RXDCTL(0)) & E1000_RXDCTL_QUEU=
E_ENABLE))
> > +                     break;
> > +             usleep(10);
> > +     }
> > +
> > +     /* Enable Receiver and Transmitter */
> > +     rctl =3D E1000_RCTL_EN |       /* Receiver Enable */
> > +            E1000_RCTL_UPE |      /* Unicast Promiscuous (for dummy MA=
C) */
> > +            E1000_RCTL_LBM_MAC |  /* MAC Loopback Mode */
> > +            E1000_RCTL_SECRC;     /* Strip CRC (needed for memcmp) */
> > +     igb_write32(igb, E1000_RCTL, rctl);
>
> [Severity: High]
> Is it expected that internal MAC loopback is not actually implemented on
> real 82576 hardware?
>
> The datasheet (Section 3.5.6.2) indicates E1000_RCTL_LBM_MAC has no physi=
cal
> effect on the 82576. Additionally, the MAC link is never forced up via
> E1000_CTRL_SLU here. This will stall the descriptor engine when running o=
n
> real hardware without a live network connection.

Fixed in patch 2 which uses PHY loopback instead of MAC.

>
> > +     igb_write32(igb, E1000_TCTL, E1000_TCTL_EN);
> > +
> > +     /* Enable MSI-X with 1 vector for the test */
> > +     vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
> > +
> > +     /* Enable auto-masking of interrupts to avoid storms without a re=
al ISR */
> > +     igb_write32(igb, E1000_GPIE, E1000_GPIE_EIAME);
> > +
> > +     /* Enable interrupts on vector 0 */
> > +     igb_write32(igb, E1000_EIMS, 1);
> > +
> > +     /* Map vector 0 to interrupt cause 0 and mark it valid */
> > +     igb_write32(igb, E1000_IVAR0, E1000_IVAR_VALID);
>
> [Severity: High]
> Will the hardware successfully deliver MSI-X interrupts with this configu=
ration?
>
> The RX queue is mapped to MSI-X vector 0 using E1000_IVAR0, but the
> E1000_GPIE_MSIX_MODE bit isn't set in E1000_GPIE. This leaves the 82576
> operating in legacy interrupt mode, causing it to ignore IVAR routing.
>
> Also, while E1000_GPIE_EIAME (Auto-Mask Enable) is set, the E1000_EIAM
> and E1000_EIAC registers appear to be left unprogrammed.

E1000_GPIE_MSIX_MODE does indeed need to be set in order for the
driver tests to pass in QEMU (the mix_and_match test fails without
it).  Patch 4 fixes the MSI-X configuration for the physical hardware.

> > +
> > +     /* Initialize driver state and capability limits */
> > +     igb->tx_tail =3D 0;
>
> [ ... ]
>
> > +static int igb_memcpy_wait(struct vfio_pci_device *device)
> > +{
> > +     struct igb *igb =3D to_igb_state(device);
> > +     struct igb_rx_desc *rx;
> > +     u32 status =3D 0;
> > +     u32 prev_tail;
> > +     int retries;
> > +
> > +     prev_tail =3D (igb->rx_tail + RING_SIZE - 1) % RING_SIZE;
> > +     rx =3D &igb->rx_ring[prev_tail];
> > +
> > +     retries =3D 100;
> > +     while (retries-- > 0) {
> > +             status =3D le32_to_cpu(READ_ONCE(rx->wb.status_error));
> > +             if (status & 1)
> > +                     break;
> > +             usleep(10);
> > +     }
>
> [Severity: High]
> Is a 1 millisecond total wait timeout sufficient for full-size batch copi=
es?
>
> This lockless polling loop executes 100 iterations of 10 microseconds eac=
h,
> yielding a strict 1ms timeout limit. However, the driver initializes
> max_memcpy_count to 4095 and max_memcpy_size to 1024 bytes. Transmitting
> ~4 MB of data across a 1 Gbps loopback interface physically requires at l=
east
> ~33.5 milliseconds, which will cause large memcpy batches to consistently
> time out before completion.

Fixed in patch 5 which extends the timeout for the physical hardware's
line rate.
