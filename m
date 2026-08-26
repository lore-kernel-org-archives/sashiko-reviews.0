Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F92E7391
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 03:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713928; cv=pass; b=r03h7QDBwsly18bJ9MGArkXwKfXjryybe/t9tp/wKO3AWKnQ13+cQWAThvXJP7oeZV3S+1DQCZ0RZjq1XE0ffTOJTCRwK2Rn6G0S3a7AU4nHchyMj58AOsqtRRy+p0oTXjAj/VH2nPCSYdNCUDlMefWNeAngF57AXSKIq8a49Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713928; c=relaxed/simple;
	bh=dSqBXOdyD9HPVRewoslxiTwnYYt7O/GNF6cjvWkbc2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXrocARzjcyf/i1ntbvaCg6Ize6CG8hT5nioorFLDK32p0JSUzUIAvhiEbISs0SMCEwXyVmDj3GM50Shk0Nt/xAOdRBcm7qMO7OfUjuJO18v59rApIAPOS1BwOmE6fclHb5HtCuRyLSnKaR2YZhV26aW8GPVpC99KTR09C/ZZ8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bx2XTLQf; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bx2XTLQf"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a1ffeeb471so1725481fa.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 20:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787713924; cv=none;
        d=google.com; s=arc-20260327;
        b=KsVMeGH4+JeZo+7Dqg2FmYKXnP3RfvvoNe/fRXfoD8Dx45Wmi5J4WSgKRYVQzgzj0E
         GkVtalkeyhE+DlfE/xBK+WduOIQzh+dhJJ/q518kwc9d91LWCZqlS/u4IaQ9FSqAlkIS
         ETBNu2QIbnM7JcIGRRHNDZUWbCOrFuZgVWJJ9e9TeJNx1C5F6n1NRVJfRxBAax+tkWzi
         MmLGcubm0hB4hMdTjyKiP31i4u3t6EOWTpETj1sMgPNWfBWp2mWRUmxBaYCFva4S1w+F
         sFvIr5pugwqvU2+rXnNLbelgxDHTGi5SkkWNCMW0KuiKM83wg09T0IbfI7/actspb+fA
         uWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+Qt3snVLSXt9bz85P9Y6uHkaEjgQM21tQftzjLIsxM=;
        fh=oht/03zeJy26vr7eqweJS9FghHzA6t5HUrRjAAwcA2k=;
        b=nD9Sb2rNfdY5Uq6ljEFuwWr7uUf5Pg6PvpzsYo5eGLNmKr9UL4h06EWK79GsyZgw8b
         lNB5wGL0ULQiFLHrADmJQH8DVfD3zM/7CTsuxjAUv8VFDHZzEXJwDxtkjOvuDx5aULkC
         aNHo4F6mHup+e2ECK5bnVFdpuLxxWVYeJIrVoGQSqQmel5pcv880pQ5bKEzYlhsofQ8I
         2a0EJQnpD4NCBJ2zBhMRO6mCpK6hWyojbBp1W8ETkVjFgxQOuF59VPwsmrcgfiqj5H8h
         Xqr1J3KpXzbJp3ji9crgO+CBUt3++cmCF9PwrxqgdWhdb217LF1/kbQq93ga23J1DwLL
         HvKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787713924; x=1788318724; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+Qt3snVLSXt9bz85P9Y6uHkaEjgQM21tQftzjLIsxM=;
        b=Bx2XTLQfxT3Ju7Hcg0cLKKTW3xKy8d0vffdqD4OIjJIX3hKKWgwzKk/otyOb72z7X8
         X+l8w0Q9VEDy65UR/hP+A+3tpGCGVPHNR4Ge1krNdL3sUCwNN+YFpNX9diWWscgqA2SU
         /ylcdbcSQS8j4HNk01UsOV4n1qs3ZFumEg56D0MaOEtkpLn19KZsKji7r16SnxPZnvLM
         w3eoTCoIAzWIb8pUVXsE7L/lIvUVs5kKZYp6iuUfTV9Pz/kK1GbVMjobo8K5wpzeyZDU
         6dWfEu9M8FH5YRV7tb5ZUvKGs9AFW8iS70XOGpQIZWT0F3vinNybKYpUi9xbnpTh7pq8
         q99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713924; x=1788318724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+Qt3snVLSXt9bz85P9Y6uHkaEjgQM21tQftzjLIsxM=;
        b=Uw+/NdYFdFkQeUyS5KrBrQVVjiCorCMi5h0u8a6RXIwVUNepHPG+kb+flGG8FnCNw+
         jsv4B9Gx0dRLpw0n0AQ+VUD1OpjcYB1Q7Mk6iWk3yotrLmqEPJFdxx4xjTHUvyp8ZYrA
         h6nb2sAoEwDlXcwY3KNH4b370Qz52zqTHAcHkFPVUsC91tbpfu30tyQzQ8ERdTnczcdi
         HVQ6ycXAqIrb7iJetSk4HAVSBBscES7O3MbxsLEijPrLO2ojnSrbnrvRNrdoa2Czthvm
         CC/cL9LZDJj2uPt2R2K+IDDyB4D9Zjcupmvu+b8HVdUWBCUyv94YQTPjj5JoWuP84Vfq
         +fNA==
X-Forwarded-Encrypted: i=1; AHgh+RpzZHTHe2ELhd+RpyqjV7oT0NUYgS/fjdQ38P2wnuW+V3ndmyk4raQ1qeQ2TgjYYeUK8EyUXgKPnBs0D3yPt2E=@lists.linux.dev
X-Gm-Message-State: AFuF++lXWV0ydQris9qh5JCu+UivY1RwgFTFBjhXGZDFHUdz/3yZX3w2
	5vspRpv39BYjbM72cAe5cjfexUbcIbw+fuQhQDrIFqDJYVWXA10XZy3IeJl2lhceoUSZBAohCsW
	jm2uqRuialPQy7UAZTOAFCBWKz+ldC40=
X-Gm-Gg: AR+sD11+53+Ns9F5YwRgJ5/Hz7ywxHvZ9jlXog8M+9iU2cc57jOotRQjhK0ZRBvDwvE
	hFHiK4bapknv8di8dO3YoBu7/A5Gp47wsOOPESvCMSVG7xcvcE4KR13GF7+yA12lPc/hHbHq3R0
	wwTVm01YoJiheoWgU1EmeZfxnmhz+qnXO6L/+FHm+d009fcnLLNCopaUtS2HBoyJHYGZ+JnMpQY
	Au8ut8iprVVa4HiUgs0EhV0WU4BDTAYNixRnf0kAyncg44nGNxkWifOt74cjlNtFn4sZqLms/eF
	xqll/jpbeIdLN6H6ICMmbIKk9YnGPS1wi4v16Crc0mFiWA==
X-Received: by 2002:a2e:be9d:0:b0:39b:7cd:e1ca with SMTP id
 38308e7fff4ca-3a1fd6195b9mr5546241fa.9.1787713923379; Tue, 25 Aug 2026
 20:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824144356.1f61aea2@gandalf.local.home> <20260825111210.3271443-1-bsdhenrymartin@gmail.com>
 <20260825113714.188131F000E9@smtp.kernel.org> <20260825102221.79713c98@gandalf.local.home>
In-Reply-To: <20260825102221.79713c98@gandalf.local.home>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Wed, 26 Aug 2026 11:11:51 +0800
X-Gm-Features: AcwNN1Uze5KPl3mPJAnkr6yhIlyrgGYUjcYqqqNCSUYyKI9Yp24XdzpFrCidUZY
Message-ID: <CAEnQdOoXAnfFjM_ifc6-JeT+WOdgXTwHY0Dt9sQPxbBPUKztHw@mail.gmail.com>
Subject: Re: [PATCH v3] tracing/probes: Fix use-after-free on field name/type
 of multi-probe events
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[1]: <20260826030009.1855331-1-bsdhenrymartin@gmail.com>

Thanks,

-- Henry


Steven Rostedt <rostedt@goodmis.org> =E4=BA=8E2026=E5=B9=B48=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=BA=8C 22:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 25 Aug 2026 11:37:13 +0000
> sashiko-bot@kernel.org wrote:
>
> > > diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
> > > index 36dff277de464..3057d31c57376 100644
> > > --- a/kernel/trace/trace_probe.c
> > > +++ b/kernel/trace/trace_probe.c
> > > @@ -965,19 +965,48 @@ int traceprobe_set_print_fmt(struct trace_probe=
 *tp, enum probe_print_type ptype
> > >  int traceprobe_define_arg_fields(struct trace_event_call *event_call=
,
> > >                              size_t offset, struct trace_probe *tp)
> > >  {
> > > +   struct trace_probe_event *tpe =3D trace_probe_event_from_call(eve=
nt_call);
> > >     int ret, i;
> > >
> > > +   /*
> > > +    * A field created by trace_define_field() only stores the name a=
nd
> > > +    * type pointers, it does not copy the strings. Here they point i=
nto
> > > +    * the probe_arg of @tp, which is freed when @tp is removed. For =
a
> > > +    * multi-probe event the field list is defined once by the first =
probe
> > > +    * but kept alive by the surviving siblings, so removing that fir=
st
> > > +    * probe would leave the fields referencing freed memory. Make th=
e
> > > +    * event own duplicates that live as long as the event call itsel=
f.
> > > +    */
> > > +   if (tp->nr_args) {
> > > +           tpe->field_strings =3D kcalloc(tp->nr_args * 2, sizeof(ch=
ar *),
> > > +                                        GFP_KERNEL);
> > > +           if (!tpe->field_strings)
> > > +                   return -ENOMEM;
> > > +   }
> > > +
> > >     /* Set argument names as fields */
> > >     for (i =3D 0; i < tp->nr_args; i++) {
> > >             struct probe_arg *parg =3D &tp->args[i];
> > >             const char *fmt =3D parg->type->fmttype;
> > >             int size =3D parg->type->size;
> > > +           char *name, *type;
> > >
> > >             if (parg->fmt)
> > >                     fmt =3D parg->fmt;
> > >             if (parg->count)
> > >                     size *=3D parg->count;
> > > -           ret =3D trace_define_field(event_call, fmt, parg->name,
> > > +
> > > +           name =3D kstrdup(parg->name, GFP_KERNEL);
> > > +           type =3D kstrdup(fmt, GFP_KERNEL);
> > > +           if (!name || !type) {
> > > +                   kfree(name);
> > > +                   kfree(type);
> > > +                   return -ENOMEM;
> > > +           }
> > > +           tpe->field_strings[tpe->nr_field_strings++] =3D name;
> > > +           tpe->field_strings[tpe->nr_field_strings++] =3D type;
> > > +
> > > +           ret =3D trace_define_field(event_call, type, name,
> > >                                      offset + parg->offset, size,
> > >                                      parg->type->is_signed,
> > >                                      FILTER_OTHER);
> > > +           if (ret)
> > > +                   return ret;
> >
> > [Severity: High]
> > If trace_define_field() fails, does this error path leak the newly allo=
cated
> > strings and the tpe->field_strings array?
> >
> > Looking at event_define_fields() in kernel/trace/trace_events.c, the re=
turn
> > value from this function is ignored:
> >
> >     if (field->type =3D=3D TRACE_FUNCTION_TYPE) {
> >         field->define_fields(call);
> >         break;
> >     }
> >
> > Since the return value is ignored and the event's field list remains em=
pty
> > if the first argument fails, couldn't the system invoke this function a=
gain
> > on retry if there are multiple trace array instances?
> >
> > If it is retried, the initial kcalloc() unconditionally overwrites
> > tpe->field_strings, leaking the old array.
> >
> > Additionally, since tpe->nr_field_strings is not reset on failure, woul=
dn't
> > a retry start appending string pointers out of bounds of the new array?
> > This appears like it could eventually cause trace_probe_event_free() to=
 read
> > out-of-bounds pointers and pass them to kfree().
> >
>
> The above looks legit too. Please address it.
>
> -- Steve
>
>
> > >     }
> > >     return 0;
> > >  }
> >
>
