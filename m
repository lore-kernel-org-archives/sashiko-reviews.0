Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55709261B71
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 18:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114768; cv=none; b=riQUYdgxfB/Gg/+mD9oe+kMQtWteOuwRybZWw8qTy5ov3fX8tKQsyseg85A6B0JFR76QoJiopmSapf/bA5KQFXzLAIc1ncspryXIwt1cKfIpdkOfO0imtGnf2+wl/OLtPqU8bHrvqzxMryN7bcGNNd/Ip37E2Niv2J3Lw9dNugI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114768; c=relaxed/simple;
	bh=k6GjeYxgByZDSIuzADvt///QHoQS2Zd6HyjRvMqVz9k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nd+x0+SEVUMNl6qLbjW/Bl/qmIC57X7fi/hoPArvPq15gV2/vfo06Az+veDpdK92QIUci5wQmqe9H2S8WrO+u5JT1Biaqvkex6KmJVPcwQ/pKW2qZ7xedcpnpJi+dOB8VgJeuBf3iy1LXVcPFaq+zUlNh4CJAx9PnaT9pcXFRMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MCiSlvEM; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MCiSlvEM"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-84238e83851so4434475b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 11:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781114766; x=1781719566; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xkFkBgd+xuByNIegpgrKJZN9LP1SaVEtSyMl1cJUNS0=;
        b=MCiSlvEMNWKzI9MxU/QsPKnyqhP6oBOL6amkiQz3diNCiyE3uVOMvcXglLXCT3dkrB
         BAQ1XkFht57xzyqw3prtt1ErmVhlQ97tEi8rjpXTR2S7td7aYyphuNS7+ihPseXjJDzv
         sbMPsXZk+yVG6QMIxWKfCHoY+pHyy4ZwZkVtm+TvTgk/+WH8Nie0mJofk064oDDgCLwe
         uC4nTQorx5PYFN3iRctxo6gHnpqxR68H3tl6dQEdZgUvg2FnksoBv315cInocKAJUq51
         4BcjZUCGbSlS+mtwsCDbf5xKHH2O048vJwJ7ueofr1afE26Qj1ac7XNOyjfxQEYyUnbc
         naZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114766; x=1781719566;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkFkBgd+xuByNIegpgrKJZN9LP1SaVEtSyMl1cJUNS0=;
        b=DqnUUdC4DdyUF0Y6hl736Os8YJbf9bPQFvZIP/diNCevYtUjOSxlA88uvKiAOeXMtm
         fCUoS27DJ/sVL9dg7Eap+O2vzrwaNY83Opy9WHXKTcO2xr5GU4SmkkAPAFlaVyddBCsa
         LtmHXu4aHB5tNppQbhhztuN2gZR8fHoWXxlOCmJyQj1D+NtMMv41+KQnf8ZV9N1yPtfD
         DD/3LSGSA9EP6ZoJvHqUs0QT/85mux8+f/la8tGYMD3Z7BXN5yE1C5DCkeVFEJpMEAa1
         mb/vtPumAYt3wEIZA0dmtsc+JZjLpwbYxHLIATEEqSdSq3HYAkfjOTvlIE3ETppIR1rk
         9c6A==
X-Gm-Message-State: AOJu0Yzlo4CH7Qxpx/MJt0aLEXRXFRF06686nDG2VALaq0foXQ3GmCIV
	OwRFjLeRHHHJ7RfxfuuTnZF2LB7GxDkbd+FM8vNzc9QvjePdFT5Anh9IkD4mC7mh7hfw6ujyXh5
	0nPljxKf6jlzuQDperuqMiBywTbiFibR2yrKTFzcz7vFuZjNJYihDQ311m1dmatJ1/FHWIOxdtm
	k8PZ0vOhgrb9hpM8xM1xXyvcz8N2p4FqsLKoRaejQ4snKZKh/0
X-Received: from pfob8.prod.google.com ([2002:aa7:8708:0:b0:842:47f8:d51d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2303:b0:842:3be7:4d55
 with SMTP id d2e1a72fcca58-842b0e588c9mr27119419b3a.11.1781114765452; Wed, 10
 Jun 2026 11:06:05 -0700 (PDT)
Date: Wed, 10 Jun 2026 11:06:04 -0700
In-Reply-To: <20260610010517.1333F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260610005338.2967132-8-seanjc@google.com> <20260610010517.1333F1F00893@smtp.kernel.org>
Message-ID: <aimnjHurnYPMI5ii@google.com>
Subject: Re: [PATCH v6 07/18] KVM: selftests: Add VFIO device support to
 eventfd IRQ test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 10, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> > index 9f8895b898214..6888be54ee4a9 100644
> > --- a/tools/testing/selftests/kvm/irq_test.c
> > +++ b/tools/testing/selftests/kvm/irq_test.c
> 
> [ ... ]
> 
> > @@ -74,11 +107,29 @@ static void kvm_route_msi(struct kvm_vm *vm, u32 gsi, struct kvm_vcpu *vcpu,
> >  	vm_ioctl(vm, KVM_SET_GSI_ROUTING, &routing.header);
> >  }
> >  
> > +static const char *probe_iommu_type(void)
> > +{
> > +	int io_fd;
> > +
> > +	io_fd = open("/dev/iommu", O_RDONLY);
> > +	if (io_fd >= 0) {
> > +		close(io_fd);
> > +		return MODE_IOMMUFD;
> > +	}
> > +
> > +	io_fd = __open_path_or_exit("/dev/vfio", O_RDONLY,
> > +				    "Is VFIO (or IOMMUFD) loaded and enabled?");
> > +	close(io_fd);
> 
> [Severity: Medium]
> The commit message states that the test will auto-probe IOMMUFD vs legacy
> VFIO and skip the test if neither is available. However, probe_iommu_type()
> calls __open_path_or_exit() on /dev/vfio.
> 
> Because /dev/vfio is a directory, open() with O_RDONLY will succeed if the
> directory exists (e.g., created by udev or left over after a module unload),
> even if the VFIO module is not loaded and the character device is absent.
> Opening a directory does not trigger the kernel's character device module
> autoloading.
> 
> If this occurs, probe_iommu_type() incorrectly assumes VFIO is available and
> returns MODE_VFIO_TYPE1_IOMMU. The test then calls iommu_init(), which attempts
> to open /dev/vfio/vfio and will fatally abort, resulting in a test crash rather
> than a clean skip.
> 
> Additionally, using __open_path_or_exit() will cause the test to exit rather
> than skip if the path does not exist.
> 
> Should this probe instead check for the /dev/vfio/vfio character device and
> use open() instead of __open_path_or_exit() to allow the test to gracefully
> skip and trigger module autoloading?

No, "probe" here means guessing which flavor of VFIO vs. IOMMUFD, it doesn't
mean probing a kernel module.
