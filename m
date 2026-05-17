Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5632275848
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778992755; cv=none; b=iRFy8JFBVVmnwUFmv8Rv5uvE4RfO6c199nxUUYhln3z2zAeqD/NsEXEns1xR79RhXpkka7qsRtF9pWU6vbMXFw/dn1E69lJOYszOcK0/3WpfYcZ34vXB/AB67+d3GFSlzNC+L3BJcAEw7/pVPZx+l+loyh7B9fxjXWDMfnXmy0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778992755; c=relaxed/simple;
	bh=B53Eth2f9zx7Ds38V+i6Tl5WwFoLUCpbyhLtK9uDXwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7zMpTV3Lp4uI4gOEo9tpMOX0HNZsls9bHl/fma/3rCQK3xvXSeTqOfpBvZZ3ekZFKwc08IBxteFsW2RN0SzbW8fX7qLYavKhu4CALxE5mbvHN5AxdbLAmo8WOwT8Q5ElvTM4R1tMtTiapwNcbDCb8gXxxBsGlwT7NbEt8MHW8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tz4dZV1/; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tz4dZV1/"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c801b30188dso434548a12.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 21:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778992753; x=1779597553; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9YiFxSU/JN6ra5dSPQegj5u+vVdgZzmNJtIRWj7eJHA=;
        b=Tz4dZV1/Exh2cXda5JfzeCc66sgKJbews3Lxc7mCVq7rq5RZ9OyCMAA6FZh+4/ZFiR
         mQBksiqX+brYf27ulnveJx7XxwudJHNFKqHOK2ET2UFu6UBAxWVyqkTtWifsC/J1shET
         Ekij+jw0rWO4hIDU7HUCfQAzj7kg+DQNN7/kk4dHD9iHPoJqZs0DNJxivuI1GNP2veoo
         ZzbpVD8DNXhmFdP0BakJHH4l9jYnBj+ZjznVfUH60L+YNVM/Yn/c0LdN8gHZz5q5RTYu
         EgmU4Y5ZLWHdJR/Mx0A3OkvxNWAmsOJ879lkFHQd43d5v6pEY4pU//5N9bm/tel6VSBO
         pbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778992753; x=1779597553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YiFxSU/JN6ra5dSPQegj5u+vVdgZzmNJtIRWj7eJHA=;
        b=L3vQvhvIibqhd/eby6LQheDtxfZEoD122/+CCyvo+w52tP3J9E1vLJq2aSe8OQrdgc
         eBONFhpuJ9hKONG8Lw6KubjK4LGkmARVFzvVVrb4j2Y3IM8XlkWsCnc66QfJ4gjJ0WcO
         T6HvyN0Bc8C9659/7jSb6accp4dhLBSMIs5ep9aChFcKxsR56aU4bMLg3IU3mZKmOq2a
         HAO8odurNHEaZYa+pYcetR2x66Y9Hk4KWRWkpM/qY8kQB25TrRlkZlBHZK98G9/xichB
         N88FwGgnvk/4HtwCRsoYuYz2Y9u6wn7nMTfpFToRAFAFD2t7PryujTob2TkzJQ+YLXCJ
         Er9Q==
X-Gm-Message-State: AOJu0Yzl327wDzHMZmGVxMGHAM3rSOAch/2M0slYjaCklEScdzhj9DfK
	UeD8coEOPChwMpYn3gA0gk3Ng5aNwtqjF/og/W3n98yBE2BIiDyNC0zsX1EMK65h
X-Gm-Gg: Acq92OEwOtZwusrHa8tY0jvmZ+TBht+4EJQpTyg5Oo/RM8zXFEF3feGvY+fvUSZvZIR
	ubJAm/DZKPXVW9sXnOboLpNOd3PrwaZb1qg11hSRPEHMADQigvE+cRNHGehFtO4qUR1YXp6Oant
	YsEQ3g4EHO6Rj8OgVfdZUKNZBRfCe2PMy+Kzh5kfyR7aJBagpSxNDLE/QqcXKPgs4t/oTvMi474
	f3oKqi+euwFzGaMVww9MXSGH+mWFXJrFlnyVQojJEKqzszmsEJ7pr1oxfirAF2MjrLMVm4OvRa5
	IohGda4JwVfqab64Sf9HOotQzfb5cK1VQ4YfanPyrczi5cO0MUZr0SmMSd2BHO/sjR5Nq3rorz+
	xvxI1yXFxIdeqTWDjqVdBG0KOsj2vVQSveQJRLmMb8Ahx4x0WLo7u4WJ+ItrW8Jxst9cd+Y+x4B
	tFDix4vfgjwdISsA8OdXlxscxTH4IS41kvrA==
X-Received: by 2002:a17:903:907:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2bd7e8ae548mr112810025ad.5.1778992752826;
        Sat, 16 May 2026 21:39:12 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f287sm143282535ad.24.2026.05.16.21.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 21:39:12 -0700 (PDT)
Date: Sun, 17 May 2026 12:38:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: sashiko-reviews@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <aglF_fbl--RgS7gQ@inochi.infowork>
References: <20260517014841.254085-5-inochiama@gmail.com>
 <20260517024848.4F346C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517024848.4F346C19425@smtp.kernel.org>

On Sun, May 17, 2026 at 02:48:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The binding completely omits the `interrupts` and `interrupt-names` properties for the host controller.
> - [Medium] The schema omits standard legacy INTx interrupt routing properties (`#interrupt-cells`, `interrupt-map`, `interrupt-map-mask`).
> - [Low] The `phy-names` property lacks an `items` definition to restrict valid string values.
> --
> 
> commit 7b8ba34456e71d6a9cf1028caa5504d64e8f58ba
> Author: Inochi Amaoto <inochiama@gmail.com>
> 
> dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
> 
> This commit adds device tree binding support for the PCIe controller on the
> SpacemiT K3 SoC. The controller is based on the Synopsys DesignWare PCIe IP
> with some extra link and reset state control.
> 
> > diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > new file mode 100644
> > index 0000000000000..46147a37a9ce6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> [ ... ]
> > +  reset-names:
> > +    items:
> > +      - const: dbi
> > +      - const: mstr
> > +      - const: slv
> > +
> > +  msi-parent: true
> > +
> 
> The driver implementation reads and clears interrupt status registers for
> host-level events, and references registers for receiving INTx events from
> downstream devices.
> 
> Should this binding include interrupts and interrupt-names properties to
> document the host's interrupt routing?
> 
> Additionally, should standard legacy INTx interrupt routing properties like
> #interrupt-cells, interrupt-map, and interrupt-map-mask be included in the
> schema and example to support downstream devices that do not use MSI?
> 

The driver just does the interrupt cleanup as it requires, and no
additional interrupt is needed

> > +  phys:
> > +    description:
> > +      PHY phandle from the Combo PHY, the lane number does not depends
> > +      on this, since the number of lanes provided by Combo PHY can be
> > +      1 or 2.
> > +    minItems: 1
> > +    maxItems: 6
> > +
> > +  phy-names:
> > +    minItems: 1
> > +    maxItems: 6
> 
> This isn't a bug, but the phy-names property lacks an items definition to
> restrict valid string values. The schema allows any arbitrary string here.
> 
> Since the driver retrieves PHYs by index rather than name, is this property
> necessary, or should the expected string items be defined?
> 

The driver just use index, and the name follow generic DesignWare
binding.

> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260517014841.254085-1-inochiama@gmail.com?part=4

Regards,
Inochi
