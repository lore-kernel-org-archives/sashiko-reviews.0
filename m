Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501E36F8EB
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473280; cv=pass; b=A/DjvRCiZfFqSaQQ3VBlaYTyCOCJvOVOn3dmwsChm+9mzmEck5Km0ND+EtVKTqaDN0nS8W119h8r3SDic1BztCFsoiUQ32cQO5aDpx4bcwtcOuq9PEi6oir/FYVpzg/zFEdjZV5RK//P309D+pc3UmrYbHIvKivft2TA12J3Quw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473280; c=relaxed/simple;
	bh=MDd64Rn6knYwkPwXNffQKODVkuxF0Aba8Wwr7ELMdyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ER4ygEkRo/e5/q0csTzsO/Bx6xtkxW4OjOb64+p4DfYdZCaK3b7ZSL1WBGFFxRM4gbgcmF8BLxL3QrT4o17hVyFmLFBN0gZCHPu58KG0vhfvpHmjkPSJWiE608Pp+87mI3jLzVf/GLTLrekGQZOoieWE+x8QgNmpZmtu79Wbo+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bT0YcQyG; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bT0YcQyG"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1363fe80fe8so2350897c88.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 11:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779473269; cv=none;
        d=google.com; s=arc-20240605;
        b=UaUYUQPTzo6eYOra7z6lHfmnFfei9+HsUiO5MAvAenuoio5rQf8lEhV1/qNj1kz9cA
         LRMFqveuiljEn7gWUx5aPuVs4uXRdt6PYjBcq4N/YV4/dFgjF3AkjMAl61KlN29eLwXQ
         0qVai5FjSLgV0MQulwa7UrpQueEKUSKe9F8nYWExlrGExvAX20en0dJgagSz4tx8HyFX
         zKS7WjKJumMB+W/ciXw+azVAVPXsqb9CKdrPbrVWFLOogH1IclRRB0V00tzxOQSX/67b
         nbcbpIaZ/9G3EZaJ1awxXOLu7Cio9tWaRUJ5egk0I18qhB3lyB+ydZsM2kqsX5F7Q8EE
         eqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+XS59x4mW+gcdVuYMoKcEzUvLfDzChrrzvvmZUFTjA=;
        fh=8f8UKsEGnfOnQcg6tnnw/XUD4pVpxYDyih6X+El7c+Q=;
        b=PcOotyG2StB18Cy4ne4666BuPV4ctSnu2FqextyY3BaAj+89Bgstx0P9Yi3L6iZ5Wx
         EO2QBAOMunNoPxMfnS+qp61bjd8B/WcWEcqHxGN33/ZOAldQMBSA2SkCQLLWenEibCYq
         UpXX/AMIEBBBD+HwTAqnPm06JQXxc5aImm1oFOGBusyxvSxlboXw+/5CghyCGafoUPNg
         4j38ZM1fIqqLhSorIx93eRhF9na21gXJZonRwsMgMqQtpwlTerpS5SGobTVHkLabyXtx
         JgA+oKnRIjC/YkEBPdhUexj9YoaVooVsvjyYGQw0CKRzPLxCQT/P/Tw6J8DCW9F8Pwnd
         HRPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779473269; x=1780078069; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+XS59x4mW+gcdVuYMoKcEzUvLfDzChrrzvvmZUFTjA=;
        b=bT0YcQyGNQk7F5MDYrFJa75YxHcxk9dT6NgVonyiI+X/Jfr/ncVLwleDi77Ekcn9Vp
         AX4x87xtAEOxkDf6Ml/pj0FWtx0eu/KQ6+NGo3SzCsEHtnHG9GDwVf45N6hVqfr7R4T2
         WCADPJhbF7AQ3VmnWCca1kXTOSTYQHdzAvqKbK6hWUTVs/d82uNsiSw5w0iwlbwvcHIG
         XG957sNuw68yuoJnuP2Oxs2drb6VUivprzArADeMu9RmuNCRtovz+OZUoz7L8wtgTAIQ
         gHE2e0Ls23XnDavqGrss7h9GKfb2y1WIsvpmNlbCnmwFQNxKfIqE0zqPqXxPJXebs7fs
         d0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779473269; x=1780078069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z+XS59x4mW+gcdVuYMoKcEzUvLfDzChrrzvvmZUFTjA=;
        b=XgusLlZfMpeeYxGQqw0xGoLMgVOuyHpwyB/PZ0fNsutR7VlkQewAIzDJOyYpTmOs3i
         oIcPYoiNvduNVEVEUtNMdpojp0aA99QZ6nhY8bUSKowM9YSFFWa+40mIjyB7Uba1RGv2
         hA9cZKf7P3XvaOoJEDoowWHOji7IID0K07pMkhBZKdt3JltJT5q07kl6ZNpTnBZL2aSc
         OrdEEu00ajUjaFNSf5IFQqwBbaLvSk+FRXMZRlvtBRDRxGNdJXZm3VYlCMWMH6z4nWJh
         FXwZXklGc1pg1rdiOPaFO/A+CrjIG5TKYY+g7yXHDbZHpYSoI6E/niUBc5c+R8PdwfqY
         oCZQ==
X-Gm-Message-State: AOJu0YwRa9VDCiSN8qNZs5vJsbI9KMjSyG3fXu04mqcNMFjQjC7Ecm8a
	QlkpjyuW38gaA9cBEWNjBpvgyptnIvqU2vndND9H3XaRmvlp4IO7TuYpQY/HOXTlgiJtSyDjCG5
	H51bDaL8jXHSqmjnpT1ag6UZo3raLUIxRKhs/Has2
X-Gm-Gg: Acq92OGh07Nm8Kh/D6oVMLqvpEwV5U4PJE2yJxyKRrv1OC1h7mvHM+vkDLj3/bLCIno
	CpZbjtSClaYdANC2Y2arb8ErMhKIzWVEdf0u7FDveFQG9hs7RKUm9LeYYt0guMXmw06kuvL4lks
	4JTyXONwTXBojw+CdIbAA6WxU2tsMl4eg3u9d3FD7PfBSgd80Lit2W8QbiT2Nd4gECGxRBFaauf
	gTTv5EolD+9BuG6lYHeGyD605VkEYdoHVcmTdfHXXZw4434aRmICd5FGVoSePEQNybNkGivDZKQ
	XIJf/gJrpTD/fAPXqQ==
X-Received: by 2002:a05:7022:4389:b0:127:366f:8bb7 with SMTP id
 a92af1059eb24-1365fb42bc7mr1819801c88.25.1779473268539; Fri, 22 May 2026
 11:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <agYRd0xQs0r8OOKA@google.com> <20260522175755.GA231746@bhelgaas>
In-Reply-To: <20260522175755.GA231746@bhelgaas>
From: David Matlack <dmatlack@google.com>
Date: Fri, 22 May 2026 11:07:21 -0700
X-Gm-Features: AVHnY4IBRkkx9GaAizC206BO1dRg9LDjKqpxgskMN3l4JRz54CwwdaiR9o3pFEU
Message-ID: <CALzav=eDB6kFdsHPWGjpq4RAO_dxjD5cxgLCnpj1mEjxOUTwsQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] PCI: liveupdate: Track outgoing preserved PCI devices
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 10:57=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
>
> On Thu, May 14, 2026 at 06:16:23PM +0000, David Matlack wrote:
> > On 2026-05-14 12:31 AM, sashiko-bot@kernel.org wrote:
> > ...
>
> > > >  static void pci_flb_unpreserve(struct liveupdate_flb_op_args *args=
)
> > > >  {
> > > > - struct pci_ser *ser =3D args->obj;
> > > > + struct pci_flb_outgoing *outgoing =3D args->obj;
> > > >
> > > > - WARN_ON_ONCE(ser->nr_devices);
> > > > - kho_unpreserve_free(ser);
> > > > + WARN_ON_ONCE(outgoing->ser->nr_devices);
> > > > + kho_unpreserve_free(outgoing->ser);
> > > > + kfree(outgoing);
> > >
> > > If a driver fails to unpreserve a device before the FLB is torn down,=
 this
> > > WARN_ON_ONCE triggers, but the memory is still freed.
> > >
> > > Does this leave dev->liveupdate.outgoing pointing to freed memory?
> >
> > Yes, if a driver unpreserves a device without notifying the PCI core
> > then that would lead to the PCI core having a pointer to freed memory.
>
> Just a curiosity, I guess: How is this possible?  Is the driver
> responsible for doing a generic unpreserve and also a PCI unpreserve?
> Seems like it should do a single unpreserve, which should internally
> take care of whatever PCI/IOMMU/etc unpreserve is needed.

When userspace unpreserves a file (e.g. VFIO device file), LUO calls
the driver's liveupdate_file_handler unpreserve() callback. The driver
needs then to notify the PCI core of which PCI device got unpreserved
by calling pci_liveupdate_unpreserve(). If the driver doesn't, it
would be a bug, and it would result in LUO later notifying the PCI
core to free its outgoing FLB while the PCI core thinks a device is
still preserved.

> I guess the requirement is explained in "[02/11] PCI: liveupdate:
> Track outgoing ...":
>
>   + * ... Drivers must call
>   + * pci_liveupdate_unpreserve() from their struct liveupdate_file_handl=
er
>   + * unpreserve() callback to ensure the outgoing struct pci_ser is allo=
cated.
>
> I just don't know what the driver changes will look like.

Right that's why that line is there. And the WARN_ON_ONCE() above aims
to catch future buggy drivers that do the wrong thing.

The VFIO driver changes can be found here that build on top of this
series can be found here:

  https://lore.kernel.org/kvm/20260511234802.2280368-5-vipinsh@google.com/
