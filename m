Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5D938F24B
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780478673; cv=none; b=opnjjXNldnch8oHVKhtKaBinv4x7TkOhFp0j7k7JXB+QUfwmGgeQu/60RCEpQUmCQQBY9OQ21UTasC3gN3QEehTi9GTveyx2DOZu6mvyd3F0KXlMGJ+A+KcRL0g6WTUySdIM+1DwXXQtLgVkz1x+eamOcVmQw5Pc7CuczkBXpGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780478673; c=relaxed/simple;
	bh=tQj2iyJK/ty6qWuD2nWo27J7s0BD+yJmE/SnLkDfTOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpf4tqP66/Z6mMjTk/4nAxB4CRJ8NNO2uliqpd1B4v9ufBCd/tWvEpwAOFZS6bZSji3rtkD1UnDhU45zpfFVcozxrJNQk/kB6D0rXTDlTRao47/ZM963GPmKKlNM5QMWbJNWVIrrWwpS+kvOciBLaSNfaqsXu2r+eFsa40ujnbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBwz48OA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBwz48OA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so2370827a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780478672; x=1781083472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+evDZWLT5KzG1ZaMkX3r55/gKlKfN0VfS6IPwHPUrVw=;
        b=pBwz48OAy1yQm+LRRB7umnWHLNBp9+4cjQC4jIid3w+wwTU+Vjj/vAo4+bcdpxVDIG
         eEJTBfARmPL90Z65gpEdMU9cJ0mTMN0fkaxHLhYZPNxcsLrVrey9JhpTaNuFOwOnoimC
         EB67X4iJpGEUIgQwwEWdkovs0Zr73cWQ7JLT5O9do0LamV9Q9NqFFykIA2ju9KTsi1PG
         XQKx2yQuoc43J3qeR7mQhT0RiEtNpFgLHiI0uQNIyWq2QCL0MwmnHkOIqdoxxJTOPBCv
         Ly2/9D2aekQqYpRRKZsVDgfFW1kFJUpvby1EWVPiWsjbSlnQy8HtsEOzx3kIn67gmBeh
         joQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478672; x=1781083472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+evDZWLT5KzG1ZaMkX3r55/gKlKfN0VfS6IPwHPUrVw=;
        b=g7ePiae6XJJybftH91aS6Dyg1wLcFIgcMnatYaV9bx/ZPW5xp6k7JqJjtKn4o2G3o6
         /iyyOw0jqSH3TrvyXrQjeydWjWy8y9xzpk+i46xJOm6zOWQ3rv+KyYAQyWI0QriXt45B
         2EN481m7U5Jlo/NpBPx/5cLc+kosVMuNecdANsPZ9uNJlg09QP2xofQ7Ng3BLRXV9fhF
         idxAV8AeLDdR9w/YRQJpMWJnQ3MIQmVIQgtSuS4txGTg8IBbwHLABIpkPuPoMWMKjZiS
         ZWTu4VeRg0NCbQwN8uOIClLTcza2VhcHGJnVZOzSJPRpCnU6iHr7ANamESZdGt1tKHZb
         MbnQ==
X-Gm-Message-State: AOJu0YyNt5ZWpUdLL9TTOvLpslPdjSsfBKtEmFSSYMqgDTw3bw7UL2JG
	64l+U+BIu8aTB+jmWKKC1iouROSl3F+4unTnUpqLTf3pQmBit8raThBj
X-Gm-Gg: Acq92OHPVj9Xv8HK+tGV5zTR+j7GCtK4IKcKK6e2TiG8ZTi0TEeAD0kwLLSvK6Nuc/2
	m6f4OFUJ4AcSWv8+3fjWur2iDxZYk/IiEnjtaf9DsqoXsmW8kQnZFkIyQE4n9TUVh2+klF2kOvF
	+cukoXpFnky+tsgXhc8+JswFqD5Nik1uK6FH1wZvZuSZyC0PGh06CGKOgEVpH5ENfLZcP89abJe
	iSwWgI+uKNa5SRVhxYJzUrhTQReU6TGDkhbk/0S81nT4p0I08l7KbPein6TocAPnCRMxBOXY4vW
	GlmYOYAav6l8kYQ2yhWgYxrXcSX5MIdidSkpDoB702pl8f9yDSpfLl+C1EokDsmmCSo0RqMgsYU
	1yypWVkPdC6avsnZfWwFWV3tEA75KGPwDOQ/Ww/ZtZQVR73Di38gVyonjrkyjn4um12ScJhQtQp
	r4c4bs3+BOJgUXUGLdputxPtWTSRrgt1yFCA==
X-Received: by 2002:a17:90b:2d8d:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-36e32285cf3mr2634132a91.14.1780478671804;
        Wed, 03 Jun 2026 02:24:31 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a276ef2sm2484283a91.11.2026.06.03.02.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:24:30 -0700 (PDT)
Date: Wed, 3 Jun 2026 17:24:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <ah_yGaCYLnTL1nyW@inochi.infowork>
References: <20260517014841.254085-5-inochiama@gmail.com>
 <20260517024848.4F346C19425@smtp.kernel.org>
 <aglF_fbl--RgS7gQ@inochi.infowork>
 <20260601224224.GA116470-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601224224.GA116470-robh@kernel.org>

On Mon, Jun 01, 2026 at 05:42:24PM -0500, Rob Herring wrote:
> On Sun, May 17, 2026 at 12:38:39PM +0800, Inochi Amaoto wrote:
> > On Sun, May 17, 2026 at 02:48:47AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > > - [Medium] The binding completely omits the `interrupts` and `interrupt-names` properties for the host controller.
> > > - [Medium] The schema omits standard legacy INTx interrupt routing properties (`#interrupt-cells`, `interrupt-map`, `interrupt-map-mask`).
> > > - [Low] The `phy-names` property lacks an `items` definition to restrict valid string values.
> > > --
> > > 
> > > commit 7b8ba34456e71d6a9cf1028caa5504d64e8f58ba
> > > Author: Inochi Amaoto <inochiama@gmail.com>
> > > 
> > > dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
> > > 
> > > This commit adds device tree binding support for the PCIe controller on the
> > > SpacemiT K3 SoC. The controller is based on the Synopsys DesignWare PCIe IP
> > > with some extra link and reset state control.
> > > 
> > > > diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > > > new file mode 100644
> > > > index 0000000000000..46147a37a9ce6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > > [ ... ]
> > > > +  reset-names:
> > > > +    items:
> > > > +      - const: dbi
> > > > +      - const: mstr
> > > > +      - const: slv
> > > > +
> > > > +  msi-parent: true
> > > > +
> > > 
> > > The driver implementation reads and clears interrupt status registers for
> > > host-level events, and references registers for receiving INTx events from
> > > downstream devices.
> > > 
> > > Should this binding include interrupts and interrupt-names properties to
> > > document the host's interrupt routing?
> > > 
> > > Additionally, should standard legacy INTx interrupt routing properties like
> > > #interrupt-cells, interrupt-map, and interrupt-map-mask be included in the
> > > schema and example to support downstream devices that do not use MSI?
> > > 
> > 
> > The driver just does the interrupt cleanup as it requires, and no
> > additional interrupt is needed
> 
> Unless there are no interrupts and only MSIs are supported, then you 
> need to define 'interrupts' property at least. The common schema only 
> defines all possible names, but not which ones are used and the order.
> 
> Rob

Yes, currently there is no interrupts that should be enabled in Linux, 
and only MSI is supported without INTx. So I think it is fine to removed
the interrupt properity.

Regards,
Inochi
