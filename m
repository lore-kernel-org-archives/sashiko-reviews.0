Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EEF4E9C0E
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743573; cv=pass; b=FchFs39ZvVm//7ug1BexxR3nd1O7dotUt6h4wonRSYZGmhtZMSUCjUtDu9kY8Sv9mh4opSdR7RNNAQX7YfiSco3k0tOME091GpKv6ZvDv3YA+p2NBldVBj3FBvdKlfc8r+nNvAQ/rH6gDP4fqci0dOiO32ONHAWQLpETr1UNIzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743573; c=relaxed/simple;
	bh=9/KuOEAUccINW8RzQoPd+Ke7JmL5bSGUt4d83wOmGis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FC6UE3J3CCLh62XJUre3o06FdDaX3nO6/5VFlTZhCPNqeVM1g1U8DJyemQ9hGifXF0hC1ZBJSj5IdZYKtu/85k05CKwm86lOEIHQdX5P0WUGnlTFKGkta9A4ciEPYedOFivbSTf4gFVSaiD0l4DjiQ0kndwJrjo0O27nbRAnz7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LRkUeDDy; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LRkUeDDy"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c294ad260fdso124679266b.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 07:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789743569; cv=none;
        d=google.com; s=arc-20260327;
        b=BTUFU7engJYvIb+pw5Kyb0oHvmJlgWd0gAwtHxgL9Io7FhYjjlBUbV1+ewH9wEfpYH
         q0dckA2jNMCrIfEg41LZLN91hCoGKUyBe+6Eu05Fddp8Q2anpyJuDTDOHDVCpEgvhAtM
         g7R36XjOoW8hNzcWgh1Hnp6W1acS3XpHIbhxTJvQ05Y4w+zcx/F05wCTlebaoNMxE3vr
         CBJNZ+hiZbzaa4Oq0JUXW5OTmQtgTH96tqXY2cteH9hR/IWThlaa0evABjytDI6GXFXq
         33COos7cIX3vxNad9frE7qN2Jp5JAgxDqmisnU6GT4xrCxBwwv5+8fXZskd/gkHb8NEp
         Xp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YC0PefwLkxVBXTBsKzjOWy/17vdgqLJp4+m26mDaKG8=;
        fh=DVhPP+3RdotDD+5reLfhnN4x/2zAfGOzr4sDhhU9Xa4=;
        b=EEvPsyNLIgFH5pdWXw4kYhhD/T9oKx+PY35rkVHKPZN6B7QVoPH143ZLqRhQ6sassQ
         tybRs0VSCaR3ACmNJaa9V1FZt6ojhQVPZCxKNPgL2xTfRRx2wpWcMQx0296FMt15/Xgn
         PK+JZlRkCKzq1Gj3Do7ral/7by+yUsuVpUE4pFzayoiV+AuQ4+zMmy1VcvtRMRhRwAyx
         1X/nRFGoeUDQdFh2eXtFzkQW/4iIUzBAiArESFIX2Vv7l6YAmxxpOqLC/lNGa9bBlKyE
         Clq/9elzFr4MZcktJJfAy19ywziVCtLsxZER3lsiT560soX7/STzjPAdQ4D7U36p/szR
         YD4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789743569; x=1790348369; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YC0PefwLkxVBXTBsKzjOWy/17vdgqLJp4+m26mDaKG8=;
        b=LRkUeDDyeLPuaNJkcs94XdgIyy8uagN0Sx51rIZeWEu1VZ6OTk9iLORUcBZyXhk8Ue
         x1vr/gytigJASawIVkF3sD2FpiloY2eeYs1rYlBmTTqdrF3Fi2c/jDgl+ygOIVlQbbWE
         F0LgTK0t0UoXnE8N8cVE3Rq9Yo+CwlmJ5XA4ldsInVMjQ2u4ohe1pA7RtddIOVtptp9K
         VO2FKRGdrAsGhIZ23krl85w79LQVzoYBg7ZtBDFVjZ/7/dTmgJjd2ZdIjbDzNbXUgAZV
         zNntrpOTNmvwHo9YWR7t1WtQ0HdrLFrH/hbAfLANDGwMhTp9zD0BkkNYroQB9LiSZ6Bj
         3z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743569; x=1790348369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YC0PefwLkxVBXTBsKzjOWy/17vdgqLJp4+m26mDaKG8=;
        b=HW+PpvXLQgiiPJfT340BobuKgXU+mDZMK0J3Zu4Lzo9yqNVQyx6zW+Kpn1iO/nBAHQ
         xhRaO0Sg1Sj9/WH3XZNGfKEuJ9jMFDmMwlVVZQFxY2AfQUacW/rBOEMi9QxqcyFTk5fd
         lucPdPKtBn6ucCHrVoPuRkDqSE7kCjyVaOkTOMc3Sx86qELe/bLnrd2rkkG47UPqNH3f
         YNeqNJ6sn6JdAW7cGz4c8y9SRIbUW2m+UEevPuSVLedVH0H3Q/vvvUrZxBusIse05OPb
         pP4R53wuvYucQc57/9AlRWt6MlreWb2jSFitFWp2gQU8TCPgHE1h3kpkqkMq4JQUBEUm
         GwEQ==
X-Gm-Message-State: AFuF++m0l8ohwUO0de9ixGQNC62eF5A2H2vnfoyUwRnfBeaPwJY9BtS6
	zaSdzryqp/OhERDJ6Sjt1YnEZCNGyZoV9dtdYyQkR2ngVAX6SuUBhFlyra+DOAJReh3aQ25kWdr
	CDhyArxGWeV9VTQXgJRTBe5Z2+PAr8Br5OFr3LIfh
X-Gm-Gg: AYBFou1o65G2EC8cvkBM+9PoXN0FSppEQcDxwqNFI+ueWegabDNv4yUJRcCP9FBX5KR
	z9NsIY6c2uIvy/prRQpXoeT+UaOckv+VgP7ADCPRslWDko869YdN32G+zKd/z75e+nL0d4IpA25
	LmqrhNKQnGwcpxAXguGAS/IG77gvshbfrCTRgkMuct7/krJdkN09yI8Hku6KDoFiuqJFsDcJ/SB
	fiaEZpf1U/8my0t/E53QxnmTv8dpU9hqbszgs5YSc8T1rCzSE5ERv8KsxPe+pHjQgn8oRjJuSaN
	9P1gN9/souB2P52417wACXpRaolaLR6MAk5mc1RIUn5VfhgIwDRlLZDE
X-Received: by 2002:a17:906:ba88:b0:c25:f7dc:2da with SMTP id
 a640c23a62f3a-c29f5473df2mr602164866b.27.1789743568771; Fri, 18 Sep 2026
 07:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6-v6-8af36cf7b73f+e2-mlx5st_jgg@nvidia.com> <20260917235245.CAAE41F00898@smtp.kernel.org>
 <20260918115217.GA11142@nvidia.com>
In-Reply-To: <20260918115217.GA11142@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 18 Sep 2026 07:58:58 -0700
X-Gm-Features: AcwNN1X4V2ednysXTROsIDMbW8yLdztMha6mDhRxWrhyVFhdILawxuBGR-T7aI0
Message-ID: <CALzav=f4NTb4Csn2BoK5kk=MckFRvbVnOdO9yiCz8MLXdRMPOg@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] vfio: selftests: Allow drivers to specify
 required region size
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 4:52=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Sep 17, 2026 at 11:52:45PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] selftests: kvm/irq_test overwrites dynamic driver region siz=
e
> > --
> >
> > commit 97ad8ed7fec97be65848236fd1c8afab2ff66a54
> > Author: Jason Gunthorpe <jgg@ziepe.ca>
> >
> > vfio: selftests: Allow drivers to specify required region size
> >
> > This commit adds a region_size field to struct vfio_pci_driver_ops to l=
et
> > drivers declare their required DMA-mapped region size. It updates the c=
ore
> > driver probe and the vfio_pci_driver_test to use this dynamically probe=
d
> > size instead of hardcoding 2MB.
> >
> > > diff --git a/tools/testing/selftests/vfio/vfio_pci_driver_test.c b/to=
ols/testing/selftests/vfio/vfio_pci_driver_test.c
> > > index 761bf117d624f..2bd949aafd731 100644
> > > --- a/tools/testing/selftests/vfio/vfio_pci_driver_test.c
> > > +++ b/tools/testing/selftests/vfio/vfio_pci_driver_test.c
> > > @@ -87,7 +87,8 @@ FIXTURE_SETUP(vfio_pci_driver_test)
> > >     driver =3D &self->device->driver;
> > >
> > >     region_setup(self->iommu, self->iova_allocator, &self->memcpy_reg=
ion, SZ_1G);
> > > -   region_setup(self->iommu, self->iova_allocator, &driver->region, =
SZ_2M);
> > > +   region_setup(self->iommu, self->iova_allocator, &driver->region,
> > > +                driver->region.size);
> >
> > [Severity: Medium]
> > Since this changes the vfio test to use the dynamic driver->region.size
> > instead of SZ_2M, should tools/testing/selftests/kvm/irq_test.c be upda=
ted
> > as well?
> >
> > It looks like vfio_setup_msi() in kvm/irq_test.c still forcefully overw=
rites
> > the dynamically probed size back to 2MB:
> >
> > tools/testing/selftests/kvm/irq_test.c:vfio_setup_msi() {
> >       ...
> >       region =3D &device->driver.region;
> >       region->size =3D SZ_2M;
> >       region->iova =3D iova_allocator_alloc(allocator, region->size);
> >       ...
> > }
> >
> > Will this cause the KVM irq_test to fail with a VFIO_ASSERT_GE during d=
river
> > initialization via vfio_pci_driver_init() when tested with a driver tha=
t
> > requires a larger region, such as the mlx5 driver mentioned in the comm=
it
> > message?
>
> I have no idea, Dave? Did kvm start using this stuff?

Yes, KVM started linking in the VFIO selftests library in 7.3 and
irq_test.c is the first test using it.

Looks like that is also causing the dma_rmb/wmb() redefinition
compiler warning from the kernel-test-robot.
