Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9703C45D19F;
	Mon,  7 Sep 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775130; cv=none; b=gW0ezYMDqgj2qg/55/22E/NXKqOgPeU19T96vl5zfBHm2d5g5Z8btLjXT7DGNJn05i2WtbZNIuzUDS9bKh1kxyJLDqhfzgZyewNDO/RIfx1qEocUCp64yeJWucQTaz0lIif/7WRBeGG1oODx9bFRxLCTyfoiMx3PeBdIfXbG3pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775130; c=relaxed/simple;
	bh=MSehe6VSUv4s3RoDeKo6/9AjhH8oxhsroVMHBQgTq2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPTSTvPsdKdlSRdh2zhttb1If4gd5H9sGckqBj7ZQfmZF+sjNuv05oGcDrERW0n09fTbvUzwsdg7A1685KaB4STLYvho0SFtDRiDdZPsXZw2My9YCQyTBMrtoYfDA+U747tnYUVrtrpleniu3VsZ5PSL8Xw7plBstbtztj/K1vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2sQ4YeT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2sQ4YeT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9E21F00A3F;
	Mon,  7 Sep 2026 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788775128;
	bh=KJKiJbgF2EJBnXm7YabIt+0FDsKFY+AJSWGyd1KAI9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l2sQ4YeTjDFohD3Oqo0rIFADWRMEbDEfOW8uiRocs6mxOFp3nn36CS5ENjF+oiIkd
	 ainC4oVrS0tPeJkTyrKFbGpxG82p45b/Ta9b2dsoYC/CKEl/sQMUvmHp6As48C84Tf
	 Ny8t0UXKFAyb2YuWVPv62T8Y9ecZevVnjlELtPQTfAHHctsAX5ULNGJ4d11C1Q1SSZ
	 GILt2Upl4+8GSxf+hCWq102pZXacsnsoeUQ+yqwbhbdyRNlzTK7vPcRooLu7s8k6TZ
	 WEWPBuW7g5hqWTkK5hHR+nzC1hY2I0DuMwgrP28kqVinfjsoVxEd5VwRATUeh0th//
	 VGePPEWYkk8YQ==
Date: Mon, 7 Sep 2026 11:58:44 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in
 of_check_msi_parent()
Message-ID: <ap6K1H_5EI3g1D3n@red-moon>
References: <20260904073424.3855365-1-fuad.tabba@linux.dev>
 <20260904074800.875391F00A3F@smtp.kernel.org>
 <CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvfRpCCAVuA@mail.gmail.com>
 <apqnaNmeuUjfC8Ng@red-moon>
 <CA+EHjTy0sL8our+KNigZbc7-+uu2-OX=L3g_49-c_C7UY_quDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTy0sL8our+KNigZbc7-+uu2-OX=L3g_49-c_C7UY_quDg@mail.gmail.com>

On Fri, Sep 04, 2026 at 01:48:11PM +0100, Fuad Tabba wrote:
> On Fri, 4 Sept 2026 at 12:11, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> ...
> > > It does continue. -EINVAL also covers #msi-cells != 0, so
> > > of_msi_xlate() cannot tell a phandle mismatch from an msi-parent that
> > > is not a 1:1 mapping, and breaking on it would stop the walk for both.
> > >
> > > Lorenzo, Rob, should the walk stop at the first node declaring an msi-parent?
> >
> > First off, thank you for fixing this.
> >
> > I think we must stop at the first msi-parent and apply the same (convoluted)
> > logic that of_msi_xlate() executes upon of_map_msi_id()'s return to make
> > sure ref counts are kosher (we already have an msi_spec scratch variable,
> > we can pass that to of_check_msi_parent() - that is, always drop the
> > msi_spec.np reference if !NULL and get one if !*msi_np to initialize it).
> 
> Thanks for the clarification.

I can send a patch myself - I understand this is a nuisance for you - I think
though that since you are in the process of fixing it I don't want to get
in the way either.

Let me know.

Thanks,
Lorenzo

> 
> Cheers,
> /fuad
> 
> > >
> > > >
> > > > [Severity: High]
> > > > This is a pre-existing issue, but does of_msi_xlate() fail to traverse the
> > > > device hierarchy when msi_np is NULL?
> > > >
> > > > When of_map_msi_id() (which calls of_map_id()) processes an absent map
> > > > property while filter_np is NULL, it returns 0 instead of an error:
> > > >
> > > > drivers/of/base.c:of_map_id() {
> > > >         ...
> > > >         map = of_get_property(np, map_name, &map_bytes);
> > > >         if (!map) {
> > > >                 if (filter_np)
> > > >                         return -ENODEV;
> > > >                 /* Otherwise, no map implies no translation */
> > > >                 arg->args[0] = id;
> > > >                 arg->args_count = 1;
> > > >                 return 0;
> > > >         }
> > > >         ...
> > > > }
> > > >
> > > > In of_msi_xlate(), this return value of 0 triggers a break:
> > > >
> > > > drivers/of/irq.c:of_msi_xlate() {
> > > >                 if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
> > > >                         ...
> > > >                         /* msi-map present but no match -> stop walking */
> > > >                         break;
> > > >                 }
> > > > }
> > > >
> > > > Because of_map_id() returns 0 when the map is absent, wouldn't this early
> > > > break erroneously abort the parent traversal loop on the first iteration,
> > > > breaking MSI ID mapping for callers passing a NULL msi_np?
> > >
> > > It does break early there, but not for fsl-mc, the only NULL caller:
> > > AFAICT, an fsl_mc_device never gets an of_node, so the walk carries on
> > > up to the fsl-mc platform device, which is where fsl,qoriq-mc puts
> > > msi-map.
> > >
> > > > [Severity: High]
> > > > This isn't a bug introduced by this patch, but is there a fwnode reference
> > > > leak on the error path in its_v5_pci_msi_prepare()?
> > > >
> > > > drivers/irqchip/irq-gic-its-msi-parent.c:its_v5_pci_msi_prepare() {
> > > >         rid = pci_msi_map_rid_ctlr_node(domain->parent, pdev, &msi_node);
> > > >         if (!msi_node)
> > > >                 return -ENODEV;
> > > >
> > > >         ret = its_translate_frame_address(msi_node, &pa);
> > > >         if (ret)
> > > >                 return -ENODEV;
> > > >
> > > >         fwnode_handle_put(msi_node);
> > > >         ...
> > > > }
> > > >
> > > > If its_translate_frame_address() fails, it returns -ENODEV without dropping
> > > > the acquired msi_node reference. Can this leak the fwnode_handle if the
> > > > frame address translation fails repeatedly during driver bind or unbind?
> > >
> > > Yes, every failed translation leaks one. I have a patch written,
> > > moving the put above the error check. It goes with the irqchip fixes
> > > rather than here.
> >
> > Yep.
> >
> > Thanks,
> > Lorenzo
