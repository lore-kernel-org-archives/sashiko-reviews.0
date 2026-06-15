Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DC0374737
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781548363; cv=pass; b=QB7eoz9YjS7EF7uwdM0gGjWJfPZcUbaD5HX54c4kUJZVYusaNkxh2Xk3smLV91R6GjcUp5JjZnWZDnmHN/BPRqAeCjjXWxO+P0OMIvq8CeXoxOytFIie5rRDJs88JzHlxlwOO4v2A7J9c5UmfMkMXFFJy5ZnxnSm4jeWcIYdG9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781548363; c=relaxed/simple;
	bh=eUCd4cJRHM4c506P0iJJojFx6MYUj6RH7trS4Dt2rhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5a68e47nDi9YT6Qs7F2sWvY+4p+UVybP1hzrbMCn4DZAMa6LzVrGP3BPrgGruNW3dN16KnGnPOinaXkhmWpYVJBGm1jG3nHDpqrEHPlIN+c1xZNO7I+1tdehOJiBYj6CQ8BOeIA41I1o9PXKHO223CijvB5EA28hndgngPhXTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XMJTROq/; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XMJTROq/"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13981833e13so965702c88.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 11:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781548359; cv=none;
        d=google.com; s=arc-20240605;
        b=cp3k7LXiJam87nrcXGa1Q9xk6iiyOavHXfUSebCeecHcLUxw/ibaLhOu3rfLd8UiBW
         dFuUQywYJQVn3IiOs+WCyARIe+rgGlcwfvTDKQnf7LQHTJ6hDWprnof9PSBH1kUsZpCg
         3DKi3zSIofVVxQGLdDyodYuRal3YRpz6ewFziKQfk4WNi4cfk03KJz0Zvgn1WdcIS4aG
         qzI6IO2ysQL66be5a6CoazJf+1i+pDMZ7/xYcYUfGh8u8G/PdUZcrO3/2hVQf25Hn1F5
         1s7fmz2L34HFi1C1nYzKftVZc0gWWmZh2otxDSq5mitLE6OT6TaSr9/qWW7L5vPMMVp6
         fQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1m9kOyZU75L8F6PL/t68prlNj72GILewPQGDqJwRY8=;
        fh=4vO6ciVX5a7jzzgYH+uohWI9OArTDe/olgTBHr6Me8w=;
        b=KN3p3Stu9JdogLLHAgXE3XpdY2re4iapgVJbWpjDda9/zTmA0N/SIR7WLZaqama1aA
         rO9TDnwYFSnu1ESsMm+/VsyBqN6tcDfDRTYPtRvNRJ/1yI14wsYt5pv2sE91BXZT2CD+
         ZAR83eUel+KbZ/WZFO+WSvHv7b4t1hV+7HrG3uvQYog4aUzo9GMtpvy9hpPZX8JdSs80
         nl0D0/4Djzp5iGwgxuF4mpO1LyJtGhpiMeXp3KtMHocwBCsiXaxlbs5fYVc+xU3NDkD+
         kH6MwR76t2W+V+I+fwAEv5GH9PAzUZ4Mz7zDBwdoKUKFg5zTD2+RSAk7Qz2f8cIKb2u5
         UZbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781548359; x=1782153159; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1m9kOyZU75L8F6PL/t68prlNj72GILewPQGDqJwRY8=;
        b=XMJTROq/Qi0roZvEwxhI3D8d2wZVCkccb4+M3ApkdsJbV4/0dsBEGjfyK2F8vNMbNQ
         b5hyEjdJqLK4LjgM7DbL/mkLjmf41p6NoxmqD4WqefiuajkjHJJYkeQs0tIPmDklckaZ
         5zIoClkEgC9pXD9cN1KZjr5J/H8DCGmjSJtbEOogeJwUn0qN+b9Z8U9NeiN9t9yQmS4I
         aX8tax66/Y7wr7U/tDgooLy+bqrmk6yZC2Z6QMvpEE0vN1l3A76icOio5+0yDHCF1xPz
         lJo57aS6nFJyCVGTISUr5mVfVadunwoXhCscfwkE26zpAGaou60p51JlwKc+vYyn4SqL
         PsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781548359; x=1782153159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1m9kOyZU75L8F6PL/t68prlNj72GILewPQGDqJwRY8=;
        b=ACu29tmfjMgNanYvymJ/QWVrfaA/vkv2YA00ChfHQBQFzkk/QkbomRP0isOhQpBTYW
         qreqTVoJUsyByDUD5nIANYewwvF2e4Hp+7Bglzjlkshz0k82mmlzEwg/OtDDNZC9aZKu
         w1i4tYBPu81YYBPneH4GmcNg50atHv6lr8Teln8/oEQhr4/kymjCZ0vHBMPlqtbX3Hml
         6So1muso1krHFtYB+bVqpP8D6pnEkIy1gjXDblT05LbfVDvM6x0x/OzXmUd24fegBqJ/
         NAZ5f84cjIzzjOmhZ/suUQ6kxM03IMkbETmjeBPOiyxhWmnaSHUlvmd23sdWE7q223+q
         MOow==
X-Gm-Message-State: AOJu0YxFWEOeBz5MNGOH4kgarYJvmFCDtu2074lWvUe7fmXoxoHh9h0a
	4g4gbZ8mYQDz+EaA0zHH5pg9+pepPfXNY1/jC5utj3d0X4baPJB1eSUc7X7awlPJNOdMEq1bf2a
	bWG2D/rnMIBBvMPUbRrAO7b81Wokc5YurXrg5mJ3v
X-Gm-Gg: Acq92OHewxNZrkakMo80Tz4HLBJugBEc2XOLNthqEpY3AwhPxe4yTxuG6wjvFjqb/NN
	Qstyjqkw76PFwrOkd05z17xVjzQ7jnqNgWLszJWNVhMDbu11P7LOfkqBq3GjywxD3XA+bBfRqXA
	+c7h+49UdUXoTkQo2OKkXCyLo47VBXnGE7rY0ID81gPGh55vNfXI2ZK5m6rl0IsvwKwrbeYTKMg
	0rHu+EYj6rkDDQM06pQit6pPcB5JCSORh251ER310vXnIQKgkwBAsU7yHUwH9NVQYkoMaTmmTFn
	bUX6lyA=
X-Received: by 2002:a05:7022:b9d:b0:137:977e:628a with SMTP id
 a92af1059eb24-1384bb695b3mr6525813c88.24.1781548357704; Mon, 15 Jun 2026
 11:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260613002031.745413-10-seanjc@google.com> <20260613003501.DD5951F000E9@smtp.kernel.org>
 <CALzav=fsuDxGViwyFmhR1RmQKugR_tcj70gmq-492thdxJTDPg@mail.gmail.com> <ajA-5IQ3R5ZO1rSi@google.com>
In-Reply-To: <ajA-5IQ3R5ZO1rSi@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 15 Jun 2026 11:32:11 -0700
X-Gm-Features: AVVi8CeXW89dotygEGvUfQ8kwO0uK3wZRBF_hx_oCn0HZD93ikHved6sUFUl0K0
Message-ID: <CALzav=fQ5FENWgGNEqQrmb-i_9fWTRhLXj2-jZKC_zjM3Kg6PA@mail.gmail.com>
Subject: Re: [PATCH v7 09/20] KVM: selftests: Add VFIO device support to
 eventfd IRQ test
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 11:05=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Mon, Jun 15, 2026, David Matlack wrote:
> > On Fri, Jun 12, 2026 at 5:35=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > > > diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing=
/selftests/kvm/irq_test.c
> > > > index 9f8895b898214..6888be54ee4a9 100644
> > > > --- a/tools/testing/selftests/kvm/irq_test.c
> > > > +++ b/tools/testing/selftests/kvm/irq_test.c
> > > [ ... ]
> > > > @@ -55,6 +58,36 @@ static void *vcpu_thread_main(void *arg)
> > > >       return NULL;
> > > >  }
> > > >
> > > > +static int vfio_setup_msi(struct vfio_pci_device *device)
> > > > +{
> > > > +     const int flags =3D MAP_SHARED | MAP_ANONYMOUS;
> > > > +     const int prot =3D PROT_READ | PROT_WRITE;
> > > > +     struct dma_region *region;
> > > > +
> > > > +     /* A driver is required to generate an MSI. */
> > > > +     TEST_REQUIRE(device->driver.ops);
> > > > +
> > > > +     /* Set up a DMA-able region for the driver to use. */
> > > > +     region =3D &device->driver.region;
> > > > +     region->iova =3D 0;
> > >
> > > [Severity: Medium]
> > > Does hardcoding the DMA region's IOVA to 0 cause IOMMU mapping failur=
es on
> > > platforms that reserve or restrict IOVA 0?
> > >
> > > If IOVA 0 is unsupported, it seems like iommu_map() will fail and tri=
gger a
> > > test assertion crash instead of running.
> >
> > This is probably fine for now given the test is only for x86_64. But
> > if you are going to send a v8 you can use the VFIO selftests
> > iova_allocator to fix this, instead of hard-coding.
>
> I'm confused, why is this test setting up a DMA-able region in the first =
place?

There might be some devices with which you can trigger an MSI with
pure MMIO. But most devices you need to at least set up some
descriptors in memory that describe what action you want the device to
take and then use MMIO to poke the device to read the desriptor and
perform the action. Reading those descriptors is DMA.

For Intel DSA specifically, send_msi() works by telling the device to
perform an 8-byte memcpy and send an interrupt when it's done. The
driver region contains the descriptor for that memcpy, as well as the
8-byte source/destination buffers the device should use.
