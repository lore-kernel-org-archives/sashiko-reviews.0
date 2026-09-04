Received: from mta1.migadu.com (out-142.mta1.migadu.com [95.215.58.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0450E3F1AA1
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526136; cv=none; b=dWO/UKLefAFopyJfG83MqbPi5Lgusiw/lI7iFEunLrSB/a2GzK6+dphumr00DtYgsgeUEhYC2ibwPtJ1RNASHf6dAWiv/OKF8iaTipsqrV3Rqwec9fuHnnkD24AEcjuiFoKWisS3rwl/qKbbRRsRBysKxiKxjFpinxdOKASNWbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526136; c=relaxed/simple;
	bh=tvZFMMdnKHz7OPvyKechTJTWyD/PoxIJiVI+e2daVYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9PO9f33dxPJ9FXsxpE3wSlzD4xUDU6bVSPsJ1tFu7NE/Yiw2s80+ifEwZd2jwvl/aeMEGEVZJ4xgbpx6M8zSsIMEEXpgxy1TtvYLxv6hRiycX/zWSGO67glbgOdsNNYKhq4u+BmOsqb+DplhMmxN6thkBeJBUPIzFZGuFPNp2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SDR6G8OV; arc=none smtp.client-ip=95.215.58.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SDR6G8OV"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=tvZFMMdnKHz7OPvyKechTJTWyD/PoxIJiVI+e2daVYw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788526133; v=1; x=1789130933;
 b=SDR6G8OVxnW++hvT7i+pD9/gAYgUCplPfcq3wa6qsfaYFjKAJEI/7vTyT4J+mRgVozo6Yj0K
 8bW84UwD8puJbRf02UczOMWDGzx0ag9GiBo5bEQgDajtN5UOp5ZHajcvWKVGs2Npp/+kdOA+ocY
 gM4xwhe6CUQBwuZrKxswwCkk=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 46356cf9a25e621b;
	Fri, 04 Sep 2026 12:48:53 +0000
X-Mizu-Trace-ID: 46356cf9a25e621b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so5806e87.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 05:48:48 -0700 (PDT)
X-Gm-Message-State: AFuF++kd2YpIu1mJLEp7xc/BGjVDuiH8ek9sH/ehqyYXGfMbV8P9YN1n
	G/CJiJbuJCsoMiYOSYm9OsQBHGWwX+YtwKt9IsNuGmFL5EUf5E0vBDsx9hksDILc77/vOkDcPZe
	OP8maU8Rm2jnRW7LUgWA+qG3PKueAY/curj2F1QFn
X-Received: by 2002:a05:6512:2243:b0:5b6:bea:f091 with SMTP id
 2adb3069b0e04-5b6170f843emr110245e87.10.1788526127966; Fri, 04 Sep 2026
 05:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904073424.3855365-1-fuad.tabba@linux.dev>
 <20260904074800.875391F00A3F@smtp.kernel.org> <CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvfRpCCAVuA@mail.gmail.com>
 <apqnaNmeuUjfC8Ng@red-moon>
In-Reply-To: <apqnaNmeuUjfC8Ng@red-moon>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 13:48:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy0sL8our+KNigZbc7-+uu2-OX=L3g_49-c_C7UY_quDg@mail.gmail.com>
X-Gm-Features: AcwNN1X2ZIAe9-WNal5RVk3dI8weKYROYg78bFJyd_QW8RLSGBo0CIEAN0-FVKE
Message-ID: <CA+EHjTy0sL8our+KNigZbc7-+uu2-OX=L3g_49-c_C7UY_quDg@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in of_check_msi_parent()
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 12:11, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
...
> > It does continue. -EINVAL also covers #msi-cells != 0, so
> > of_msi_xlate() cannot tell a phandle mismatch from an msi-parent that
> > is not a 1:1 mapping, and breaking on it would stop the walk for both.
> >
> > Lorenzo, Rob, should the walk stop at the first node declaring an msi-parent?
>
> First off, thank you for fixing this.
>
> I think we must stop at the first msi-parent and apply the same (convoluted)
> logic that of_msi_xlate() executes upon of_map_msi_id()'s return to make
> sure ref counts are kosher (we already have an msi_spec scratch variable,
> we can pass that to of_check_msi_parent() - that is, always drop the
> msi_spec.np reference if !NULL and get one if !*msi_np to initialize it).

Thanks for the clarification.

Cheers,
/fuad

> >
> > >
> > > [Severity: High]
> > > This is a pre-existing issue, but does of_msi_xlate() fail to traverse the
> > > device hierarchy when msi_np is NULL?
> > >
> > > When of_map_msi_id() (which calls of_map_id()) processes an absent map
> > > property while filter_np is NULL, it returns 0 instead of an error:
> > >
> > > drivers/of/base.c:of_map_id() {
> > >         ...
> > >         map = of_get_property(np, map_name, &map_bytes);
> > >         if (!map) {
> > >                 if (filter_np)
> > >                         return -ENODEV;
> > >                 /* Otherwise, no map implies no translation */
> > >                 arg->args[0] = id;
> > >                 arg->args_count = 1;
> > >                 return 0;
> > >         }
> > >         ...
> > > }
> > >
> > > In of_msi_xlate(), this return value of 0 triggers a break:
> > >
> > > drivers/of/irq.c:of_msi_xlate() {
> > >                 if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
> > >                         ...
> > >                         /* msi-map present but no match -> stop walking */
> > >                         break;
> > >                 }
> > > }
> > >
> > > Because of_map_id() returns 0 when the map is absent, wouldn't this early
> > > break erroneously abort the parent traversal loop on the first iteration,
> > > breaking MSI ID mapping for callers passing a NULL msi_np?
> >
> > It does break early there, but not for fsl-mc, the only NULL caller:
> > AFAICT, an fsl_mc_device never gets an of_node, so the walk carries on
> > up to the fsl-mc platform device, which is where fsl,qoriq-mc puts
> > msi-map.
> >
> > > [Severity: High]
> > > This isn't a bug introduced by this patch, but is there a fwnode reference
> > > leak on the error path in its_v5_pci_msi_prepare()?
> > >
> > > drivers/irqchip/irq-gic-its-msi-parent.c:its_v5_pci_msi_prepare() {
> > >         rid = pci_msi_map_rid_ctlr_node(domain->parent, pdev, &msi_node);
> > >         if (!msi_node)
> > >                 return -ENODEV;
> > >
> > >         ret = its_translate_frame_address(msi_node, &pa);
> > >         if (ret)
> > >                 return -ENODEV;
> > >
> > >         fwnode_handle_put(msi_node);
> > >         ...
> > > }
> > >
> > > If its_translate_frame_address() fails, it returns -ENODEV without dropping
> > > the acquired msi_node reference. Can this leak the fwnode_handle if the
> > > frame address translation fails repeatedly during driver bind or unbind?
> >
> > Yes, every failed translation leaks one. I have a patch written,
> > moving the put above the error check. It goes with the irqchip fixes
> > rather than here.
>
> Yep.
>
> Thanks,
> Lorenzo
