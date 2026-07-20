Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA642DA749
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581925; cv=pass; b=AmeaoZQKWm9A+VOVp+75PhUxDmVF4Lq0uUBFd0FuUbgLgVrrghysBQ1CCP7t+om2175F9I4asVdR1nA1ja7+Af7lajCUJ6JoeDHAjX0x2bwNGoTpfgXXUHq2VYhOSKwJWZxz2pzEUBAK86kBNlb8ONyB1FfUeQsvsMWSGwKRyAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581925; c=relaxed/simple;
	bh=lRocIA7DUpH9mZLq9zVZ9/zMYmsv5z7zJPYY+w3Jc7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7NyGJpt9KknpK0guPTX0ufq0xSN2JbPx150iE9jab/Kse2QWTKkmJntrwOC1mVwtMzEvzkuqiLYn74XOGF8T0l2J2ZtrZfaveeUKrmrs2gIq90wCTN0r73bUqb+0Iq5vljfAxIAV/+zS/xPAOnnkWjJiVaoOqI3MJlozPNuwqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KxzbBtBJ; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KxzbBtBJ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb6bdeaeaso33689e87.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784581915; cv=none;
        d=google.com; s=arc-20260327;
        b=DOl9fbWbnN7ugKs8rhoyfHeAg6kIzQICWUBrs8+4AdOknsjTeCGockOQdvD4jmEYth
         n50BPWmBAOYy4MfgRFB4/4twQ3aU4Cb3Lw68x7D/rGHUp+gCKLzUtl6P1hD5tEEe++yN
         TvM4SJdVEXOUTyK7hUJJQ9RGgl28pq+3StmiNpPYI1bE7e5kNUioss4I+zojk+KNC44W
         C2FkeT8Bf1dji9/5oMVUE1HsCfzMftZJgDlHREi1gYx6HObaTVVLKVC4U3038OjUpRkM
         k/pm+VZPYb1V7QLssBjXuDnO3uXKArf0nPzgi3bMw1tpbjGCF9GcbjbCg9dHiNXlNRfp
         uphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2NT7/9aVJQ0lE1aVT0nFHov8n+tz4I5xjcivzPKn3zU=;
        fh=d01QbNwzqaSih/pzyx2m5I3zgPwaQbtOCqNOl9ej+AA=;
        b=K/CCI7Q5hiqLQeDR8TzZ7O3Ojn/pQxJpf+TWRFAxFRT51XWsUJSLoOTFeauO5D9E7P
         qXLDE4wYn/KH1I4NZGa1tOGJU/67SEkzJjjuPKgibH7b9zjMdghkMRObj6y1e2Dcy68N
         o1mpND6l9f4FZ5c/xy6SwTVh0Z16LMLWlSTH9YAAolBUJWrtf2p+HKEB5G58c9cERKuF
         TQc63APNsecCjAsbWVEkK8X81ZGPbeZkdZmEWHB8Tu5U4MKenSvBYciIeOnVNLmrGrGg
         DLO12z4w24zls6YyFjX30MBUMStu9jg91FoODFGFzh4vD1iEKPb7mhRYxTlI7dyqFWpl
         vLag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784581915; x=1785186715; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NT7/9aVJQ0lE1aVT0nFHov8n+tz4I5xjcivzPKn3zU=;
        b=KxzbBtBJetCcnRcQA5v5XScx/Y5zNo8BY1XkFOeWBhV+4GiwGPrzOBR6WFkgyLK2Fc
         a90ZocuCFrE03SsvKIiu+2HouBaOIsXmRObAXe8bA9qTYBJnHc4qGsb2Ev/jbdyIC1hX
         tmRN0A5jNMg7+6UUhU3Wzb0aaGYXUvkOrvuN1NeTsGXx77J6o/9Eila5w/BxbFiSF3kZ
         xZEUrqK3UaPiD6tGaevJvfqrs3f9JMcZzj2ikbbeVAN0IiokQ0xYDdTlBjM4DQta/iMk
         /JCUqwIV0u0gZOjGtAJLIdkzH2QDJOuvP/8tePzTfkitqq2Ppsdnl4Q/KYHI/3eS+J5v
         OQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784581915; x=1785186715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NT7/9aVJQ0lE1aVT0nFHov8n+tz4I5xjcivzPKn3zU=;
        b=TrKWw/vghoqqspVH6UIyg1IplehgOJz74mmoJn0GQZtjxDyQhpvPwJYPaJHelQ8fvT
         NOMHDwtEnNGDLsgBZcnlU/qZs7mB3HwMuZ+4Cb0HdxSDJ1smfBLcRxW/WwlHW2tPgq4T
         Ck4b1kAGhi9pdkp5UF7d/9IzAuWTzvE+jKWW6szEu2eN7E0VDCILMp7GpMObK/3Ki4/x
         ufeUgUP7npuHPOBDdrp4ElvXSM0QPyDBuOVYpVg3ET5gnpz2ce2t6jK3WDR8djtKU/TI
         e/Z0PGgyibIgnkOmXbdJ43hFCOkNyxc7D5Hx4vTJsfIg001lyLmKUYQq9ZWcKjgqNzh0
         149A==
X-Gm-Message-State: AOJu0Yw1ttkdhjTmLS7TfFSH3SISx2axK/TxDNxQZ9CbICpgynNvRXa3
	PT/X3wR4soqkT9OZJcC2gXgxIgxYsSrkh6XPV4wSMVV8z/Cdrqz9HLjB7WpPK6+HjFJ28N9glnI
	CbrCa6+8hyjm9E7u4r6i0cMdwREbun+aQ7CT73ABvn/QYfyjQA7Ow0qvguQ==
X-Gm-Gg: AfdE7cmpzimj8x+FYE1UPJCVvR++XGW9hZhP9iK7lTiu+/eQYM85Gh7F+CmawJO4LIT
	iszVIehw5oEXefSw9M037Xl+HO2kCIC3Xag+aqft8GE49wahhxVq31r5ILOBRAvqdELF9lHWBiQ
	NcuGlsc6P4peRIlgzXJzPbRKjjOkyE7yvC6xof0+O1E/gUl9hSeGuO6v8LKIgaC5T7T9wbGyqYx
	DucNj/ISMu1LqY/ZNVo0uJl8mwZHjadr6xLLqxgWuyQHljnWiYBkKZvvqLGPbEmxToz1HZc2mvQ
	KcOtoEDsc76ZIZk=
X-Received: by 2002:a05:6512:ba1:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b2a31c4862mr133848e87.9.1784581914945; Mon, 20 Jul 2026
 14:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>
 <20260714-igb_v3_b4-v5-1-91503eddb98b@google.com> <20260714212823.1EFEC1F000E9@smtp.kernel.org>
In-Reply-To: <20260714212823.1EFEC1F000E9@smtp.kernel.org>
From: Josh Hilke <jrhilke@google.com>
Date: Mon, 20 Jul 2026 14:11:42 -0700
X-Gm-Features: AUfX_myTZrVSaNYBmc6S1rniLUZmu_eudhCqnMA0Lt3-y_G8hz_4bY0LPvLAMdY
Message-ID: <CAAdrzjvT7536ZQA5y+g1D5WNNVYqu0ioc6y+rHwhB25zqkynYQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] vfio: selftests: igb: Add driver for Intel 82576 device
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 2:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The selftest relies on external PHY auto-negotiation, which wi=
ll cause the test to fail on real hardware if no physical link (cable) is c=
onnected.
> - [Medium] MMIO registers are accessed before PCI memory space is enabled=
, which can crash the test if memory space is disabled.
> --
>
> --- Patch [1]: [PATCH v5 1/5] vfio: selftests: igb: Add driver for Intel =
82576 device ---
> commit b66293558b628d9af7dfd3c68ff9a1e69b1cbb0b
> Author: Josh Hilke <jrhilke@google.com>
>
> vfio: selftests: igb: Add driver for Intel 82576 device
>
> Add a VFIO selftest driver for the Intel Gigabit Ethernet controller
> (IGB), specifically targeting the 82576 device. IGB is fully
> virtualized in QEMU which makes it easy to run VFIO selftests without
> needing any specific hardware.
>
> > diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools=
/testing/selftests/vfio/lib/drivers/igb/igb.c
> > new file mode 100644
> > index 0000000000000..a59b953030925
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
>
> [Severity: Medium]
> Will this cause the selftest to fail on real hardware if no physical cabl=
e is
> connected?
>
> Since this relies on external PHY auto-negotiation, it looks like the
> BMSR_ANEGCOMPLETE bit will never set without a physical link partner,
> triggering this assertion failure.

This is addressed in patch 2, "vfio: selftests: igb: Use PHY internal
loopback on 82576" by replacing the external auto-negotiation check
with an internal PHY loopback configuration that does not depend on a
physical link partner.

> [ ... ]
>
> > +static void igb_reset(struct igb *igb)
> > +{
> > +     igb_write32(igb, E1000_CTRL, igb_read32(igb, E1000_CTRL) | E1000_=
CTRL_RST);
> > +     /*
> > +      * Must wait at least 1 millisecond after setting the reset bit b=
efore
> > +      * checking if this device is ready to be used (82576 datasheet s=
ection
> > +      * 4.2.1.6.1).
> > +      */
> > +     usleep(2000);
> > +     VFIO_ASSERT_EQ(igb_read32(igb, E1000_CTRL) & E1000_CTRL_RST, 0);
>
> [Severity: Medium]
> Can this assertion fail due to igb_read32() returning 0xFFFFFFFF if PCI
> memory space is disabled?

If PCI memory space is disabled, the test can't run. So we'd want this
assertion to fail in that case.

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
> > +
> > +     igb_reset(igb);
>
> [Severity: Medium]
> Is it safe to perform MMIO accesses in igb_reset() before the PCI memory
> space is enabled below?
>
> If the device was recently reset or the system does not pre-enable memory
> space, these early MMIO accesses might fail.

We don't see this failure when running the tests, because the test
fixture opens the VFIO device file which triggers a call to
vfio_pci_core_enable() which eventually calls pci_enable_resources()
which sets PCI_COMMAND_MEMORY. And this driver is only intended to run
on a VFIO-bound device.

>
> > +
> > +     /* Signal that the driver is loaded */
> > +     ctrl =3D igb_read32(igb, E1000_CTRL_EXT);
> > +     ctrl |=3D E1000_CTRL_EXT_DRV_LOAD;
> > +     ctrl &=3D ~E1000_CTRL_EXT_LINK_MODE_MASK;
> > +     igb_write32(igb, E1000_CTRL_EXT, ctrl);
> > +
> > +     /* Enable PCI Bus Master. */
> > +     cmd_reg =3D vfio_pci_config_readw(device, PCI_COMMAND);
> > +     if ((cmd_reg & (PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY)) !=3D
> > +         (PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY)) {
> > +             cmd_reg |=3D (PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY);
> > +             vfio_pci_config_writew(device, PCI_COMMAND, cmd_reg);
> > +     }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-igb_v3_b=
4-v5-0-91503eddb98b@google.com?part=3D1
