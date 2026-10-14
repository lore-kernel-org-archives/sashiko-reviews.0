Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8468D54655
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 00:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791936031; cv=none; b=NGjAOGZWEfGt2B3v/sbGhOh+TWMih4qMxfnUnrMTSqSnVfY6QaBz+umzrpnkTJyVIX7w1+811tHIWkEbsMTAY0PAsCHyR2vOT8FNQgl8rR37WDVRledumQRfqM18jnxozIezdGUQ3SjyT96dIr+WI0pV0Q48iatDrcJVibvB8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791936031; c=relaxed/simple;
	bh=FSTxUGQtt1X9cUsFQ/i8NA1E065OntRXZtl9VO//Avc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aN0yLSU5fl2Dlzi9RUG+niRmJc21TdY8vVJS3MwDD3FFIshmUqJQl6U+Uw+Rb40JHAXfJhidxGPUkYVXoWVhgNkrMH3/jaHhbZgOm+fODYjv/EuW46QKyye3HiHjovUwqKZZkrnUXgDfkxgkG1tKtXNksuPTEf4OkXsf6lZ9n1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JeyZkBDY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JeyZkBDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791936028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OyJNtakCX3un/2pf1+yhpa5FhexdwrnTrBGiDYOcARo=;
	b=JeyZkBDY2llpRR7scCQlRscG3JPSUUyqLxgqRrVMB0TXe7numa9rAjFaeGiVMfqnebaiLJ
	d50QUAaXoF8ffENPa9ErvTi3eW/zD33UqqWlje2JhlYquht+OIpS+21SSP2BEHOZiw/HBL
	zBREC/BvjKz8cVLEX+KmDgl/rsyO0xQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-3sjX_n0DNqGt-szyl9m74A-1; Wed, 14 Oct 2026 00:00:27 +0000
X-MC-Unique: 3sjX_n0DNqGt-szyl9m74A-1
X-Mimecast-MFC-AGG-ID: 3sjX_n0DNqGt-szyl9m74A_1791936026
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1af80b913so9862325e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 17:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791936026; x=1792540826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OyJNtakCX3un/2pf1+yhpa5FhexdwrnTrBGiDYOcARo=;
        b=ZZhXPCFsM0tN9eT390bTx8p0X+kuQPU7AQHP7qZWBuxMbIrruHTPuSEXMKntX8Ip/9
         wH5Vdu/vnj1p1CeLG9medX0d+8gKdE1uomqmS/ALPbPq3EGiL0DMXciAfsVgj7Rbqzgd
         nvQSxMboo0K9rofz2qeNeSrChsJXB3wUYqbGH9f5Qg5uo9pTA0kmJAf/EFatr/McYK/2
         BxlPLzJfIj2Dk9J+EDH6aDott3eq3a2tOUdFVLSFvDjlUi4x7wUMGxzgME5MC67n7o1y
         LGSRoM2H14JcCPVGjiOuYF7pYvXBKJI8RU0V+jRKksSy8Desy1jlsu2tihHllStlrhpe
         jsfQ==
X-Gm-Message-State: AFq9FYLIvFCaDprxV7+ToVdB5s5BhgfL9+uGLwaLyKVlXTFbcihmtefD
	j5fEY5ra9CIn6KlecC5az/9nHWnkiSbOdSIbxzFA6IIfMFs2Pe3W48tz6PwYuS5soqN1ci9o6c6
	UEybuyYg6Ko2pZqyjNXUm9iSOGAYDkYFILaQAErfTiUGVxJjMr6qIY83KBNhGmozEIjJ+sMHEI8
	RsuQ9xMBwLNiustwfjes390bEuyOswwAw+8zWcr0D3gtB2WGw=
X-Gm-Gg: AYBFou0m4+70q48/Qxly9yru6toc46Br44jNgI0Q8CgfZC4jsqZb0ZHl1KLmErHXvn0
	+ufmFwqa+ILNsTlqjntwVeLeeDLvqB5X/ckH8Y340I/K3ZZZFEamdNMy1wvStY2nN/5WiDZYCB8
	0TbYJyuOQmfYCMNhhDtTfnwfIZgmdzTxuCwodplx5G1OwfKy3IYtJO7N5I0CtOYu3/OOZEPAG2Q
	cUVpyx79oTIRmlgsR5u9/fi0lHL+4KnWwTB+Lmm3hxRuF8jyseR+P7bb6rbuKic6rbFlblNhAM7
	DCGTBt7prc3ppGfj79VDrgEvwyyOM5m8C6QQpAJNY3q5oex3PMFgZ/Uo1IYkCXXP8Q1ZVQ==
X-Received: by 2002:a05:600c:4f89:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1acaa9f79mr68276755e9.25.1791936025627;
        Tue, 13 Oct 2026 17:00:25 -0700 (PDT)
X-Received: by 2002:a05:600c:4f89:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1acaa9f79mr68275255e9.25.1791936024166;
        Tue, 13 Oct 2026 17:00:24 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm572672735e9.9.2026.10.13.17.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 17:00:23 -0700 (PDT)
Date: Tue, 13 Oct 2026 20:00:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: read ROM via ACPI _ROM when hardware ROM is
 unreadable
Message-ID: <20261013195125-mutt-send-email-mst@kernel.org>
References: <31aa2fb273d7ff7ea535c74e0780e279aa9a119c.1791933554.git.mst@redhat.com>
 <sashiko-outbox-170641@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-170641@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N_OPCC2MhjUdCU-J5GWLloScOvCewaBgvfi633OvId0_1791936026
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 11:36:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] vfio/pci: O(N^2) overhead in ACPI ROM read via recalculating size
> - [High] vfio/pci: infinite loop in ACPI ROM size calculation
> - [High] pci: NULL pointer dereference in vfio_pci_acpi_rom_read() when _ROM returns no object
> - [Medium] vfio/pci: ACPI ROM reads truncated by unreadable physical BAR size
> - [Medium] vfio/pci: ACPI ROM reads missing 0xFF padding
> --
> 
> commit ef01db8fb34fde6cd15f6043dd6655f51df61bf4
> Author: Michael S. Tsirkin <mst@redhat.com>
> 
> vfio/pci: read ROM via ACPI _ROM when hardware ROM is unreadable
> 
> Some GPUs (e.g. NVIDIA Quadro P2000 Mobile in a laptop) have a ROM
> BAR that exists but is unreadable because the GPU was never POSTed
> by the system BIOS. On these systems the VBIOS is available via the
> ACPI _ROM method provided by the platform firmware.
> 
> > diff --git a/drivers/vfio/pci/vfio_pci_rdwr.c b/drivers/vfio/pci/vfio_pci_rdwr.c
> > index df88480876815..9bc0a7df4fd69 100644
> > --- a/drivers/vfio/pci/vfio_pci_rdwr.c
> > +++ b/drivers/vfio/pci/vfio_pci_rdwr.c
> [ ... ]
> > @@ -198,6 +199,112 @@ ssize_t vfio_pci_core_do_io_rw(struct vfio_pci_core_device *vdev, bool test_mem,
> >  }
> >  EXPORT_SYMBOL_GPL(vfio_pci_core_do_io_rw);
> >  
> > +#ifdef CONFIG_ACPI
> > +static int vfio_pci_acpi_rom_read(struct pci_dev *pdev, void *buf,
> > +				  loff_t offset, size_t length)
> > +{
> [ ... ]
> > +	status = acpi_evaluate_object(rom_handle, NULL, &rom_args, &buffer);
> > +	if (ACPI_FAILURE(status))
> > +		return -EIO;
> > +
> > +	obj = buffer.pointer;
> > +	if (obj->type != ACPI_TYPE_BUFFER) {
> 
> [Severity: High]
> If a system's ACPI BIOS is flawed and the _ROM method executes successfully
> but returns no object, acpi_evaluate_object() returns AE_OK but leaves
> buffer.pointer as NULL.
> 
> Will this unconditionally assign and dereference a NULL pointer via
> obj->type, crashing the kernel when vfio_pci_acpi_rom_size() is called
> during region info ioctl?

i can harden it sure.

> > +		kfree(buffer.pointer);
> > +		return -EIO;
> > +	}
> [ ... ]
> > +size_t vfio_pci_acpi_rom_size(struct pci_dev *pdev)
> > +{
> > +	void *buf;
> > +	size_t size = 0;
> > +	int ret;
> > +
> > +	buf = kmalloc(0x1000, GFP_KERNEL);
> > +	if (!buf)
> > +		return 0;
> > +
> > +	do {
> > +		ret = vfio_pci_acpi_rom_read(pdev, buf, size, 0x1000);
> > +		if (ret > 0)
> > +			size += ret;
> > +	} while (ret == 0x1000);
> 
> [Severity: High]
> Does this un-bounded loop rely entirely on firmware behavior to terminate?
> If a buggy or malicious ACPI _ROM method ignores the offset parameter and
> always returns a full 4KB buffer, will this cause an infinite loop and a
> kernel soft lockup?

i can limit to 16M as per pci spec.

> Additionally, this loop evaluates the ACPI method repeatedly in 4KB chunks
> to read the entire ROM just to determine its total size.

i will cache it.

>  Since
> vfio_pci_acpi_rom_size() is called in vfio_pci_bar_rw() on every read,
> will this cause severe performance degradation?  For example, reading a
> 128KB ROM in 4-byte chunks would execute the full ROM reading loop
> via ACPI 32,768 times.
> 
> > +
> > +	kfree(buf);
> > +	return size;
> > +}
> > +#endif /* CONFIG_ACPI */
> > +
> >  ssize_t vfio_pci_bar_rw(struct vfio_pci_core_device *vdev, char __user *buf,
> >  			size_t count, loff_t *ppos, bool iswrite)
> >  {
> > @@ -215,6 +322,14 @@ ssize_t vfio_pci_bar_rw(struct vfio_pci_core_device *vdev, char __user *buf,
> >  		end = pci_resource_len(pdev, bar);
> 
> [Severity: Medium]
> This sets the hard limit for reads based on the physical PCI resource length.
> If pci_map_rom() fails later in this function, we fallback to ACPI ROM.
> However, if the ACPI ROM is larger than the unreadable physical ROM BAR size,
> will reads beyond the physical BAR size be improperly rejected with -EINVAL,
> even though vfio_pci_ioctl_get_region_info() correctly reported the larger
> acpi_size?

end will be 0 then.


> 
> >  	else if (bar == PCI_ROM_RESOURCE && pdev->rom && pdev->romlen)
> >  		end = roundup_pow_of_two(pdev->romlen);
> > +#ifdef CONFIG_ACPI
> > +	else if (bar == PCI_ROM_RESOURCE) {
> > +		end = vfio_pci_acpi_rom_size(pdev);
> 
> [Severity: High]
> As mentioned above, is it too expensive to invoke this size calculation
> for every user read?  Should the ROM size be cached during region
> initialization instead?


it should.

> 
> > +		if (!end)
> > +			return -EINVAL;
> > +		end = roundup_pow_of_two(end);
> > +	}
> > +#endif
> >  	else
> >  		return -EINVAL;
> >  
> [ ... ]
> > @@ -235,6 +350,15 @@ ssize_t vfio_pci_bar_rw(struct vfio_pci_core_device *vdev, char __user *buf,
> >  			io = ioremap(pdev->rom, pdev->romlen);
> >  			x_start = pdev->romlen;
> >  		}
> > +#ifdef CONFIG_ACPI
> > +		if (!io) {
> > +			done = vfio_pci_acpi_rom_rw(vdev, buf, count,
> > +						    pos, iswrite);
> > +			if (done >= 0)
> > +				*ppos += done;
> > +			return done;
> > +		}
> > +#endif
> 
> [Severity: Medium]
> When reading past the actual size of the ACPI ROM but within the reported
> roundup_pow_of_two region size, does this bypass the standard VFIO
> padding logic?
> 
> If vfio_pci_acpi_rom_rw() returns a short read or 0 (EOF), will this skip
> the vfio_pci_core_do_io_rw() logic that safely pads remaining space with
> 0xFF, potentially breaking virtualization software expecting standard
> hardware behavior?

right better copy

> >  		if (!io)
> >  			return -ENOMEM;
> >  		x_end = end;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/31aa2fb273d7ff7ea535c74e0780e279aa9a119c.1791933554.git.mst@redhat.com?part=1

