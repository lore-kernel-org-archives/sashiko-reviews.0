Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C33603C9
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 03:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784519898; cv=pass; b=Q8yTz1KVpFYInS++/YxkOfKZt1zr8LVMPY3ItMTqVenw7rIMT0ukOKFCATgacHh3w2kjrK5NdvfEbghYm41Bn8fdVzYqrVmoKUEtQ2L42PRZGn3bzFK4OFxDO/huXm7FO7aSHNWWvRK2C9MdZeDaEdzZGWTBQusRHBpzha8+c8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784519898; c=relaxed/simple;
	bh=dxh3xd7dwLFCm9HEMceZqX5OiKkpL2P9khsPdjNvBTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWiDZngr80U6GUmQkasOBno9LLxcqNW2C3YjJukNlld7hik1qw6wwfsk+zDMADGpjxSvaV0PskMympkuvAnsgVKVMBdZVDknPGbQGbTlaJUMoMs3DQimaSRbEfLXXEx5/7XnMTIOUfsbunTeUPfexzFiChz5YJ4b00UOVbcHPxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QkuFJT0f; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QkuFJT0f"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81ecf499af9so61981037b3.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 20:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784519896; cv=none;
        d=google.com; s=arc-20260327;
        b=iqCXVXrNTOCUiChqN+vYLXoaPB/7lBMTE8eOX6s5/YUqp+s3PUDX8xWgoahEgjxv76
         3P3UDZaz4kWZmxOj7K2QcyXbLs+FxOsjHF1bFwrnUhdnegEvJ0+mo2DqrbFSyrFPYSz/
         awx3QF6EuLCeGLlrahD463HpVRnBqXwCZeXxyqYLb9eHj359LMPccm9iLjYinkL2ChYx
         OOg5x3pEEO45CGlSFSpyLQV7nb2ZXecpIj6yBlnw/Ua2P4fXVnulBVkouqmkBvEX+Hy7
         aciweLh7/xpf3Vu1gEnMzWdql2YvMayyDlfhBqM+YRZFmMTTc+lt7jAc1NlIriePiSVY
         VgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KafO/WcSs8IZV3ceugHPjvBD3hWgrTgFOQhWZ7ZmXh4=;
        fh=rQB7wRh7EfRBJIrZo7+Qz2xY0F9WCq9J2TBx3vCtNlw=;
        b=kK2oFlJkBTY73RcrS7zvZ/XzXaWhdfoTxV51IK7L0IshXDkLp9vR5MxijUo9kBrXnq
         agfpnZ61fryIu4hJ3aLU2ZxqRIMugCzxuGITxcdGUT3v4ndoaBHhhwcmPlFxIZ8VVrKO
         k+iYz5gF0eWdHUSWf6zljIJ/ZylGwF9zm3bdyfDfs/T6KFg9PWN+Zf8XH4N33u7WlWF5
         AzU0qC3urJlq5Ohb4LXyVRiCan7oV9N4J+6XttmSA7mF82uBfyhofp3vgACBVxfZccez
         bVskLTPJqCBsTT54REcQYiNIkpSZjvA1vUL5ZKYlnCeVlHo2jpRiAWKdl/C4/bVxC/yj
         HJyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784519896; x=1785124696; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KafO/WcSs8IZV3ceugHPjvBD3hWgrTgFOQhWZ7ZmXh4=;
        b=QkuFJT0fMOUzWQdb5ESNKrUSpsFJEprTPoGHtsiKSWyDAFu5D2d4KO08qRXCAVUfgT
         h0bMWzxSMUrdIiho5tQMfChPHjQybuev42uKA5pgKwXNXJMC9S6RfojfGYowLfnmNqsn
         0AncUhtFZCSgR9Rrxv51t1iHdiYeDGrc2X8Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784519896; x=1785124696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KafO/WcSs8IZV3ceugHPjvBD3hWgrTgFOQhWZ7ZmXh4=;
        b=a5uG3rrtsRDKb8Y04a37EQBRHrhWjNJOHx7hZ1I9jAyKAUHJz4SN03AYOTGM/HmNBz
         xPJcdvQpxy17HlTry2cPEyYyY5wHI8zye4XMJSmTECmUA4LM8dCyJpJSTB6kF/vzGRx6
         87cfSu8gAMj70qGZsMB3bLUclDHcDMPRXhibdD12siiyQtQCDT6Qp83KgEROHbQ9cdIT
         unT9oOOkAnQOJvNFBa82p6bE4QFP6M38Q/SqhPnqchrb1UOFKvO+gXWLmPgqvoI8Ak2h
         gmh2mZJTu/Z8Ws55qG4s93ZBsZnX6c/JO80cfsG4M7gpgXq0WVcZxXfpXlhwuiFFF3U7
         B0Vg==
X-Gm-Message-State: AOJu0YyFeE5RZPzb70h8BMA7Ro9Ni6wxTfwuXqn6r79D1ycVP6DeQ3G0
	uCIbB+cVCYEi1Y+QW5C9STtiTyh8ZwQmPgXSzWCqMTD5IsDWTTyj+WLlj+OoVAG1e5q7PX21tXq
	1oDL06hXmditAuMncuIk460cXD2IDAfJRoaVcuaLV
X-Gm-Gg: AR+sD10qPMLTkErSysGjv5JHtsVgz1NAAjOUOpYSTvZc2wd30VM98w3gQSBim6zBgiU
	LJNNAhx/o4jWoF6mQg5gPKCMAfCLIMGDUKSQJmWgHzQm6cf9kblN2DKDb1qLJPD6k9znfOmhlOe
	JLGq5jHsnTm/zDFyvaKIPEB0Fgf4ef+wMLUrpHqnF6iTCyJJMuTfcHM2+v9GtEYMuPGq536t9jd
	585kFXWmaDjgcpn5Se+xRULQIGOIWXEzYw3AZKbwurqPpJeHUh6p3aIbCM+EXDpE7ttimC8lPPL
	A4vFX5s6dUDmHa35
X-Received: by 2002:a05:690c:4d07:b0:81e:c898:bc51 with SMTP id
 00721157ae682-81ef26df344mr34874147b3.70.1784519895100; Sun, 19 Jul 2026
 20:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-3-wenst@chromium.org>
 <20260715090944.2B4441F000E9@smtp.kernel.org> <CAGXv+5Ffsrc9r6d_RrgL1mBW1Zmt1RxCrMCjaD7vuF3+EaeAqw@mail.gmail.com>
 <allHTc-bJrPwDA0b@ashevche-desk.local> <CAGXv+5HS3neb=8EW0FT2-tP-dhPFqQ+q8YRS8Gy_XBic4z4Mug@mail.gmail.com>
 <alpZVUEOidfGMpfD@ashevche-desk.local>
In-Reply-To: <alpZVUEOidfGMpfD@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jul 2026 11:58:04 +0800
X-Gm-Features: AUfX_mxLin0OT--5qibPct2dJsaS8LrcUeIhX0neP8aGKP71f2cGpT0RUhWh8_s
Message-ID: <CAGXv+5FoXBfc6GOEnEhhnRcNTJp6bazLS1ZJEUEiZWfc=EZy2g@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 12:33=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 17, 2026 at 07:05:56PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Jul 17, 2026 at 5:04=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Jul 16, 2026 at 04:52:27PM +0800, Chen-Yu Tsai wrote:
> > > > On Wed, Jul 15, 2026 at 5:09=E2=80=AFPM <sashiko-bot@kernel.org> wr=
ote:
>
> ...
>
> > > > > > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(cons=
t struct fwnode_handle *port,
> > > > > > +                                                       struct =
fwnode_handle *prev)
> > > > > > +{
> > > > > > +     do {
> > > > > > +             prev =3D fwnode_get_next_child_node(port, prev);
> > > > >
> > > > > [Severity: High]
> > > > > This is a pre-existing issue, but iterating over endpoints using
> > > > > fwnode_get_next_child_node() can cause an infinite loop and a use=
-after-free
> > > > > if a device has secondary fwnodes attached.
> > > > >
> > > > > If a device port has both primary children and a secondary fwnode=
, the primary
> > > > > ops finish and drop the reference to the last primary child, retu=
rning NULL.
> > > > > Then, fwnode_get_next_child_node() incorrectly passes this same d=
ropped child
> > > > > pointer to the secondary ops:
> > > > >
> > > > > drivers/base/property.c:fwnode_get_next_child_node() {
> > > > >         /* Try to find a child in primary fwnode */
> > > > >         next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, =
child);
> > > > >         if (next)
> > > > >                 return next;
> > > > >
> > > > >         /* When no more children in primary, continue with second=
ary */
> > > > >         return fwnode_call_ptr_op(fwnode->secondary, get_next_chi=
ld_node, child);
> > > > > }
> > > > >
> > > > > This can result in a double-put. Furthermore, when traversing sec=
ondary
> > > > > children, the primary ops don't recognize the software node, trea=
t it as NULL,
> > > > > and return the first primary child again, creating an infinite lo=
op.
> > >
> > > Yeah, it has to be implemented in a way how fwnode_graph_get_next_end=
point() is done.
> >
> > If your patch series addresses the issue, I guess we can consider it
> > covered? Sashiko labeled this a pre-existing.
>
> I noticed that it addresses only main get_next case, but get_next_availab=
le is
> still with the same issue. It's not that critical, we don't use much that=
 API,
> but still will be good to fix at some point.
>
> > > > > [Severity: Medium]
> > > > > Does this fail to unconditionally put the prev reference if the p=
rovided port
> > > > > is invalid?
> > > > >
> > > > > If a caller passes a valid prev node but port is NULL or an error=
 pointer,
> > > > > fwnode_get_next_child_node() returns early without dropping prev:
> > > > >
> > > > > drivers/base/property.c:fwnode_get_next_child_node() {
> > > > >         struct fwnode_handle *next;
> > > > >
> > > > >         if (IS_ERR_OR_NULL(fwnode))
> > > > >                 return NULL;
> > > > >     ...
> > > > > }
> > > > >
> > > > > Could this lead to a reference count leak, violating the document=
ed API
> > > > > contract that prev is unconditionally put?
> > > >
> > > > This seems like what the other fwnode_get_next_*() functions are do=
ing.
> > > > I'd say this is a pre-existing issue as well.
> > >
> > > See this series (not yet applied, you even have chance to review it!)=
:
> > > 20260611203537.1786399-1-andriy.shevchenko@linux.intel.com
> >
> > I believe that series addresses the first issue, not this one, even
> > though it partially mitigates it.
> >
> > The contract says "puts a reference to @prev unconditionally." What it
> > doesn't say is that it requires @node to be valid, i.e. the function
> > is a no-op if node =3D=3D NULL.
> >
> > "node !=3D NULL" being an implicit requirement seems to be the norm for
> > the fwnode_* and of_* APIs. It's not explicitly spelled out and Sashiko
> > lacks the context for it.
> >
> > I'm not sure this should be changed within this patch. It would end up
> > as a mismatch between the various functions and possibly lead to more
> > confusion.
>
> How does node become invalid after that patch?

Sashiko is arguing that the kernel-doc says "reference to @prev is _always_
put". But if you look at all the *_get_next_*() functions, they all just
return directly if @node is NULL.

I'm saying that this is implicit across the full API, and adding text
explaining it in just one of the functions creates a discrepancy. I can
add a patch before this to clarify the existing documentation, and change
the text in this patch as well, to make Sashiko happy.

Does that make sense?

> > > > > > +             if (fwnode_name_eq(prev, "endpoint"))
> > > > >
> > > > > [Severity: High]
> > > > > Does hardcoding this string match break the fwnode graph abstract=
ion for
> > > > > non-DeviceTree platforms?
> > > > >
> > > > > By strictly matching the "endpoint" prefix, this bypasses the pro=
vider-specific
> > > > > fwnode_operations, which could silently ignore valid ACPI and sof=
tware node
> > > > > endpoints that don't follow this exact naming scheme. Shouldn't t=
his rely on
> > > > > the backend-specific graph_get_next_endpoint operations instead?
> > > >
> > > > From drivers/acpi/property.c it seems that ACPI graphs follow the s=
ame
> > > > structure. I don't have visibility into ACPI implementations though=
.
> > >
> > > Sashiko might be right. ACPI has device and data nodes, for device no=
des the
> > > name will be FourCC, so never longer than 4 characters. For data node=
s, it
> > > takes their names, which are arbitrary strings and seems should follo=
w the given
> > > schema. You need Sakari Ailus to review this patch.
> >
> > OK. Will add Sakari in the next version.
>
> Hmm... This is interesting. For any fwnode API changes you should add the
> respective reviewers. Do you use tools or doing that manually? You should=
 use
> tools. I know that `b4` is capable of doing that, but I use a script [1] =
I
> wrote a few years ago.

Actually Sakari is already in the list of recipients.

I'm running get_maintainers.pl on all the files I changed, which is not
the formatted patches, but I don't think that affects the output much.
It's a bit less automated, but I sometimes trim the recipient list
slightly as I know they probably won't look at it.

> > > > We also have the following in include/linux/fwnode.h:
> > > >
> > > > #define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
> > > > #define SWNODE_GRAPH_ENDPOINT_NAME_FMT          "endpoint@%u"
> > > >
> > > > So this should not be a problem.
> > > >
> > > > > > +                     break;
> > > > > > +     } while (prev);
> > > > > > +
> > > > > > +     return prev;
> > > > > > +}
>
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintaine=
r.sh

Thanks for sharing!


ChenYu
