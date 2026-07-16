Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AEA21CC44
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191962; cv=pass; b=kr1eV5oRGqL3hLWvTJQ/DlpTRv/V3r9gdri8x936eX73Cqs/OWRWm7N4VT9fOw71Tw6pyDRELhIK+KFT15uZAuSBIpOPmzkvp/j4non8SZC3IMnAy7+PMXz5KoizqyIhtjC1PajQcXaurWFwhFr/JA/yVC83OjsTsQXLJW4inpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191962; c=relaxed/simple;
	bh=bY5f5NUrAmXPEdBrsvfj96nHb5zMKiNKEpHnjthNsRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEJTzfIIzxICg6NJoFzk3Ls/1IvP1Ig75FtbIQbKeBFUEibATYzdnvoWW99XkO7fBYBYsG4ySQNc/oKhxbQkcyluCCy2ITWlFWV37z6FWWTVf4Jo5QjYu+2rXVisAMi40qti8uvF7zYB1WsiHXyGRmK7e0Dw3LmBolJhpG/rVyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BZqXvw1J; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BZqXvw1J"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664ce3000e6so2687984d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 01:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784191959; cv=none;
        d=google.com; s=arc-20260327;
        b=bdHkRPvpLsUwUMwe82QWa/r1PJgXpoceABZ/m65duaZZUaRpIlRsTZUsN9DRiOLgpc
         6q00Q9A64JaRuZ3qoVdhCoY+ldZcS7apzoGXWvGxb37ce3DOyHjsB8KAu+mkJ65wd0M6
         zbtGxnvr4Cm1yaYMlN56PztNLPUXprHQb7SgM7H6PyC8oprytUQGQCd+Cj51N9lRx6Xe
         sNgn6/Xo7KoJFr85jt33kN/G8UqovY3UdS2KFie7eZT9YaBqz9KcLNKIB0r95PsCTw51
         LrISz9b2OnjuD1AtnEIShbTqw1+BevU+mdQ7iDc+UWIgXSCcJNFQhxWsO5QU2ZKIntMC
         eXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IQq0m8gF/uxTNnEpTPTV3bbQ5uoOyMBO8OOWoNri3OY=;
        fh=V6kcQS1327tEc6/i2ebCWqEIrhHECi+Dw9tAqmakQGk=;
        b=DfKCAyZJmHd2DRmubdnL4IX6HKO23XDOAeI1azXutuJIVNxDg/mO+zXuPBNwafFsYL
         rvher+OoUCX/EWB2QDaJBhqWl6XO5KfTZB7y/kDk6FNLzUhT7ROwX3Fssk8r0W22vfwj
         eDheI9PNCwuLWMA1Ue+3/chhJygT8OZ6CrETdNa9nvxh/SzlGVh4/iB3OYfZWb+QdFOt
         z8Pi5QfmLNRE4WPAGXcuqapTOZydXYr7NnKbeXE3TPu9eoXcy3zRz5DSn8z62lcdTkl1
         rHp2WVw1pxz2qY6MLdLhOFhLgOo19WrOLCs8LlTtO58jT/N6d8dKYJSKa+BRTrkQfJxp
         l8ug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784191959; x=1784796759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IQq0m8gF/uxTNnEpTPTV3bbQ5uoOyMBO8OOWoNri3OY=;
        b=BZqXvw1Jn2gE0pu7EhpiPC0RjNydXGwOqqp7MjEMV2b0bTN402YHaKqxvcTX9UJFFu
         xT/O+fSPKXzYVkeqAJ2fv+OE0jbwOS3pQ+0uvxtCO7L8LIUgPXLK9IEri0GdKm1ImJMw
         XicxkcazlW4Oj4D5jxHy9Qh647N39g/jj/INY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191959; x=1784796759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQq0m8gF/uxTNnEpTPTV3bbQ5uoOyMBO8OOWoNri3OY=;
        b=jTryNoGPrlf+3Q5ORweNXfQ0vak5XcTba/HMxM2XoZ10EQUyifAg3ZIiGutjmzXINO
         As/ZBD2y4OpepfiOsOt7CzIm/mz2wLaeOSbilTjlo6lwdc2s6ApmgSwqH341+79MqNT8
         cbLkdVYtgqY/euL/XLLczoOm8LLMF/SBkiXvjuXdFRdY6Mg0acyCJ7p6PYp8/8L51E0L
         wMp7BGgyuhxTJHIQDErNe6QqwYos+eAhpcOkV6zFcXM010w1GOeWEq7g/6gjG/f/fQD+
         ZrXvo9dtTLvJQaXDt9S9v2xr6zSDfcIsEEiXIkyzhzQ/qUlBL0kgZNGqnyzvH77jZgZ2
         +Pkg==
X-Gm-Message-State: AOJu0YwivZNklxplq7bAVvZ6TT4avNksu2GJrccBRsT7HppVy7qyGT0r
	wzgUzcd8NCFn8hT8+4USTsz2Xo+yQMSx7UojFZG2jf9tCQYG+ErH8WDfieGvDNqFBWXJ2yWmLCg
	RRVxpCx06KMx/08Ti2dDuJTmy5FkTzDKnfAKgfyUL7hnMGBpeslaSdA==
X-Gm-Gg: AfdE7cmJ1KkJsy4nWW63l9RPuprb5VSSUPyXFGUM/teYVak2d1WjC9otkEvJBqlA6Et
	Ok2Y+mr2sMUMyTJUxHiIeIicwwmOKIFvVECIUna5IVBLx/jUrSoBPXQyNrO9JtCEPvlA9WjJfcB
	YPVV702gnewj9rpz8UV6/eVXuFm8p6oJCk/eP0WBm6gvtONRnNiByRn1nAezwLEjEdX+HrdfSu+
	ixe8xp/pADRYUauYRgTOSyVMt6WIAeL1bmsC2sswfaFa0Er/Vux5DLKT1tOfraq9Qs1rlffktxU
	Sxl3AWaYzpUsyZFK
X-Received: by 2002:a05:690e:154f:10b0:664:c436:e523 with SMTP id
 956f58d0204a3-667d7babd34mr11429992d50.57.1784191959478; Thu, 16 Jul 2026
 01:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-3-wenst@chromium.org>
 <20260715090944.2B4441F000E9@smtp.kernel.org>
In-Reply-To: <20260715090944.2B4441F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 16:52:27 +0800
X-Gm-Features: AUfX_myLEQVBTlPy6_HTTPqxRUbMK0BTjrNXj-lz-dRMS2F8a-I6Tld4DGNkvxg
Message-ID: <CAGXv+5Ffsrc9r6d_RrgL1mBW1Zmt1RxCrMCjaD7vuF3+EaeAqw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, driver-core@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The new `fwnode_graph_get_next_port_endpoint()` helper breaks th=
e `fwnode` graph abstraction by hardcoding OF-specific naming conventions, =
which will silently ignore valid ACPI and software node endpoints.
> - [Medium] `fwnode_graph_get_next_port_endpoint()` fails to unconditional=
ly put the `prev` fwnode reference if an invalid `port` is provided, violat=
ing its documented API contract.
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but iterating over=
 endpoints using `fwnode_get_next_child_node()` causes an infinite loop and=
 Use-After-Free when a device has secondary fwnodes attached.
> --
>
> --- Patch [2]: [PATCH v5 02/16] device property: Add fwnode_graph_get_nex=
t_port_endpoint() ---
> commit 8a16a51eeb8e99439d5b85ce61789ff1153e9060
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> device property: Add fwnode_graph_get_next_port_endpoint()
>
> Adds a helper function to iterate through the endpoint firmware nodes
> under a given port. This is intended to be used in USB power sequencing
> integration to verify graph connections and supported connector types.
>
> > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > index 0bd45f8b01c14..62c6221d65d05 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
>
> [ ... ]
>
> > @@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_ha=
ndle *fwnode, const char *name)
> >  }
> >  EXPORT_SYMBOL(fwnode_irq_get_byname);
> >
> > +/**
> > + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware no=
de in port
> > + * @port: Pointer to the target port firmware node
> > + * @prev: Previous endpoint node or %NULL to get the first
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer. Note that this function also puts a reference to @p=
rev
> > + * unconditionally.
> > + *
> > + * Return: an endpoint firmware node pointer or %NULL if no more endpo=
ints
> > + * are available.
> > + */
> > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct=
 fwnode_handle *port,
> > +                                                       struct fwnode_h=
andle *prev)
> > +{
> > +     do {
> > +             prev =3D fwnode_get_next_child_node(port, prev);
>
> [Severity: High]
> This is a pre-existing issue, but iterating over endpoints using
> fwnode_get_next_child_node() can cause an infinite loop and a use-after-f=
ree
> if a device has secondary fwnodes attached.
>
> If a device port has both primary children and a secondary fwnode, the pr=
imary
> ops finish and drop the reference to the last primary child, returning NU=
LL.
> Then, fwnode_get_next_child_node() incorrectly passes this same dropped c=
hild
> pointer to the secondary ops:
>
> drivers/base/property.c:fwnode_get_next_child_node() {
>         /* Try to find a child in primary fwnode */
>         next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, child);
>         if (next)
>                 return next;
>
>         /* When no more children in primary, continue with secondary */
>         return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node,=
 child);
> }
>
> This can result in a double-put. Furthermore, when traversing secondary
> children, the primary ops don't recognize the software node, treat it as =
NULL,
> and return the first primary child again, creating an infinite loop.
>
> [Severity: Medium]
> Does this fail to unconditionally put the prev reference if the provided =
port
> is invalid?
>
> If a caller passes a valid prev node but port is NULL or an error pointer=
,
> fwnode_get_next_child_node() returns early without dropping prev:
>
> drivers/base/property.c:fwnode_get_next_child_node() {
>         struct fwnode_handle *next;
>
>         if (IS_ERR_OR_NULL(fwnode))
>                 return NULL;
>     ...
> }
>
> Could this lead to a reference count leak, violating the documented API
> contract that prev is unconditionally put?

This seems like what the other fwnode_get_next_*() functions are doing.
I'd say this is a pre-existing issue as well.

> > +             if (fwnode_name_eq(prev, "endpoint"))
>
> [Severity: High]
> Does hardcoding this string match break the fwnode graph abstraction for
> non-DeviceTree platforms?
>
> By strictly matching the "endpoint" prefix, this bypasses the provider-sp=
ecific
> fwnode_operations, which could silently ignore valid ACPI and software no=
de
> endpoints that don't follow this exact naming scheme. Shouldn't this rely=
 on
> the backend-specific graph_get_next_endpoint operations instead?

From drivers/acpi/property.c it seems that ACPI graphs follow the same
structure. I don't have visibility into ACPI implementations though.

We also have the following in include/linux/fwnode.h:

#define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
#define SWNODE_GRAPH_ENDPOINT_NAME_FMT          "endpoint@%u"

So this should not be a problem.


ChenYu

> > +                     break;
> > +     } while (prev);
> > +
> > +     return prev;
> > +}
> > +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.34=
57359-1-wenst@chromium.org?part=3D2
