Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1506471264;
	Fri,  4 Sep 2026 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520302; cv=none; b=TsIz9A+2v7s1sOSfT+oAD+iG0h9F7kB08GGFnOab9QOOlqCvgqkoiAo2xulJuixRDAZgyFbyxvsYBIoU6978iTUefCxghjcqng/Jrhu0wmdkr1KRnduJi31212lOG5RxsZcCj36gRrBl728GLtJkw+uAFlX/j0vaxbjd0jIC0lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520302; c=relaxed/simple;
	bh=6HawBg+Yv/dBZMv6UHdactmnftEmFed+/lH/pO/h1/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDj0Ue2YB7CzSMkYEheR/7pc8nsM/7mt9NjdOAbVsti/awpBk1PVTXyDut/sP5HYE6QAScBe1hF5hsYs3uAEXm4vnmo8RqLQgXfTLKxBTHA85zCZNBN9EO/4nw6BRPpOWZWAt3brueeLQm1eyMT1iXkIEobaj5MGDz05jdpe28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7qBPj/P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7qBPj/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9631F00A3D;
	Fri,  4 Sep 2026 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788520300;
	bh=eu+GJiNFWoJ8K1vcQwq6yxeFVrpznJV32qpZcD0QCgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n7qBPj/PRriRLBqEwuIfaPHrEVnabJjuoqE6tFNOeaYmzVTiTy6xPa+CG1ncAOVGa
	 GbR6A7y8WRfv5jTRY/IhRIjZZ1jSovMvtmfdvih3pZvzJX9cDIhOFf+5rOmFbmubKK
	 2+c9aEJC297dhiGVp48DvEKlhEgbxFLabUgbdtiWORxc3EmL4hUilwwelCbOR5A3jA
	 od4znCwa4FRBunCJl3k+8lQ8fpV7GP2FQ/mc3+XLWuCH0PDEIYOmUvsk3m4XecDmB0
	 t7eo0bpdnPb8tWTGR6z2cspWRKbEA2FwMMEJpOpjxXpipvWLhm6v3cQohb4SAORdZh
	 sAAw6WjZ9x5Uw==
Date: Fri, 4 Sep 2026 13:11:36 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in
 of_check_msi_parent()
Message-ID: <apqnaNmeuUjfC8Ng@red-moon>
References: <20260904073424.3855365-1-fuad.tabba@linux.dev>
 <20260904074800.875391F00A3F@smtp.kernel.org>
 <CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvfRpCCAVuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvfRpCCAVuA@mail.gmail.com>

On Fri, Sep 04, 2026 at 10:25:24AM +0100, Fuad Tabba wrote:
> On Fri, 4 Sept 2026 at 08:48, <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] of_msi_xlate() fails to traverse the device hierarchy when msi_np is NULL, completely breaking MSI ID mapping for callers such as the fsl-mc subsystem.
> > - [High] msi_node reference is leaked on error path in its_v5_pci_msi_prepare()
> > - [High] of_msi_xlate() incorrectly handles 'msi-parent' by continuing tree traversal when it mismatches.
> > --
> >
> > commit b8991c82a3994d7ebf04943226ad5d1d9490a8d4
> > Author: Fuad Tabba <fuad.tabba@linux.dev>
> >
> > of/irq: Fix device node refcount leak in of_check_msi_parent()
> >
> > The patch fixes a device node refcount leak in of_check_msi_parent(). It
> > ensures that if the node was not matched in a 1:1 mapping, the reference is
> > released correctly before returning.
> >
> > Link: https://lore.kernel.org/all/20260826113604.010C01F000E9@smtp.kernel.org/
> >
> > > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > > index ec035367c9500..109c54f346479 100644
> > > --- a/drivers/of/irq.c
> > > +++ b/drivers/of/irq.c
> > > @@ -785,7 +785,7 @@ static int of_check_msi_parent(struct device_node *dev_node, struct device_node
> > >       if ((*msi_node && *msi_node != msi_spec.np) || msi_spec.args_count != 0)
> > >               ret = -EINVAL;
> > >
> > > -     if (!ret) {
> > > +     if (!ret && !*msi_node) {
> > >               /* Return with a node reference held */
> > >               *msi_node = msi_spec.np;
> > >               return 0;
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but of_msi_xlate() seems to
> > incorrectly handle msi-parent mismatches.
> >
> > If a device specifies an msi-parent that does not match the msi_np filter,
> > of_check_msi_parent() returns -EINVAL.
> >
> > drivers/of/irq.c:of_msi_xlate() {
> >                 /* -ENODEV: msi-map absent -> check for msi-parent */
> >                 if (msi_np && !of_check_msi_parent(parent_dev->of_node, msi_np))
> >                         break;
> > }
> >
> > The condition !of_check_msi_parent() evaluates to false, skipping the break
> > statement and allowing traversal to continue. Will this erroneously allow
> > traversal up the tree, potentially inheriting an incorrect msi-map from a
> > parent bus?
> 
> It does continue. -EINVAL also covers #msi-cells != 0, so
> of_msi_xlate() cannot tell a phandle mismatch from an msi-parent that
> is not a 1:1 mapping, and breaking on it would stop the walk for both.
> 
> Lorenzo, Rob, should the walk stop at the first node declaring an msi-parent?

First off, thank you for fixing this.

I think we must stop at the first msi-parent and apply the same (convoluted)
logic that of_msi_xlate() executes upon of_map_msi_id()'s return to make
sure ref counts are kosher (we already have an msi_spec scratch variable,
we can pass that to of_check_msi_parent() - that is, always drop the
msi_spec.np reference if !NULL and get one if !*msi_np to initialize it).

> 
> >
> > [Severity: High]
> > This is a pre-existing issue, but does of_msi_xlate() fail to traverse the
> > device hierarchy when msi_np is NULL?
> >
> > When of_map_msi_id() (which calls of_map_id()) processes an absent map
> > property while filter_np is NULL, it returns 0 instead of an error:
> >
> > drivers/of/base.c:of_map_id() {
> >         ...
> >         map = of_get_property(np, map_name, &map_bytes);
> >         if (!map) {
> >                 if (filter_np)
> >                         return -ENODEV;
> >                 /* Otherwise, no map implies no translation */
> >                 arg->args[0] = id;
> >                 arg->args_count = 1;
> >                 return 0;
> >         }
> >         ...
> > }
> >
> > In of_msi_xlate(), this return value of 0 triggers a break:
> >
> > drivers/of/irq.c:of_msi_xlate() {
> >                 if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
> >                         ...
> >                         /* msi-map present but no match -> stop walking */
> >                         break;
> >                 }
> > }
> >
> > Because of_map_id() returns 0 when the map is absent, wouldn't this early
> > break erroneously abort the parent traversal loop on the first iteration,
> > breaking MSI ID mapping for callers passing a NULL msi_np?
> 
> It does break early there, but not for fsl-mc, the only NULL caller:
> AFAICT, an fsl_mc_device never gets an of_node, so the walk carries on
> up to the fsl-mc platform device, which is where fsl,qoriq-mc puts
> msi-map.
> 
> > [Severity: High]
> > This isn't a bug introduced by this patch, but is there a fwnode reference
> > leak on the error path in its_v5_pci_msi_prepare()?
> >
> > drivers/irqchip/irq-gic-its-msi-parent.c:its_v5_pci_msi_prepare() {
> >         rid = pci_msi_map_rid_ctlr_node(domain->parent, pdev, &msi_node);
> >         if (!msi_node)
> >                 return -ENODEV;
> >
> >         ret = its_translate_frame_address(msi_node, &pa);
> >         if (ret)
> >                 return -ENODEV;
> >
> >         fwnode_handle_put(msi_node);
> >         ...
> > }
> >
> > If its_translate_frame_address() fails, it returns -ENODEV without dropping
> > the acquired msi_node reference. Can this leak the fwnode_handle if the
> > frame address translation fails repeatedly during driver bind or unbind?
> 
> Yes, every failed translation leaks one. I have a patch written,
> moving the put above the error check. It goes with the irqchip fixes
> rather than here.

Yep.

Thanks,
Lorenzo
