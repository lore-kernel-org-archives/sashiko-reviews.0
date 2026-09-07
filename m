Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961BC45D188
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782426; cv=none; b=cKINhNt9azMeM03qrn7jwzjVZkZ8DCUu+lpu5TKDb5iCKpfiT1cgFPOLqJ0B3X3SuMem4dEwtWcnukFG8bY3qRlVniqstOpzni9PnjvZXYAfauzqEBouPwdXh0FG7JRDWa+wkODVU1TkRfq2aVEw244vCTCp2+uigAuYMAgqIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782426; c=relaxed/simple;
	bh=ngQPkjIQhnImDOuM3WuuixU0yFgu3iX8vqPspgh9oKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qd7j0/eYjR7HHvOuBQQSl8vwFUdcRDveyLPjeq7b5Z9n06GceTbBZlLg/iEH1XM1qGnRPO7WYgT8G0Ze0bV1u0a4bkU/C+XX8xvvK+iRscZySk9oKj6tA1O89/5nb0KLnkndA4bqe+zypxQsgQ1ipM2AbfYp+j274LyB2VIpKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e/zUtqPe; arc=none smtp.client-ip=95.215.58.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e/zUtqPe"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ngQPkjIQhnImDOuM3WuuixU0yFgu3iX8vqPspgh9oKI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788782422; v=1; x=1789387222;
 b=e/zUtqPe4szF/wIjS2WlbzohqapC/g9FdG+wHKLIHeBzPyjnpRW+YYAZWGRN34CA2kF0zbRC
 9KD+zU6+gb6n8/trj4o7UzGEcV1r2zIG/7xS6rmmK0NGK8shk8AEWdeV/u0rrbhqMT2+ndtlfkc
 c7XyZ20GSQcD45LNsq+ASf9c=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c48a5cc37f9abba0;
	Mon, 07 Sep 2026 12:00:15 +0000
X-Mizu-Trace-ID: c48a5cc37f9abba0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so8637e87.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 05:00:10 -0700 (PDT)
X-Gm-Message-State: AFuF++kIINX6Zs2W1JKYAsctPfLv2Byq27gn2hLH4WUH0GLZPd9/t3tH
	brOleJL8X9BC2KVvKFcXCv6rMMRhh/jAlAP3FhI1Zs+llBN4ZQCqfyr3ZyD7vEQddsGP0IF1ueY
	5rioPXFq39SgNdTMxeXU0T9eYsndUp6xGMNem6dxp
X-Received: by 2002:a05:6512:1d1:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b75074fa17mr49498e87.3.1788782409953; Mon, 07 Sep 2026
 05:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907112944.313618-1-fuad.tabba@linux.dev> <20260907112944.313618-2-fuad.tabba@linux.dev>
 <20260907114514.44DB81F00A3A@smtp.kernel.org>
In-Reply-To: <20260907114514.44DB81F00A3A@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 7 Sep 2026 12:59:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzc1cOh5Qe+0svp6nOOgzeULVwxDmDOZr49xJtLFiaRhQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vt-aJ3tzj_QZnkbvQgo6kaZ5kSdh2tbtZ0uO353EJiAohmQi6mASJ03L8
Message-ID: <CA+EHjTzc1cOh5Qe+0svp6nOOgzeULVwxDmDOZr49xJtLFiaRhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] of/irq: Fix device node refcount leak in of_check_msi_parent()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Sept 2026 at 12:45, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] of_msi_xlate() prematurely aborts device tree hierarchy traversa=
l when msi_np is NULL.

Already covered in my reply to v1 [1]. No in-tree caller hits it:
fsl_mc_get_msi_id() is the only one passing NULL, and an fsl_mc_device
has no of_node, so the walk doesn't abort there.

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvf=
RpCCAVuA@mail.gmail.com/

> --
>
> commit d227a3bc08eef0cbb22a6f227edca082ac29a9b8
> Author: Fuad Tabba <fuad.tabba@linux.dev>
> of/irq: Fix device node refcount leak in of_check_msi_parent()
>
> This patch prevents a device node reference count leak in
> of_check_msi_parent(). It ensures that the msi_node reference is
> only kept when the incoming node pointer is NULL.
>
> Link: https://lore.kernel.org/all/20260826113604.010C01F000E9@smtp.kernel=
.org/
>
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index ec035367c9500..109c54f346479 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -785,7 +785,7 @@ static int of_check_msi_parent(struct device_node *=
dev_node, struct device_node
> >       if ((*msi_node && *msi_node !=3D msi_spec.np) || msi_spec.args_co=
unt !=3D 0)
> >               ret =3D -EINVAL;
> >
> > -     if (!ret) {
> > +     if (!ret && !*msi_node) {
> >               /* Return with a node reference held */
> >               *msi_node =3D msi_spec.np;
> >               return 0;
>
> [Severity: High]
> This isn't a regression introduced by this patch, but could the traversal
> loop in of_msi_xlate() prematurely abort when msi_np is NULL?
>
> If a driver calls of_msi_xlate(dev, NULL, id) and the direct parent lacks=
 an
> msi-map property, of_map_msi_id() passes the NULL msi_np to of_map_id()
> as filter_np:
>
> drivers/of/base.c:of_map_id() {
>         ...
>         map =3D of_get_property(np, map_name, &map_bytes);
>         if (!map) {
>                 if (filter_np)
>                         return -ENODEV;
>                 /* Otherwise, no map implies no translation */
>                 arg->args[0] =3D id;
>                 arg->args_count =3D 1;
>                 return 0;
>         }
>         ...
> }
>
> Because filter_np is NULL, it returns 0 instead of -ENODEV.
>
> This translates to !of_map_msi_id(...) evaluating to true in the loop in
> of_msi_xlate(), hitting the break statement:
>
> drivers/of/irq.c:of_msi_xlate() {
>         ...
>         for (parent_dev =3D dev; parent_dev; parent_dev =3D parent_dev->p=
arent) {
>                 struct of_phandle_args msi_spec =3D {};
>
>                 if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &m=
si_spec)) {
>                         if (msi_spec.np) {
>                                 ...
>                         }
>                         /* msi-map present but no match =E2=86=92 stop wa=
lking */
>                         break;
>                 }
>                 ...
>         }
>         ...
> }
>
> Will this cause the function to incorrectly terminate the loop on the ver=
y
> first node, conflating an absent msi-map with a present but unmatched
> msi-map, and failing to find the MSI mapping in ancestor nodes?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907112944.31=
3618-1-fuad.tabba@linux.dev?part=3D1
